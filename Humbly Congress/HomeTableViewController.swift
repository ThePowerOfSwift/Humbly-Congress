 //
//  HomeTableViewController.swift
//  Humbly Congress
//
//  Created by Parankush Bhardwaj on 4/23/17.
//  Copyright © 2017 Parankush Bhardwaj. All rights reserved.
//

import UIKit
import TwicketSegmentedControl

 
 class individualCell: UITableViewCell {
    
    @IBOutlet var nameOfPolitician: UILabel!
    
    
    @IBOutlet var imageOfPolitician: UIImageView!
    
    
 }

 

class HomeTableViewController: UITableViewController {
    
    
    @IBOutlet var houseOrSenate: UISegmentedControl!
    
    
    
    @IBAction func switcher(_ sender: UISegmentedControl) {
        
        self.tableView.reloadData()
    }
    
    
    var representatives = [String]()
    var repLinks = [String]()
    var repParty = [String]()
    
    
    var senators = [String]()
    var senateLinks = [String]()
    var senateParty = [String]()
    
    
    
    //these bottom vars will be used for segue.
    
    var repID = [String]()
    var repState = [String]()
    var repElection = [String]()
    var repMissedVotes = [String]()
    var repPartyVotes = [String]()
    var repPhoneNumber = [String]()
    var repFecNumber = [String]()


    var senatorID = [String]()
    var senateState = [String]()
    var senateElection = [String]()
    var senateMissedVotes = [String]()
    var senatePartyVotes = [String]()
    var senatePhoneNumber = [String]()
    var senateFecNumber = [String]()

    
    //use prorepubica api to get data of all US reps
    
