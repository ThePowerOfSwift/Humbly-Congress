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
    
    var myName = String()
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        legislatorName.text = myName

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
