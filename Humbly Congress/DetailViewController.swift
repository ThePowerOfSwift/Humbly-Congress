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
    }
    
    
    @IBOutlet var state: UILabel!
    
    @IBOutlet var nextElection: UILabel!
    
    
    
    @IBOutlet var percentAbsent: UILabel!
    
    @IBOutlet var percentPartyMatch: UILabel!
    
    
    
    
    @IBOutlet var sumIndividuals: UILabel!
    
    @IBOutlet var sumPACS: UILabel!
    
    
    
    
    
    
    var myName = String()
    
    var bioGuide = String()
    
    
    
    
    var fecNumber = String()
        
    
    
    
    func getData() {
        
        //create the url needd for parsing.
        
        let urlForJSON = "https://api.propublica.org/congress/v1/members/" + bioGuide + ".json"
        
        
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
                                        
                                        if let stateInitial = role["state"] as? String {
                                            
                                            self.state.text = "State: " + stateInitial
                                        }
                                        
                                        //now do images.
                                        if let fecID = role["fec_candidate_id"] as? String {
                                            
                                            self.fecNumber = fecID
                                        }
                                        
                                        //now do end date for term
                                        if let matchedVotes = role["end_date"] as? String {
                                            
                                            self.nextElection.text = "End of Term: " + matchedVotes
                                        }
                                        
                                        //now do party (used for background cell image)
                                        if let number = role["phone"] as? String {

                                            self.numberForCalling.setTitle(number, for: .normal)
                                        }
                                        
                                        //now do missed votes
                                        if let missedVotes = role["missed_votes_pct"] as? String {
                                        
                                            self.percentAbsent.text = "% of times absent for a vote: " + missedVotes
                                        }
                                        
                                        //now do matched votes with party
                                        if let matchedVotes = role["votes_with_party_pct"] as? String {
                                            
                                            self.percentPartyMatch.text = "Total sum from PACS: " + matchedVotes
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

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()

        
        legislatorName.text = myName
        
        
        portrait.sd_setImage(with: URL(string: bioGuide))
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
