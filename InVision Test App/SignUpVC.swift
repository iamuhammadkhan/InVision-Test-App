//
//  SignUpVC.swift
//  InVision Test App
//
//  Created by MK on 27/07/2017.
//  Copyright © 2017 Muhammad Khan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpVC: UIViewController {
    
    @IBOutlet weak var userEmailField: UITextField!
    
    @IBOutlet weak var userPasswordField: UITextField!

    @IBOutlet weak var errorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        userEmailField.resignFirstResponder()
        userPasswordField.resignFirstResponder()
    }

    @IBAction func signUpBtn(_ sender: Any) {
        
        if let email = userEmailField.text, let password = userPasswordField.text {
            FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    self.userEmailField.text = ""
                    self.userPasswordField.text = ""
                    self.performSegue(withIdentifier: "SignUpVC", sender: self)
                } else {
                    self.errorLbl.text = "Sign Up Failed, Try Again"
                }
            }
        }
        
        userPasswordField.resignFirstResponder()
        userEmailField.resignFirstResponder()
    }
}
