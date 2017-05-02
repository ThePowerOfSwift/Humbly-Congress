//
//  PoliticianInfoTableViewController.swift
//  Humbly Congress
//
//  Created by Parankush Bhardwaj on 5/1/17.
//  Copyright © 2017 Parankush Bhardwaj. All rights reserved.
//

import UIKit

class Legislator: UITableViewCell {

    
    @IBOutlet var portrait: UIImageView!
    
    var phoneNumber = String()

    @IBAction func call(_ sender: UIButton) {
        if let url = URL(string: phoneNumber) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBOutlet var numberToCall: UIButton!
    
    @IBOutlet var state: UILabel!
    
    
    @IBOutlet var nextElection: UILabel!
    
    
    
    
    @IBOutlet var percentAbsent: UILabel!
    
    
    @IBOutlet var percentPartyMatch: UILabel!
    
    
    @IBOutlet var sumIndividuals: UILabel!
    
    
    @IBOutlet var sumPacs: UILabel!
    
    

}

class PoliticianInfoTableViewController: UITableViewController {
    
    
    
    
    var stateInitial = String()
    var electionCycle = String()
    var missedVotes = String()
    var partyVotes = String()
    
    var phoneNumber = String()
    
    
    var myName = String()
    
    var bioGuide = String()
    
    var idNumber = String()
    
    var fecNumber = String()
    
    var color = String()
    
    
    var donors = Double()
    var individuals = Double()
    var pacs = Double()
    
    func getFECid() {
        
        //create the url needd for parsing.
        
        let urlForJSON = "https://api.propublica.org/congress/v1/members/" + idNumber + ".json"
        
        
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
                                        
                                        if let fecID = role["fec_candidate_id"] as? String {
                                            
                                            self.fecNumber = fecID
                                            //print(fecID)
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
    
    
    
    func getData() {
        
        //create the url needd for parsing.
        
        let urlForJSON = "https://api.propublica.org/campaign-finance/v1/2016/candidates/" + fecNumber + ".json"
        
        
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
                print("parsing!")
                if let content = data {
                    do {
                        let JSON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let results = JSON["results"] as? [[String: Any]] {
                            
                            print("working")
                            for result in results {
                                
                                //get total number of donors
                                if let total = result["total_receipts"] as? Double {
                                    self.donors = total
                                    print(total)
                                }
                                
                                //get money from donors
                                if let indv = result["total_from_individuals"] as? Double {
                                    self.individuals = indv
                                    //self.sumIndividuals.text = indv
                                }
                                
                                //get money from PACS
                                if let pac = result["total_from_pacs"] as? Double {
                                    self.pacs = pac
                                    //self.sumPACS.text = pac
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
        
        
        getFECid()
        
        getData()
        

        self.navigationItem.title = myName

        if(color == "R") {
            self.view.backgroundColor = UIColor(red: 191/255, green: 115/255, blue: 115/255, alpha: 1)
        }
        else  {
            self.view.backgroundColor = UIColor(red: 115/255, green: 148/255, blue: 191/255, alpha: 1)
        }

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "one", for: indexPath)
        
        let imageView = cell.viewWithTag(1) as! UIImageView

        //make imageview circular
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.clipsToBounds = true


        // Configure the cell...
        
        if let view = cell as? Legislator {
            
            
            view.state.text = "State: " + stateInitial
            
            view.nextElection.text = "Next Election: " + electionCycle
            
            view.percentAbsent.text = "% Missed Votes: " + missedVotes
            
            view.percentPartyMatch.text = "% Voted With Party: " + partyVotes
            
            
            view.numberToCall.setTitle("Call Office", for: .normal)
            
            
            
            //now do finance section
            view.sumIndividuals.text = "Money from Individual Donors: $\(individuals) "
            
            view.sumPacs.text = "Money from PACS: $\(pacs)"
            
            
            
            //now do image
            view.portrait.sd_setImage(with: URL(string: bioGuide), placeholderImage: #imageLiteral(resourceName: "iCon"))
            
        }


        return cell
    }
    

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let billController = segue.destination as! BillsTableViewController
        
        billController.memberID = idNumber
    }
    

}





































