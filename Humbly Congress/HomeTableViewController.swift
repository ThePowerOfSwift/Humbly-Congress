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
    
 }

 

class HomeTableViewController: UITableViewController {
    
    
    struct Objects {
        var state: String!
        var name: [String]!
        //var representativeImages: [UIImage]!
    }
    
    //var objectArray = [Objects]()
    

    
    var stateAndReps = ["AL" : [String](), "AK" : [String](), "AZ" : [String](), "AR" : [String](), "CA" : [String](),
                        "CO" : [String](), "CT" : [String](), "DE" : [String](), "FL" : [String](), "GA" : [String](),
                        "HI" : [String](), "ID" : [String](), "IL" : [String](), "IN" : [String](), "IA" : [String](),
                        "KS" : [String](), "KY" : [String](), "LA" : [String](), "ME" : [String](), "MD" : [String](),
                        "MA" : [String](), "MI" : [String](), "MN" : [String](), "MS" : [String](), "MO" : [String](),
                        "MT" : [String](), "NE" : [String](), "NV" : [String](), "NH" : [String](), "NJ" : [String](),
                        "NM" : [String](), "NY" : [String](), "NC" : [String](), "ND" : [String](), "OH" : [String](),
                        "OK" : [String](), "OR" : [String](), "PA" : [String](), "RI" : [String](), "SC" : [String](),
                        "SD" : [String](), "TN" : [String](), "TX" : [String](), "UT" : [String](), "VT" : [String](),
                        "VA" : [String](), "WA" : [String](), "WV" : [String](), "WI" : [String](), "WY" : [String]()]
    
    
    
    var objectArray = [Objects(state: "AL", name: [String]()), Objects(state: "AK", name: [String]()),
                       Objects(state: "AZ", name: [String]()), Objects(state: "AR", name: [String]()),
                       Objects(state: "CA", name: [String]()), Objects(state: "CO", name: [String]()),
                       Objects(state: "CT", name: [String]()), Objects(state: "DE", name: [String]()),
                       Objects(state: "FL", name: [String]()), Objects(state: "GA", name: [String]()),
                       Objects(state: "HI", name: [String]()), Objects(state: "ID", name: [String]()),
                       Objects(state: "IL", name: [String]()), Objects(state: "IN", name: [String]()),
                       Objects(state: "IA", name: [String]()), Objects(state: "KS", name: [String]()),
                       Objects(state: "KY", name: [String]()), Objects(state: "LA", name: [String]()),
                       Objects(state: "ME", name: [String]()), Objects(state: "MD", name: [String]()),
                       Objects(state: "MA", name: [String]()), Objects(state: "MI", name: [String]()),
                       Objects(state: "MN", name: [String]()), Objects(state: "MS", name: [String]()),
                       Objects(state: "MO", name: [String]()), Objects(state: "MT", name: [String]()),
                       Objects(state: "NE", name: [String]()), Objects(state: "NV", name: [String]()),
                       Objects(state: "NH", name: [String]()), Objects(state: "NJ", name: [String]()),
                       Objects(state: "NM", name: [String]()), Objects(state: "NY", name: [String]()),
                       Objects(state: "NC", name: [String]()), Objects(state: "ND", name: [String]()),
                       Objects(state: "OH", name: [String]()), Objects(state: "OK", name: [String]()),
                       Objects(state: "OR", name: [String]()), Objects(state: "PA", name: [String]()),
                       Objects(state: "RI", name: [String]()), Objects(state: "SC", name: [String]()),
                       Objects(state: "SD", name: [String]()), Objects(state: "TN", name: [String]()),
                       Objects(state: "TX", name: [String]()), Objects(state: "UT", name: [String]()),
                       Objects(state: "VT", name: [String]()), Objects(state: "VA", name: [String]()),
                       Objects(state: "WA", name: [String]()), Objects(state: "WV", name: [String]()),
                       Objects(state: "WI", name: [String]()), Objects(state: "WY", name: [String]())]
  
    
    
