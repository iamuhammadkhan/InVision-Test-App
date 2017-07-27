//
//  AddPostVC.swift
//  InVision Test App
//
//  Created by MK on 27/07/2017.
//  Copyright © 2017 Muhammad Khan. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController {
    
    @IBOutlet weak var newPostImage: UIImageView!
    
    @IBOutlet weak var newPostText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func postAddedBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
   
}
