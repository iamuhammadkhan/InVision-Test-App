//
//  TimelineVC.swift
//  InVision Test App
//
//  Created by MK on 27/07/2017.
//  Copyright © 2017 Muhammad Khan. All rights reserved.
//

import UIKit

class TimelineVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func addPostBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "AddPostVC", sender: self)
    }
   
}
