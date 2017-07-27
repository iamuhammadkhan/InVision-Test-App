//
//  LoginVC.swift
//  InVision Test App
//
//  Created by MK on 27/07/2017.
//  Copyright © 2017 Muhammad Khan. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var userEmailField: UITextField!
    
    @IBOutlet weak var userPasswordField: UITextField!

    @IBOutlet weak var errorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func loginBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "loginVC", sender: self)
    }

    @IBAction func signUpBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "NewSignUp", sender: self)
    }

}

