//
//  PoliticianTableViewController.swift
//  Humbly Congress
//
//  Created by Parankush Bhardwaj on 3/31/17.
//  Copyright © 2017 Parankush Bhardwaj. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import MessageUI

class Politician: UITableViewCell {
    
    
    @IBOutlet var portrait: UIImageView!
    
    
    @IBOutlet weak var name: UILabel!
    
    
    @IBOutlet var number: UILabel!
    
    
    @IBAction func call(_ sender: UIButton) {
        print("calling")
        
        if let url = URL(string: number.text!) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
}




class PoliticianTableViewController: UITableViewController, CLLocationManagerDelegate {
    
    let messageComposer = MessageComposer()


    @IBAction func faxPolitician(_ sender: UIButton) {
        
        print("faxing")
        
        if (messageComposer.canSendText()) {
            // Obtain a configured MFMessageComposeViewController
            let messageComposeVC = messageComposer.configuredMessageComposeViewController()
            
            // Present the configured MFMessageComposeViewController instance
            // Note that the dismissal of the VC will be handled by the messageComposer instance,
            // since it implements the appropriate delegate call-back
            present(messageComposeVC, animated: true, completion: nil)
        } else {
            print("Not allowed to fax.")
        }
        
    }
    
    
    
    //get your location.
    
    let locationManager = CLLocationManager()
    
    
    //put in a default random one
    var zipcode: String = "33328"
    
    var nameOfThePolitician = " "
    
    
    @IBOutlet var politicianTableView: UITableView!
    
   
    
    
    
    
    var numbers = [" "," "," "]
    
    var names = [" "," "," "]
    
    
    
    
    var imageURLs = [ "https://theunitedstates.io/images/congress/original/",
                      "https://theunitedstates.io/images/congress/original/",
                      "https://theunitedstates.io/images/congress/original/"]
    
    var bioguide = [" "," "," "]
    
    var imageView = [UIImage(), UIImage(), UIImage()]
    
    var imageCounter = 0
    
    var counter = 0
    


    
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { () -> Void in
                self.imageView[self.counter] = UIImage(data: data)!
                self.counter += 1
            }
        }
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //for debugging reasons, reinit counter to 0 here.
        counter = 0
        
        //first, get the user's location
        let userLocation = CLLocationManager().location!
        
        let latitude = "\(String(describing: userLocation.coordinate.latitude))"
        let longitude = "\(String(describing: userLocation.coordinate.longitude))"
        
        
        //next, use that location to create a link that uses an API to get the user's representatives.
        var urlForJSON = "https://congress.api.sunlightfoundation.com/legislators/locate?latitude="
        urlForJSON += latitude
        urlForJSON += "&longitude="
        urlForJSON += longitude
        let url = URL(string: urlForJSON)
        
        //this counter is created so we can parse the data through the table cell
        var counterCell = 0
        
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("ERROR")
            }
            else {
                if let content = data {
                    do {
                        let JSON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let results = JSON["results"] as? [[String: Any]] {
                            for result in results {
                                
                                //read the title of the politician (senator or representative)
                                if let title = result["title"] as? String {
                                    self.names[counterCell] = (title)
                                }
                                //read the first name of the politician
                                if let firstName = result["first_name"] as? String {
                                    self.names[counterCell] += " "
                                    self.names[counterCell] += firstName
                                }
                                //read the second name of the policitian
                                if let lastName = result["last_name"] as? String {
                                    self.names[counterCell] += " "
                                    self.names[counterCell] += lastName
                                }
                                
                                //now go to numbers
                                if let number = result["phone"] as? String {
                                    var numberWithpreFix = "tel://"
                                    var realNumber = String()
                                    realNumber = number.replacingOccurrences(of: "-", with: "")
                                    numberWithpreFix = numberWithpreFix + realNumber
                                    self.numbers[counterCell] = numberWithpreFix
                                }
                                
                                //now go to bioID (for images)
                                if let id = result["bioguide_id"] as? String {
                                    self.bioguide[counterCell] = id
                                    self.imageURLs[counterCell] += "\(self.bioguide[counterCell]).jpg"
                                    let urlA = URL(string: self.imageURLs[counterCell])
                                    self.downloadImage(url: urlA!)
                                    self.imageCounter += 1
                                    
                                }
                                counterCell += 1
                            }
                        }
                    }
                    catch {
                        
                    }
                    self.tableView.reloadData()
                }
            }
            
        }
        task.resume()
        
    }
    

    
    
    
    //below, we load data table
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    
    var hellocounter = 0;
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
        print("bye")
        
         
        if hellocounter < 600 {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            hellocounter += 1;
        }
         
        
        print("hello")
        
 
        
        //self.tableView.reloadData()
        let cell = tableView.dequeueReusableCell(withIdentifier: "Politician", for: indexPath)
        
        
        //names = names.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedDescending }
        
        //below, each new variable grabs a specfic index of its value.
        let nameOfPolitician = self.names[indexPath.row]
        let numberToCall = self.numbers[indexPath.row]
        
        let imageOfPolitician = self.imageView[indexPath.row]
        
        if let politicianCell = cell as? Politician {
            
            //below, we set the 3 attribetus of each cell (name of politician, number, and their image)
            politicianCell.name?.text = nameOfPolitician
            
            //politicianCell.imageOfPolitician.image = UIImage(named: imageOfPolitician)
            politicianCell.portrait.image = imageOfPolitician
            
            politicianCell.number?.text = numberToCall
            
            //below, we are making the image circular
            politicianCell.portrait.layer.borderWidth = 1
            politicianCell.portrait.layer.masksToBounds = false
            politicianCell.portrait.layer.borderColor = UIColor.white.cgColor
            politicianCell.portrait.layer.cornerRadius = politicianCell.portrait.frame.width/2
            politicianCell.portrait.clipsToBounds = true
            
        }
        
        return cell
        
        
    }

    
    
}