    func getRepData() {
        
            //create the url needd for parsing.
        
            let urlForJSON = "https://api.propublica.org/congress/v1/115/house/members.json"
        
        
            //now that we constructed the url, morph it to a actual URL type
            let url = URL(string: urlForJSON)
            
            //send server the API key
            let request = NSMutableURLRequest(url: url!)
            request.setValue("AzuJWcFuUg3f0iLuL5zrl5M8RExaka469UWE81df", forHTTPHeaderField: "X-API-Key" )
            request.httpMethod = "GET"
            let session = URLSession.shared
            
            let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
                if error != nil {
                    print("ERROR")
                }
                else {
                    print("parsing")
                    if let content = data {
                        do {
                            let JSON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            
                            if let results = JSON["results"] as? [[String: Any]] {
                                for result in results {
                                    
                                    
                                    if let members = result["members"] as? [[String: Any]] {
                                        for member in members {
                                            
                                            if let firstName = member["first_name"] as? String {
                                                
                                                if let lastName = member["last_name"] as? String {
                                                    
                                                    self.representatives.append(firstName + " " + lastName)
                                                
                                                }
                                                
                                            }
                                            
                                            //now do images.
                                            if let linkForImage = member["id"] as? String {
                                                
                                                self.repLinks.append("https://theunitedstates.io/images/congress/450x550/" + linkForImage + ".jpg")
                                                
                                                self.repID.append(linkForImage)
                                            
                                            }
                                            
                                            //now do party (used for background cell image)
                                            if let politicalParty = member["party"] as? String {
                                            
                                                self.repParty.append(politicalParty)
                                            }
                                            
                                            //now do phone number
                                            if let number = member["phone"] as? String {
                                                
                                                var numberWithpreFix = "tel://"
                                                var realNumber = String()
                                                realNumber = number.replacingOccurrences(of: "-", with: "")
                                                numberWithpreFix = numberWithpreFix + realNumber
                                                
                                                self.repPhoneNumber.append(numberWithpreFix)
                                            }
                                            
                                            
                                            //now do election
                                            if let electionYear = member["next_election"] as? String {
                                                
                                                self.repElection.append(electionYear)
                                            }
                                            
                                            
                                            //now do state initial
                                            if let stateFrom = member["state"] as? String {
                                                
                                                self.repState.append(stateFrom)
                                            }
                                            
                                            //now do missed votes
                                            if let missedVotes = member["missed_votes_pct"] as? String {
                                                
                                                self.repMissedVotes.append(missedVotes)
                                            }
                                            
                                            
                                            //now do party alliegence
                                            if let votesWithParty = member["votes_with_party_pct"] as? String {
                                                
                                                self.repPartyVotes.append(votesWithParty)
                                            }
                                            
                                        }
                                        
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
    
    
    //now get all senate data.
    
    
    func getSenateData() {
        
        //create the url needd for parsing.
        
        let urlForJSON = "https://api.propublica.org/congress/v1/115/senate/members.json"
        
        
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
                                    print("roles")
                                    for role in roles {
                                        print("roles2")
                                        
                                        if let fecID = role["fec_candidate_id"] as? String {
                                            print("roles3")
                                            self.senateFecNumber.append(fecID)
                                            //print(fecID)
                                        }
                                        
                                    }
                                }
                                
                                if let members = result["members"] as? [[String: Any]] {
                                    
                                    for member in members {
                                        
                                        if let firstName = member["first_name"] as? String {
                                            
                                            if let lastName = member["last_name"] as? String {
                                                
                                                self.senators.append(firstName + " " + lastName)
                                                
                                            }
                                            
                                        }
                                        
                                        //now do images.
                                        if let linkForImage = member["id"] as? String {
                                            
                                            self.senateLinks.append("https://theunitedstates.io/images/congress/450x550/" + linkForImage + ".jpg")
                                            
                                            self.senatorID.append(linkForImage)
                                            
                                        }
                                        
                                        //now do party (used for background cell image)
                                        if let politicalParty = member["party"] as? String {
                                            
                                            self.senateParty.append(politicalParty)
                                        }
                                        
                                        //now do phone number
                                        if let number = member["phone"] as? String {
                                            var numberWithpreFix = "tel://"
                                            var realNumber = String()
                                            realNumber = number.replacingOccurrences(of: "-", with: "")
                                            numberWithpreFix = numberWithpreFix + realNumber
                                            
                                            self.senatePhoneNumber.append(numberWithpreFix)
                                        }
                                        
                                        //now do election
                                        if let electionYear = member["next_election"] as? String {
                                            
                                            self.senateElection.append(electionYear)
                                        }
                                        
                                        //now do state initial
                                        if let stateFrom = member["state"] as? String {
                                            
                                            self.senateState.append(stateFrom)
                                        }
                                        
                                        //now do missed votes
                                        if let missedVotes = member["missed_votes_pct"] as? String {
                                            
                                            self.senateMissedVotes.append(missedVotes)
                                        }
                                        
                                        //now do party alliegence
                                        if let votesWithParty = member["votes_with_party_pct"] as? String {
                                            
                                            self.senatePartyVotes.append(votesWithParty)
                                        }

                                        
                                    }

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

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getRepData()
        getSenateData()
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //change tableview depending on which segement was selected (house or senate)
        
        if(houseOrSenate.selectedSegmentIndex == 0) {
            return representatives.count
        }
        else {
            return senators.count
        }
  
        
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as UITableViewCell!
        
        let imageView = cell?.viewWithTag(1) as! UIImageView
        
        
        
        
        //make imageview circular
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.clipsToBounds = true
        
        //fill data with rep stuff if rep was selected from the segment
        
        if(houseOrSenate.selectedSegmentIndex == 0) {
            
            let representativesName = self.representatives[indexPath.row]
            
            let colorOfCell = self.repParty[indexPath.row]
        
        
            if let legislatorCell = cell as? individualCell {
            
                legislatorCell.nameOfPolitician?.text = representativesName
                
                if (colorOfCell == "R") {
                    
                    legislatorCell.backgroundColor = UIColor(red: 191/255, green: 115/255, blue: 115/255, alpha: 1)
                
                } else  {
                    
                    legislatorCell.backgroundColor = UIColor(red: 115/255, green: 148/255, blue: 191/255, alpha: 1)

                }
                
                imageView.sd_setImage(with: URL(string: repLinks[indexPath.row]), placeholderImage: #imageLiteral(resourceName: "iCon"))

            }
            
        } else {
            
            //fill with senate stuff if senate segment was selected
            
            let senatorName = self.senators[indexPath.row]
            
            let colorOfCell = self.senateParty[indexPath.row]

            
            if let legislatorCell = cell as? individualCell {
                
                legislatorCell.nameOfPolitician?.text = senatorName
                
                if (colorOfCell == "R") {
                    
                    legislatorCell.backgroundColor = UIColor(red: 191/255, green: 115/255, blue: 115/255, alpha: 1)
                    
                } else  {
                    
                    legislatorCell.backgroundColor = UIColor(red: 115/255, green: 148/255, blue: 191/255, alpha: 1)
                    
                }
                
                //imageView.sd_setImage(with: URL(string: senateLinks[indexPath.row]))
                
                imageView.sd_setImage(with: URL(string: senateLinks[indexPath.row]), placeholderImage: #imageLiteral(resourceName: "iCon"))

                //there are two images that are nil, so just fill them with fake images to avoid a nill exception
                if indexPath.row == 46 {
                    imageView.sd_setImage(with: URL(string: self.senateLinks[1]))
                }
                else if indexPath.row == 88 {
                    imageView.sd_setImage(with: URL(string: self.senateLinks[1]))
                }
                else {
                    imageView.sd_setImage(with: URL(string: self.senateLinks[indexPath.row]), placeholderImage: #imageLiteral(resourceName: "iCon"))
                }
                
               
                
            }
        
        }
        
        
        
       return cell!
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
        
        let detailedController = segue.destination as! DetailViewController
        
        //if a specific cell was selected, depending on which segemnet it was in, use the index of that cell to 
        //load info to detail view controller.

        if(houseOrSenate.selectedSegmentIndex == 0) {
            
            
            detailedController.myName = self.representatives[indexPath.row]
            detailedController.bioGuide = self.repLinks[indexPath.row]
            detailedController.idNumber = self.repID[indexPath.row]
            
            
            detailedController.stateInitial = self.repState[indexPath.row]
            detailedController.electionCycle = self.repElection[indexPath.row]
            detailedController.missedVotes = self.repMissedVotes[indexPath.row]
            detailedController.partyVotes = self.repPartyVotes[indexPath.row]
            detailedController.phoneNumber = self.repPhoneNumber[indexPath.row]
            detailedController.color = self.repParty[indexPath.row]
        }
        
        else {
            
            detailedController.myName = self.senators[indexPath.row]
            detailedController.bioGuide = self.senateLinks[indexPath.row]
            detailedController.idNumber = self.senatorID[indexPath.row]
            
            
            detailedController.stateInitial = self.senateState[indexPath.row]
            detailedController.electionCycle = self.senateElection[indexPath.row]
            detailedController.missedVotes = self.senateMissedVotes[indexPath.row]
            detailedController.partyVotes = self.senatePartyVotes[indexPath.row]
            detailedController.phoneNumber = self.senatePhoneNumber[indexPath.row]
            detailedController.color = self.senateParty[indexPath.row]

        }
        
    }
    

}
 
 
 extension HomeTableViewController: TwicketSegmentedControlDelegate {
    func didSelect(_ segmentIndex: Int) {
        self.tableView.reloadData()
        print("Selected index: \(segmentIndex)")
    }
 }
