//
//  DetailViewController.swift
//  Humbly Congress
//
//  Created by Parankush Bhardwaj on 4/25/17.
//  Copyright © 2017 Parankush Bhardwaj. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet var legislatorName: UILabel!
    
    
    @IBOutlet var portrait: UIImageView!
    
    
    @IBOutlet var numberForCalling: UIButton!
    
    
    @IBAction func call(_ sender: UIButton) {
        
        if let url = URL(string: phoneNumber) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
    }
    
    
    @IBOutlet var state: UILabel!
    
    @IBOutlet var nextElection: UILabel!
    
    
    
    @IBOutlet var percentAbsent: UILabel!
    
    @IBOutlet var percentPartyMatch: UILabel!
    
    
    
    
    @IBOutlet var sumIndividuals: UILabel!
    
    @IBOutlet var sumPACS: UILabel!
    
    
    
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
    
    
    var donors = String()
    var individuals = String()
    var pacs = String()
    
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
                print("ERROR")
            }
            else {
                print("parsing")
                if let content = data {
                    do {
                        let JSON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let results = JSON["results"] as? [[String: Any]] {
                            for result in results {
                                
                                if let roles = result["roles"] as? [[String: Any]] {
                                    
                                    for role in roles {
                                        
                                        if let fecID = role["fec_candidate_id"] as? String {
                                            
                                            self.fecNumber = fecID
                                            print(fecID)
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
                print("parsing")
                if let content = data {
                    do {
                        let JSON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let results = JSON["results"] as? [[String: Any]] {
                            for result in results {
                                
                                //get total number of donors
                                if let total = result["total_receipts"] as? String {
                                    self.donors = total
                                    print(total)
                                }
                            
                                //get money from donors
                                if let indv = result["total_from_individuals"] as? String {
                                    self.individuals = indv
                                }
                                
                                //get money from PACS
                                if let pac = result["total_from_pacs"] as? String {
                                    self.pacs = pac
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

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getFECid()
        
        getData()
        

        
        if(color == "R") {
            self.view.backgroundColor = UIColor(red: 191/255, green: 115/255, blue: 115/255, alpha: 1)
        }
        else  {
            self.view.backgroundColor = UIColor(red: 115/255, green: 148/255, blue: 191/255, alpha: 1)
        }
        
        
        
        legislatorName.text = myName
        
        self.navigationItem.title = myName
        
        
        state.text = "State: " + stateInitial

        nextElection.text = "Next Election: " + electionCycle
        
        percentAbsent.text = "% Missed Votes: " + missedVotes
        
        percentPartyMatch.text = "% Voted With Party: " + partyVotes
        
        
        numberForCalling.setTitle("Office: " + phoneNumber, for: .normal)
        
        
        
        //now do finance section
        sumIndividuals.text = "Money from Individual Donors: " + individuals
        
        sumPACS.text = "Money from PACS: " + pacs
        
        

        
        portrait.sd_setImage(with: URL(string: bioGuide))
        portrait.sd_setImage(with: URL(string: bioGuide), placeholderImage: #imageLiteral(resourceName: "iCon"))
        
        
        portrait.layer.borderWidth = 1
        portrait.layer.masksToBounds = false
        portrait.layer.borderColor = UIColor.white.cgColor
        portrait.layer.cornerRadius = portrait.frame.width/2
        portrait.clipsToBounds = true
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
