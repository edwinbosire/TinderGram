//
//  EBButton.swift
//  InstaSwipe
//
//  Created by edwin bosire on 20/10/2015.
//  Copyright © 2015 Edwin Bosire. All rights reserved.
//

import UIKit
import pop

class EBButton: UIButton {

	override func awakeFromNib() {
		super.awakeFromNib()
		setupAnimations()
	}
	
	func setupAnimations() {
	
		self.addTarget(self, action: Selector("scaleToSmall"), forControlEvents: .TouchDown)
		self.addTarget(self, action: Selector("scaleToSmall"), forControlEvents: .TouchDragEnter)
		self.addTarget(self, action:  Selector( "scaleAnimation"), forControlEvents: .TouchUpInside)
		self.addTarget(self, action:  Selector("scaleToDefault"), forControlEvents: .TouchDragExit)
		self.addTarget(self, action:  Selector("scaleToDefault"), forControlEvents: .TouchCancel)
	}
	
	func scaleToSmall() {
		
		let scaleToSmallAnimation = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
		scaleToSmallAnimation.toValue = NSValue(CGPoint: CGPoint(x:0.85, y: 0.85))
		self.layer.pop_addAnimation(scaleToSmallAnimation, forKey: "scaleAnimation")
	}
	
	func scaleAnimation() {
		
		let scaleAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
		scaleAnimation.toValue = NSValue(CGPoint: CGPoint(x: 1.0, y: 1.0))
		scaleAnimation.velocity = NSValue(CGPoint: CGPoint(x: 3.0, y: 3.0))
		scaleAnimation.springBounciness = 18.0
		self.layer.pop_addAnimation(scaleAnimation, forKey: "scalePopAnimation")
	}
	
	func scaleToDefault() {
		
		let scaleToDefault = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
		scaleToDefault.toValue = NSValue(CGPoint: CGPoint(x:1.0, y: 1.0))
		self.layer.pop_addAnimation(scaleToDefault, forKey: "scaleToDefault")
		
	}

}
