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
    
    //initialize variables from storyboard
    
    @IBOutlet var portrait: UIImageView!
    
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet var fax: UIButton!
    
    
    @IBOutlet var callDesign: UIButton!
        
    @IBAction func call(_ sender: UIButton) {
        if let url = URL(string: officePhone) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    //this below string is filled eventually with a number, used by call button above.
    
    var officePhone = String()
    
}




class PoliticianTableViewController: UITableViewController, CLLocationManagerDelegate {
    
    let messageComposer = MessageComposer()

    //below var used for faxing, not in cell class since the fax button is the same for every cell.
    
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
    
    
    
    

    
    @IBOutlet var politicianTableView: UITableView!
    
   //arrays that are filled later through JSON parsing
    
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
    
    var locationManager: CLLocationManager!
    
    var userLocation = CLLocationManager().location
    
    //this function grabs user location to get lat long coords (which we need for finding local politicians)
    
    func getLocation() {
        
        
        
        locationManager.delegate = self
        userLocation = locationManager.location
        
        
 
        //only use lat long coords for json reading if access to user's location is possible (prevents crash when location is unknown)
        if userLocation != nil  {
        
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
                                    
                                    //now do party.
                                    if let party = result["party"] as? String {
                                        
                                        self.parties.append(party)
                                        
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
    
    
    //now use a different api for more data, is called by getLocation.
    
    
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
    

    
    //used to authorize location at first launch
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    getLocation()
                }
            }
        }
    }
    
    
    
    var counterForDispatch = 0

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        if CLLocationManager.authorizationStatus() != .authorizedAlways {
            locationManager.requestAlwaysAuthorization()
            getLocation()
        }
        else {
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
        
        //safety check incase location was not loaded yet.
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
    
        //sets each cell a respective index of the array of the data.
        
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
                
                politicianCell.callDesign.setTitleColor(UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1), for: .normal)
                
                politicianCell.fax.setTitleColor(UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1), for: .normal)
                
                
            } else  {
                
                politicianCell.backgroundColor = UIColor(red: 115/255, green: 148/255, blue: 191/255, alpha: 1)
                
                 politicianCell.callDesign.setTitleColor(UIColor(red: 255/255, green: 122/255, blue: 0/255, alpha: 1), for: .normal)
                
                 politicianCell.fax.setTitleColor(UIColor(red: 255/255, green: 122/255, blue: 0/255, alpha: 1), for: .normal)
                
            }
            
            
        }
        
        return cell!
        
        
    }
    
    //we give certain vars to detail view controller when a specific cell is tapped on
    
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






