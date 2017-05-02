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
    
        
    @IBAction func call(_ sender: UIButton) {
        if let url = URL(string: officePhone) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
    var officePhone = String()
    
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
    
    
    
    
    
    //put in a default random one
    //var zipcode: String = "33328"
    
    
    @IBOutlet var politicianTableView: UITableView!
    
   
    
    var numbers = [String]()
    
    var names = [String]()
    
    var links = [String]()
    
    var bioguides = [String]()

    var parties = [String]()
    
    
    var absentPercentages = [String]()
    
    var partyVotes = [String]()
    
    var states = [String]()

    var elections = [String]()
    
    //get your location.
    
    let locationManager = CLLocationManager()
    
    var userLocation = CLLocationManager().location
    

    
    
   
    
    func getLocation() {
        
        locationManager.delegate = self
        userLocation = locationManager.location
        
        
        if CLLocationManager.authorizationStatus() != .authorizedAlways     // Check authorization for location tracking
        {
            locationManager.requestAlwaysAuthorization()                    // LocationManager will callbackdidChange... once user responds
            locationManager.delegate = self
            userLocation = locationManager.location
        } else {
            locationManager.startUpdatingLocation()
            userLocation = locationManager.location
        }
        

        if userLocation != nil {
        
            userLocation = CLLocationManager().location!
        
            let latitude = "\(String(describing: userLocation!.coordinate.latitude))"
            let longitude = "\(String(describing: userLocation!.coordinate.longitude))"
        
            print(latitude)
            print(longitude)
        
        
            //next, use that location to create a link that uses an API to get the user's representatives.
            var urlForJSON = "https://congress.api.sunlightfoundation.com/legislators/locate?latitude="
            urlForJSON += latitude
            urlForJSON += "&longitude="
            urlForJSON += longitude
            let url = URL(string: urlForJSON)
        
            
            let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                if error != nil {
                    print("ERROR")
                }
                else {
                    print("pasring")
                    if let content = data {
                        do {
                            let JSON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                            if let results = JSON["results"] as? [[String: Any]] {
                                for result in results {
                                
                                    //read name
                                    if let title = result["title"] as? String {
                                        
                                        if let firstName = result["first_name"] as? String {
                                            if let lastName = result["last_name"] as? String {
                                                self.names.append(title + " " + firstName + " " + lastName)
                                            }

                                        }
                                        
                                    }
                                    
                                    //now do images and call getData
                                    if let id = result["bioguide_id"] as? String {
                                        
                                        self.links.append("https://theunitedstates.io/images/congress/450x550/" + id + ".jpg")
                                        
                                        self.bioguides.append(id)
                                        
                                        self.getData(id: id)
                                    }
                                    
                                    //phone number
                                    if let phone = result["phone"] as? String {
                                        
                                        var numberWithpreFix = "tel://"
                                        let realNumber = phone.replacingOccurrences(of: "-", with: "")
                                        numberWithpreFix = numberWithpreFix + realNumber
                                        
                                        self.numbers.append(numberWithpreFix)
                                    }

                                    
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
    }
    
    
    
    
    
    func getData(id: String) {
        
        //create the url needd for parsing.
        
        let urlForJSON = "https://api.propublica.org/congress/v1/members/" + id + ".json"
        
        //now that we constructed the url, morph it to a actual URL type
        let url = URL(string: urlForJSON)
        
        //send server the API key
        let request = NSMutableURLRequest(url: url!)
        request.setValue("AzuJWcFuUg3f0iLuL5zrl5M8RExaka469UWE81df", forHTTPHeaderField: "X-API-Key" )
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if error != nil {
                //print("ERROR")
            }
            else {
                //print("parsing")
                if let content = data {
                    do {
                        let JSON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let results = JSON["results"] as? [[String: Any]] {
                            for result in results {
                                
                                if let roles = result["roles"] as? [[String: Any]] {
                                    
                                    for role in roles {
                                        
                                        //missed votes
                                        if let missedVotes = role["missed_votes_pct"] as? String {
                                            
                                            self.absentPercentages.append(missedVotes)
                                        }
                                        
                                        //votes aligned with party majority
                                        if let partyAllegiance = role["votes_with_party_pct"] as? String {
                                            
                                            self.partyVotes.append(partyAllegiance)
                                        }
                                        
                                        //now do party.
                                        if let party = role["party"] as? String {
                                            
                                            self.parties.append(party)
                                            
                                        }
                                        
                                        //now do state initial
                                        if let stateFrom = role["state"] as? String {
                                            
                                            self.states.append(stateFrom)
                                            
                                        }
                                        
                                        //now do election cycle
                                        if let nextElection = role["end_date"] as? String {
                                            
                                            self.elections.append(nextElection)
                                            
                                        }
                                    }
                                }
                                
                            }
                        }
                        
                    }
                    catch {
                        
                    }
                }
            }
            
        }
        task.resume()
        
    }
    

    
    
    
    
    
    
    
    var counterForDispatch = 0

    override func viewDidLoad() {
        
        super.viewDidLoad()
        

        if CLLocationManager.authorizationStatus() != .authorizedAlways     // Check authorization for location tracking
        {
            locationManager.requestAlwaysAuthorization()                    // LocationManager will callbackdidChange... once user responds
            locationManager.delegate = self
            userLocation = locationManager.location
            getLocation()
            
            /*
            if(userLocation == nil) {
                getLocation()
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
            */

            if counterForDispatch < 500 {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                counterForDispatch += 1
            }
            
        } else {
            locationManager.startUpdatingLocation()
            userLocation = locationManager.location
            getLocation()
        }
        
        
        
        locationManager.delegate = self
        userLocation = locationManager.location

        
    }
    

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if(userLocation == nil) {
            
            getLocation()
            
        }
        
     
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Politician", for: indexPath) as UITableViewCell!
        
        
        let imageView = cell?.viewWithTag(1) as! UIImageView
        
        //make imageview circular
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.clipsToBounds = true

        
        
        let nameOfPolitician = self.names[indexPath.row]
        
        let numberToCall = self.numbers[indexPath.row]
        
        let colorOfCell = self.parties[indexPath.row]

        
        if let politicianCell = cell as? Politician {
            
            //below, we set the 3 attribetus of each cell (name of politician, number, and their image)
            politicianCell.name?.text = nameOfPolitician
            
            
            politicianCell.officePhone = numberToCall

            
            imageView.sd_setImage(with: URL(string: self.links[indexPath.row]), placeholderImage: #imageLiteral(resourceName: "iCon"))

            if (colorOfCell == "R") {
                
                politicianCell.backgroundColor = UIColor(red: 191/255, green: 115/255, blue: 115/255, alpha: 1)
                
            } else  {
                
                politicianCell.backgroundColor = UIColor(red: 115/255, green: 148/255, blue: 191/255, alpha: 1)
                
            }
            
        }
        
        return cell!
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
        
        let detailedController = segue.destination as! DetailViewController
        
        
        detailedController.myName = self.names[indexPath.row]
        
        //bioguide for detail view is the link for image downloads.
        detailedController.bioGuide = self.links[indexPath.row]
        
        //id number for detail view is the id# we insert in a url to download images.
        detailedController.idNumber = self.bioguides[indexPath.row]
        
        
        detailedController.stateInitial = self.states[indexPath.row]
        
        detailedController.electionCycle = self.elections[indexPath.row]
        
        detailedController.missedVotes = self.absentPercentages[indexPath.row]
        
        detailedController.partyVotes = self.partyVotes[indexPath.row]
        
        detailedController.phoneNumber = self.numbers[indexPath.row]
        
        detailedController.color = self.parties[indexPath.row]
        
        
    }
    
    
}






