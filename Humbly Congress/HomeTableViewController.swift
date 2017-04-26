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
    
    var senators = [String]()

    
    
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

                                        }
                                    }

                                }
                            }
                            print(self.representatives)

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
        
        if(houseOrSenate.selectedSegmentIndex == 0) {
            return representatives.count
        }
        else {
            return senators.count
        }
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as UITableViewCell!
        
        
        
        if(houseOrSenate.selectedSegmentIndex == 0) {
            
            let representativesName = self.representatives[indexPath.row]
        
        
            if let legislatorCell = cell as? individualCell {
            
                legislatorCell.nameOfPolitician?.text = representativesName
            
            }
        } else {
            
            let senatorName = self.senators[indexPath.row]
            
            
            if let legislatorCell = cell as? individualCell {
                
                legislatorCell.nameOfPolitician?.text = senatorName
                
            }
        
        }
        

       return cell!
    }
    
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
