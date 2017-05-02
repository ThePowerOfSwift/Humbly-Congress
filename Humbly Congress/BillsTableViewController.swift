//
//  BillsTableViewController.swift
//  Humbly Congress
//
//  Created by Parankush Bhardwaj on 5/1/17.
//  Copyright © 2017 Parankush Bhardwaj. All rights reserved.
//

import UIKit

class individualBill: UITableViewCell {
    
    
    @IBOutlet var billTitle: UILabel!
    
    
    @IBOutlet var introducedDate: UILabel!
    
    
    @IBOutlet var billNumber: UILabel!
    
    
    
    @IBAction func goToLink(_ sender: UIButton) {
        if(link != "nil") {
            getBillData()
            //UIApplication.shared.open(URL(string: (url))!)
        }
        
    }
    
    var link = "nil"
    
    
    var url = String()
    
    
    func getBillData() {
        
        //create the url needd for parsing.
        let urlForJSON = link
        
        //now that we constructed the url, morph it to a actual URL type
        let url = URL(string: urlForJSON)
        
        //send server the API key
        let request = NSMutableURLRequest(url: url!)
        request.setValue("AzuJWcFuUg3f0iLuL5zrl5M8RExaka469UWE81df", forHTTPHeaderField: "X-API-Key" )
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if error != nil {
                print("ERROR!")
            }
            else {
                print("parsing?")
                if let content = data {
                    do {
                        let JSON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let results = JSON["results"] as? [[String: Any]] {
                            for result in results {
                                
                                if let urlLink = result["govtrack_url"] as? String {
                                    
                                    //self.url = urlLink
                                    UIApplication.shared.open(URL(string: (urlLink))!)
                                }
                                
                            }
                        }
                        
                    }
                    catch {
                        
                    }
                    //self.tableView.reloadData()
                }
            }
            
        }
        task.resume()
        
    }

    
    
    
    
    
}


class BillsTableViewController: UITableViewController {
    
    var memberID = ""
    
    var titles = [String]()
    
    var dates = [String]()
    
    var numbers = [String]()
    
    var urls = [String]()
    
    func getBillData() {
        
        //create the url needd for parsing.
        
        var urlForJSON = "https://api.propublica.org/congress/v1/members/"
        
        urlForJSON += memberID
        
        urlForJSON += "/bills/introduced.json"
        
        print(urlForJSON)
        
     
        //now that we constructed the url, morph it to a actual URL type
        let url = URL(string: urlForJSON)
        
        //send server the API key
        let request = NSMutableURLRequest(url: url!)
        request.setValue("AzuJWcFuUg3f0iLuL5zrl5M8RExaka469UWE81df", forHTTPHeaderField: "X-API-Key" )
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if error != nil {
                print("ERROR!")
            }
            else {
                print("parsing?")
                if let content = data {
                    do {
                        let JSON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let results = JSON["results"] as? [[String: Any]] {
                            for result in results {
                                
                                if let bills = result["bills"] as? [[String: Any]] {
                                    for bill in bills {
                                        
                                        //bill Number
                                        if let billNumber = bill["number"] as? String {
                                            
                                            self.numbers.append(billNumber)
                                        }
                                        
                                        //bill Title
                                        if let billTitle = bill["title"] as? String {
                                            
                                            self.titles.append(billTitle)
                                        }
                                    
                                        //bill Introduction
                                        if let billIntroduced = bill["introduced_date"] as? String {
                                            
                                            self.dates.append(billIntroduced)
                                        }
                                        
                                        //bill URL
                                        if let billURL = bill["bill_uri"] as? String {
                                            
                                            self.urls.append(billURL)
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
       
        getBillData()
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
        return titles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bill", for: indexPath)
        
        
        let billCode = self.numbers[indexPath.row]
        
        let billName = self.titles[indexPath.row]
        
        let billDate = self.dates[indexPath.row]
        
        let webURL = self.urls[indexPath.row]
        
        
        if let theCell = cell as? individualBill {
            
            theCell.billNumber.text = "Bill Number: " + billCode
            
            theCell.billTitle.text = billName
            
            theCell.introducedDate.text = "Date Introduced: " + billDate
            
            theCell.link = webURL
        
        
        }
        
        
        // Configure the cell...

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
