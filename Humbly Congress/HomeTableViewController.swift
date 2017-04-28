 //
//  HomeTableViewController.swift
//  Humbly Congress
//
//  Created by Parankush Bhardwaj on 4/23/17.
//  Copyright © 2017 Parankush Bhardwaj. All rights reserved.
//

import UIKit
 
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

    var senatorID = [String]()
    var senateState = [String]()
    var senateElection = [String]()
    var senateMissedVotes = [String]()
    var senatePartyVotes = [String]()
    var senatePhoneNumber = [String]()

    
    
    
    func canOpenURL(string: String?) -> Bool {
        guard let urlString = string else {return false}
        guard let url = NSURL(string: urlString) else {return false}
        if !UIApplication.shared.canOpenURL(url as URL) {return false}
        
        //
        let regEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[regEx])
        return predicate.evaluate(with: string)
    }


    
    
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
                                                
                                                self.repPhoneNumber.append(number)
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
                                            
                                            self.senatePhoneNumber.append(number)
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
                        //print(self.senators)

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
    
    
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if(houseOrSenate.selectedSegmentIndex == 0) {
            //performSegue(withIdentifier: "reuseIdentifier", sender: self.representatives[indexPath.row])
            
            performSegue(withIdentifier: "reuseIdentifier", sender: self.repLinks[indexPath.row])
            
        }
            
        else {
            
            //performSegue(withIdentifier: "reuseIdentifier", sender:  self.senators[indexPath.row])
            performSegue(withIdentifier: "reuseIdentifier", sender:  self.senateLinks[indexPath.row])
            
        }

        
        //let vc = storyboard?.instantiateViewController(withIdentifier: "Detail")
        
        //self.navigationController?.pushViewController(vc!, animated: true)
    }
   
    */
    
    /*
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return objectArray[section].state
    
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
        
        let detailedController = segue.destination as! DetailViewController
        
        
        
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
