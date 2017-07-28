//
//  TimelineCell.swift
//  InVision Test App
//
//  Created by MK on 27/07/2017.
//  Copyright © 2017 Muhammad Khan. All rights reserved.
//

import UIKit

class TimelineCell: UITableViewCell {
    
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var postText: UILabel!

    func setPost (newPost: Posts) {
        
        self.postImage.image = newPost.image
        self.postText.text = newPost.post
    }
}
