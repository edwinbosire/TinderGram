//
//  CardView.swift
//  InstaSwipe
//
//  Created by edwin bosire on 18/10/2015.
//  Copyright © 2015 Edwin Bosire. All rights reserved.
//

import UIKit
import InstagramKit

class CardView: UIView {
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var profileImage: UIImageView!
	@IBOutlet weak var userName: UILabel!
	@IBOutlet weak var comment: UILabel!
	@IBOutlet weak var commentCount: UILabel!
	@IBOutlet weak var likesCount: UILabel!
	
	
	var media: InstagramMedia {
		
		get {
			return self.media
		}
		set (newMedia){
			
			let url:NSURL = newMedia.standardResolutionImageURL
			let profilePicURL = newMedia.user.profilePictureURL
			let placeholder = UIImage(named: "doge")
			
//			if(_media.isVideo){
//				self.movieIcon.hidden = NO;
//			}
			imageView.setImageWithURL(url, placeholderImage: placeholder)
			profileImage.setImageWithURL(profilePicURL, placeholderImage:placeholder);
			
			profileImage.layer.cornerRadius = 30.0
			profileImage.layer.masksToBounds = true;
			profileImage.layer.borderColor = UIColor.whiteColor().CGColor;
			profileImage.layer.borderWidth = 2.0;
			
			userName.text = newMedia.user.username
			comment.text = newMedia.caption.text
			likesCount.text = ("\(newMedia.likesCount) Likes")
			commentCount.text = ("\(newMedia.commentCount) Comments")

		}
	}
	
	
 override func awakeFromNib() {
	super.awakeFromNib()
	
	}
	
}
