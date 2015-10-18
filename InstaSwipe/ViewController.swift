//
//  ViewController.swift
//  InstaSwipe
//
//  Created by edwin bosire on 18/10/2015.
//  Copyright © 2015 Edwin Bosire. All rights reserved.
//

import UIKit
import Koloda
import pop
import InstagramKit

class ViewController: UIViewController, KolodaViewDataSource, KolodaViewDelegate {
	
	@IBOutlet weak var kolodaView: KolodaView!
	var cardsCollection: [CardView] = []
	
	//MARK: Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		kolodaView.dataSource = self
		kolodaView.delegate = self
		
		self.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
		
		loadMedia()
	}
	
	func loadMedia(){
		let manager = InstagramManager.shared()

		manager.retrieveFeeds { (items, error) -> Void in
			
			if  let feedItems = items  {
				
				NSLog("Loaded feeds %@", feedItems)
				
				for item in feedItems {
					
					let view = NSBundle.mainBundle().loadNibNamed("CardView", owner: self, options: nil)[0] as! CardView
					view.media = item as! InstagramMedia
					self.cardsCollection += [view]
				}
				
				self.kolodaView.reloadData()
			}
			
			if let anError = error {
				NSLog("Error loading feeds %@", anError);
			}
			
		}
	}
	//MARK: IBActions
	@IBAction func leftButtonTapped() {
		kolodaView?.swipe(SwipeResultDirection.Left)
	}
	
	@IBAction func rightButtonTapped() {
		kolodaView?.swipe(SwipeResultDirection.Right)
	}
	
	@IBAction func undoButtonTapped() {
		loadMedia()
	}
	
	//MARK: KolodaViewDataSource
	func kolodaNumberOfCards(koloda: KolodaView) -> UInt {
		return UInt(cardsCollection.count)
	}
	
	func kolodaViewForCardAtIndex(koloda: KolodaView, index: UInt) -> UIView {
//		let view = NSBundle.mainBundle().loadNibNamed("CardView", owner: self, options: nil)[0] as! UIView
		let view = cardsCollection[Int(index)]
		return view
	}
	func kolodaViewForCardOverlayAtIndex(koloda: KolodaView, index: UInt) -> OverlayView? {
		return NSBundle.mainBundle().loadNibNamed("CardOverlayView", owner: self, options: nil)[0] as? OverlayView
	}
	
	//MARK: KolodaViewDelegate
	
	func kolodaDidSwipedCardAtIndex(koloda: KolodaView, index: UInt, direction: SwipeResultDirection) {
		//Example: loading more cards
//		if index >= 3 {
//			numberOfCards = 6
//			kolodaView.reloadData()
//		}
	}
	
	func kolodaDidRunOutOfCards(koloda: KolodaView) {
		//Example: reloading
		kolodaView.resetCurrentCardNumber()
	}
	
	func kolodaDidSelectCardAtIndex(koloda: KolodaView, index: UInt) {
		NSLog("Present detail view")
	}
	
	func kolodaShouldApplyAppearAnimation(koloda: KolodaView) -> Bool {
		return true
	}
	
	func kolodaShouldMoveBackgroundCard(koloda: KolodaView) -> Bool {
		return true
	}
	
	func kolodaShouldTransparentizeNextCard(koloda: KolodaView) -> Bool {
		return true
	}
	
	func kolodaBackgroundCardAnimation(koloda: KolodaView) -> POPPropertyAnimation? {
		return nil
	}
	
}


