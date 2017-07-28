//
//  AddPostVC.swift
//  InVision Test App
//
//  Created by MK on 27/07/2017.
//  Copyright © 2017 Muhammad Khan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var ref: FIRDatabaseReference?
    
    @IBOutlet weak var newPostImage: UIImageView!
    
    @IBOutlet weak var newPostText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
    }
    @IBAction func addImage(_ sender: Any) {
        
        let imageControllerPicker = UIImagePickerController()
        imageControllerPicker.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imageControllerPicker.sourceType = .camera
                self.present(imageControllerPicker, animated: true, completion: nil)
            } else {
                print("Camera is not available")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (UIAlertAction) in
            imageControllerPicker.sourceType = .photoLibrary
            self.present(imageControllerPicker, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.newPostImage.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        newPostText.resignFirstResponder()
    }
    
    @IBAction func postAddedBtn(_ sender: Any) {
        
        let storageRef = FIRStorage.storage().reference().child("Posts/Images")

        if let uploadImage = UIImagePNGRepresentation(self.newPostImage.image!) {
            storageRef.put(uploadImage, metadata: nil)
        }
        
        let postText = newPostText.text!
//        let postImage = newPostImage.image!
//
//        let postDetails = ["postImage": postImage, "postText": postText] as [String : Any]
        
        self.ref?.child("Posts").childByAutoId().setValue([postText])
        
        newPostText.resignFirstResponder()
        
        performSegue(withIdentifier: "update", sender: self)
    }
}