    func getRepData() {
        
        for eachState in stateAndReps.keys {
        
            //create the url needd for parsing.
            var urlForJSON = "https://api.propublica.org/congress/v1/members/senate/"
            urlForJSON += eachState
            urlForJSON += "/current.json"
            
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
                                    
                                    //read the title of the politician (senator or representative)
                                    if let name = result["name"] as? String {
                                        self.stateAndReps[eachState]?.append(name)
                                    }
                                }
                                //print(self.stateAndReps)
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
 
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRepData()
        
        print(stateAndReps)
        
        /*
        for (key, value) in stateAndReps {
            objectArray.append(Objects(state: key, name: value))
        }
        */
        
        
        for eachState in stateAndReps.keys {
            objectArray.append(Objects(state: eachState, name: stateAndReps[eachState]))
        }
         
         
        print(objectArray)
        
        
        
        //Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false

        //Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return objectArray.count
        //return 50
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of rows
       // return listOfReps[section].representativeNames.count
        
        //we are writting out all the number of rows per section
        //this is EXTREMELy messy and dirty, but it makes the app feel much more "speedy" since 
        //you no longer have to wait for the table view to load the lenth of the rows.
    /*
        if (objectArray[section].state == "AL") {
            return 7
        }
        else if (objectArray[section].state == "AK") {
            return 1
        }
        else if (objectArray[section].state == "AZ") {
            return 9
        }
        else if (objectArray[section].state == "AR") {
            return 4
        }
        else if (objectArray[section].state == "CA") {
            return 53
        }
        else if (objectArray[section].state == "CO") {
            return 7
        }
        else if (objectArray[section].state == "CT") {
            return 5
        }
        else if (objectArray[section].state == "DE") {
            return 1
        }
        else if (objectArray[section].state == "FL") {
            return 27
        }
        else if (objectArray[section].state == "GA") {
            return 14
        }
        else if (objectArray[section].state == "HI") {
            return 2
        }
        else if (objectArray[section].state == "ID") {
            return 2
        }
        else if (objectArray[section].state == "IL") {
            return 18
        }
        else if (objectArray[section].state == "IN") {
            return 9
        }
        else if (objectArray[section].state == "IA") {
            return 4
        }
        else if (objectArray[section].state == "KS") {
            return 4
        }
        else if (objectArray[section].state == "KY") {
            return 6
        }
        else if (objectArray[section].state == "LA") {
            return 6
        }
        else if (objectArray[section].state == "ME") {
            return 2
        }
        else if (objectArray[section].state == "MD") {
            return 8
        }
        else if (objectArray[section].state == "MA") {
            return 9
        }
        else if (objectArray[section].state == "MI") {
            return 14
        }
        else if (objectArray[section].state == "MN") {
            return 8
        }
        else if (objectArray[section].state == "MS") {
            return 4
        }
        else if (objectArray[section].state == "MO") {
            return 8
        }
        else if (objectArray[section].state == "MT") {
            return 1
        }
        else if (objectArray[section].state == "NE") {
            return 3
        }
        else if (objectArray[section].state == "NV") {
            return 4
        }
        else if (objectArray[section].state == "NH") {
            return 2
        }
        else if (objectArray[section].state == "NJ") {
            return 12
        }
        else if (objectArray[section].state == "NM") {
            return 3
        }
        else if (objectArray[section].state == "NY") {
            return 27
        }
        else if (objectArray[section].state == "NC") {
            return 13
        }
        else if (objectArray[section].state == "ND") {
            return 1
        }
        else if (objectArray[section].state == "OH") {
            return 16
        }
        else if (objectArray[section].state == "OK") {
            return 5
        }
        else if (objectArray[section].state == "OR") {
            return 5
        }
        else if (objectArray[section].state == "PA") {
            return 18
        }
        else if (objectArray[section].state == "RI") {
            return 2
        }
        else if (objectArray[section].state == "SC") {
            return 7
        }
        else if (objectArray[section].state == "SD") {
            return 1
        }
        else if (objectArray[section].state == "TN") {
            return 9
        }
        else if (objectArray[section].state == "TX") {
            return 36
        }
        else if (objectArray[section].state == "UT") {
            return 4
        }
        else if (objectArray[section].state == "VT") {
            return 1
        }
        else if (objectArray[section].state == "VA") {
            return 11
        }
        else if (objectArray[section].state == "WA") {
            return 10
        }
        else if (objectArray[section].state == "WV") {
            return 3
        }
        else if (objectArray[section].state == "WI") {
            return 8
        }
        else if (objectArray[section].state == "WY") {
            return 1
        }
        else {
            print("somethins is wrong")
            return 1
        }
        */
        
        return 2
        
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as UITableViewCell!
        
        
        if let legislatorCell = cell as? individualCell {
            
            //legislatorCell.nameOfPolitician?.text = objectArray[indexPath.section].name[indexPath.row]
            legislatorCell.nameOfPolitician?.text = "Hello"
            

        }

        return cell!
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        return objectArray[section].state
    
       /*

        if (objectArray[section].state == "AL") {
            return "Alabama"
        }
        else if (objectArray[section].state == "AK") {
            return "Alaska"
        }
        else if (objectArray[section].state == "AZ") {
            return "Arizona"
        }
        else if (objectArray[section].state == "AR") {
            return "Arkansas"
        }
        else if (objectArray[section].state == "CA") {
            return "California"
        }
        else if (objectArray[section].state == "CO") {
            return "Colorado"
        }
        else if (objectArray[section].state == "CT") {
            return "Connecticut"
        }
        else if (objectArray[section].state == "DE") {
            return "Deleware"
        }
        else if (objectArray[section].state == "FL") {
            return "Florida"
        }
        else if (objectArray[section].state == "GA") {
            return "Georgia"
        }
        else if (objectArray[section].state == "HI") {
            return "Hawaii"
        }
        else if (objectArray[section].state == "ID") {
            return "Idaho"
        }
        else if (objectArray[section].state == "IL") {
            return "Illinois"
        }
        else if (objectArray[section].state == "IN") {
            return "Indiana"
        }
        else if (objectArray[section].state == "IA") {
            return "Iowa"
        }
        else if (objectArray[section].state == "KS") {
            return "Kansas"
        }
        else if (objectArray[section].state == "KY") {
            return "Kentucky"
        }
        else if (objectArray[section].state == "LA") {
            return "Louisiana"
        }
        else if (objectArray[section].state == "ME") {
            return "Maine"
        }
        else if (objectArray[section].state == "MD") {
            return "Maryland"
        }
        else if (objectArray[section].state == "MA") {
            return "Massachusetts"
        }
        else if (objectArray[section].state == "MI") {
            return "Michigan"
        }
        else if (objectArray[section].state == "MN") {
            return "Minnesota"
        }
        else if (objectArray[section].state == "MS") {
            return "Mississippi"
        }
        else if (objectArray[section].state == "MO") {
            return "Missouri"
        }
        else if (objectArray[section].state == "MT") {
            return "Montana"
        }
        else if (objectArray[section].state == "NE") {
            return "Nebraska"
        }
        else if (objectArray[section].state == "NV") {
            return "Nevada"
        }
        else if (objectArray[section].state == "NH") {
            return "New Hampshire"
        }
        else if (objectArray[section].state == "NJ") {
            return "New Jersey"
        }
        else if (objectArray[section].state == "NM") {
            return "New Mexico"
        }
        else if (objectArray[section].state == "NY") {
            return "New York"
        }
        else if (objectArray[section].state == "NC") {
            return "North Carolina"
        }
        else if (objectArray[section].state == "ND") {
            return "North Dakota"
        }
        else if (objectArray[section].state == "OH") {
            return "Ohio"
        }
        else if (objectArray[section].state == "OK") {
            return "Oklahoma"
        }
        else if (objectArray[section].state == "OR") {
            return "Oregon"
        }
        else if (objectArray[section].state == "PA") {
            return "Pennsylvania"
        }
        else if (objectArray[section].state == "RI") {
            return "Rhode Island"
        }
        else if (objectArray[section].state == "SC") {
            return "South Carolina"
        }
        else if (objectArray[section].state == "SD") {
            return "South Dakota"
        }
        else if (objectArray[section].state == "TN") {
            return "Tennessee"
        }
        else if (objectArray[section].state == "TX") {
            return "Texas"
        }
        else if (objectArray[section].state == "UT") {
            return "Utah"
        }
        else if (objectArray[section].state == "VT") {
            return "Vermont"
        }
        else if (objectArray[section].state == "VA") {
            return "Virgina"
        }
        else if (objectArray[section].state == "WA") {
            return "Washington"
        }
        else if (objectArray[section].state == "WV") {
            return "West Virgina"
        }
        else if (objectArray[section].state == "WI") {
            return "Wisconsin"
        }
        else if (objectArray[section].state == "WY") {
            return "Wyoming"
        }
        else {
            return ""
        }
  
      */
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
