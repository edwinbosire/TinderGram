//
//  SignInLandingViewController.swift
//  InstaSwipe
//
//  Created by edwin bosire on 19/10/2015.
//  Copyright © 2015 Edwin Bosire. All rights reserved.
//

import UIKit


class SignInLandingViewController: UIViewController {

	@IBOutlet weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
		signInButton.layer.cornerRadius = 5.0
    }

	override func viewDidAppear(animated: Bool) {
		self.navigationController?.navigationBarHidden = true;
	}
	
	override func viewDidDisappear(animated: Bool) {
		self.navigationController?.navigationBarHidden = false;
	}
	
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .Default
	}
}
