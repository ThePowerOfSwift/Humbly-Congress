//
//  DetailViewController.swift
//  Humbly Congress
//
//  Created by Parankush Bhardwaj on 4/25/17.
//  Copyright © 2017 Parankush Bhardwaj. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
    
    
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
    
    
    @IBOutlet var viewBills: UIButton!
    
    //since this is a view controller that doesn't have tables with cells, no need to use arrays to store data.
    
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
    
    var id = String()
    
    //get the fec id to use for later stuff.
    
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
                }
            }
            
        }
        task.resume()
        
    }
        
    
    
    func getData() {
        
        //create the url needd for parsing.
        
        print(idNumber)
        
        var urlForJSON = "https://api.propublica.org/congress/v1/members/" + idNumber + ".json"

        
        //now that we constructed the url, morph it to a actual URL type
        var url = URL(string: urlForJSON)
        
        //send server the API key
        var request = NSMutableURLRequest(url: url!)
        request.setValue("AzuJWcFuUg3f0iLuL5zrl5M8RExaka469UWE81df", forHTTPHeaderField: "X-API-Key" )
        request.httpMethod = "GET"
        var session = URLSession.shared
        
        var task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if error != nil {
                print("ERROR")
            }
            else {
                print("parsing1")
                if let content = data {
                    do {
                        let JSON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let results = JSON["results"] as? [[String: Any]] {
                            for result in results {
                                
                                if let roles = result["roles"] as? [[String: Any]] {
                                    
                                    for role in roles {
                                        
                                        if let fecID = role["fec_candidate_id"] as? String {
                                            
                                            self.fecNumber = fecID
                                            print("fec nuber:" )
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

        //create the url needd for parsing.
        
        urlForJSON = "https://api.propublica.org/campaign-finance/v1/2016/candidates/" + self.fecNumber + ".json"
        
        
        //now that we constructed the url, morph it to a actual URL type
        url = URL(string: urlForJSON)
        
        //send server the API key
        request = NSMutableURLRequest(url: url!)
        request.setValue("AzuJWcFuUg3f0iLuL5zrl5M8RExaka469UWE81df", forHTTPHeaderField: "X-API-Key" )
        request.httpMethod = "GET"
        session = URLSession.shared
        
        
        task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if error != nil {
                print("ERROR")
            }
            else {
                print("parsing!")
                if let content = data {
                    
                    print(content)
                    do {
                        let JSON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        print("hello")
                        
                        
                        if let results = JSON["results"] as? [[String: Any?]] {
                            
                            print("wokring1")
                            
                            for result in results {
                                
                                print("working2")
                                //get total number of donors
                                if let total = result["total_receipts"] as? Double {
                                    print("working3")
                                    self.donors = total
                                    print(total)
                                }
                            
                                //get money from donors
                                if let indv = result["total_from_individuals"] as? Double {
                                    print("hello!")
                                    self.individuals = indv
                                }
                                
                                //get money from PACS
                                if let pac = result["total_from_pacs"] as? Double {
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
        
        
        
        getData()
        

        
        if(color == "R") {
            self.view.backgroundColor = UIColor(red: 191/255, green: 115/255, blue: 115/255, alpha: 1)
            
            self.numberForCalling.setTitleColor(UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1), for: .normal)
            
            self.viewBills.setTitleColor(UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1), for: .normal)
        }
        else  {
            self.view.backgroundColor = UIColor(red: 115/255, green: 148/255, blue: 191/255, alpha: 1)
            
             self.numberForCalling.setTitleColor(UIColor(red: 255/255, green: 122/255, blue: 0/255, alpha: 1), for: .normal)
            
            self.viewBills.setTitleColor(UIColor(red: 255/255, green: 122/255, blue: 0/255, alpha: 1), for: .normal)
            
        }
        
        
        self.navigationItem.title = myName
        
        
        state.text = "State: " + stateInitial

        nextElection.text = "Next Election: " + electionCycle
        
        percentAbsent.text = "% Missed Votes: " + missedVotes
        
        percentPartyMatch.text = "% Voted With Party: " + partyVotes
        
        
        numberForCalling.setTitle("Call Office", for: .normal)
        
        
       
        
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
    

    @IBOutlet var back: UINavigationItem!
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        let billController = segue.destination as! BillsTableViewController
        
        billController.memberID = idNumber
        
    
    }
    

}
