//
//  LoginVC.swift
//  InVision Test App
//
//  Created by MK on 27/07/2017.
//  Copyright © 2017 Muhammad Khan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {
    
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

    @IBAction func loginBtn(_ sender: Any) {
        
        if let email = userEmailField.text, let password = userPasswordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    self.userEmailField.text = ""
                    self.userPasswordField.text = ""
                    self.performSegue(withIdentifier: "loginVC", sender: self)
                } else {
                    self.errorLbl.text = error as? String
                }
            }
        } else {
            errorLbl.text = "Authentication Failed"
        }
        
        userEmailField.resignFirstResponder()
        userPasswordField.resignFirstResponder()
    }

    @IBAction func signUpBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "NewSignUp", sender: self)
        
        userPasswordField.resignFirstResponder()
        userEmailField.resignFirstResponder()
    }
}
