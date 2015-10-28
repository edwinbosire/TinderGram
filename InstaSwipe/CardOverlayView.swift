//
//  OverlayView.swift
//  InstaSwipe
//
//  Created by edwin bosire on 18/10/2015.
//  Copyright © 2015 Edwin Bosire. All rights reserved.
//

import UIKit
import Koloda

private let overlayRightImageName = "yesImageOverLay"
private let overlayLeftImageName = "noImageOverLay"

class CardOverlayView: OverlayView {

	@IBOutlet lazy var overlayImageView: UIImageView! = {
		[unowned self] in
		
		var imageView = UIImageView(frame: self.bounds)
		self.addSubview(imageView)
		
		return imageView
		}()
	
	override func awakeFromNib() {
		super.awakeFromNib()
		self.layer.cornerRadius = 10.0
		self.layer.masksToBounds = true;
	}
	
	override var overlayState:OverlayMode  {
		didSet {
			switch overlayState {
			case .Left :
				overlayImageView.image = UIImage(named: overlayLeftImageName)
			case .Right :
				overlayImageView.image = UIImage(named: overlayRightImageName)
			default:
				overlayImageView.image = nil
			}
			
		}
	}
	
}
