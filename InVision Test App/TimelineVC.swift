//
//  TimelineVC.swift
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

class TimelineVC: UIViewController {
    
    var posts: [Posts] = []
    
    var ref: FIRDatabaseReference!
    var handle: FIRDatabaseHandle!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        
        handle = ref?.child("Posts").observe(.childAdded, with: { (snapshot) in
            if let post = snapshot.value as? String {
                self.posts.append((post as? Posts)!)
                self.tableView.reloadData()
            }
        })
        
        self.tableView.reloadData()
    }

    @IBAction func addPostBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "AddPostVC", sender: self)
    }
   
    @IBAction func signoutBtn(_ sender: Any) {
        
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        dismiss(animated: true, completion: nil)
    }
}

extension TimelineVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myPost = posts[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TimelineCell
        
        cell?.setPost(newPost: myPost)
        
        return cell!
    }
}
