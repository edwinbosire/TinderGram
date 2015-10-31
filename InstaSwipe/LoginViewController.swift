//
//  LoginViewController.swift
//  InstaSwipe
//
//  Created by edwin bosire on 18/10/2015.
//  Copyright © 2015 Edwin Bosire. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoginViewController: UIViewController, UIWebViewDelegate {

	@IBOutlet weak var webView: UIWebView!
	 var loadingIndicatorView: NVActivityIndicatorView!
	
	let Instagram:InstagramManager = InstagramManager.shared()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		loadingIndicatorView = NVActivityIndicatorView(frame: self.view.frame, type: .BallClipRotate, color: UIColor.blackColor(), size: CGSize(width: 44, height: 44));
		loadingIndicatorView.hidden = true
		self.view.addSubview(loadingIndicatorView)
		
       webView.scrollView.bounces = false
		
		let authenticationURL:NSURL = Instagram.authenticationURL()
		let request = NSURLRequest.init(URL: authenticationURL)
		webView.loadRequest(request)

    }

	@IBAction func reloadWebView(sender: EBButton) {
	}
	
	
	@IBAction func dismissView(sender: EBButton) {
		
		self.dismissViewControllerAnimated(true) { () -> Void in
			
		}
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func webViewDidStartLoad(webView: UIWebView) {

		self.loadingIndicatorView.hidden = false
		UIView.animateWithDuration(0.3, animations: { [unowned self] in
				self.loadingIndicatorView.alpha = 1.0
			}, completion: { (finished) -> Void in
				
		})
		
	}
	
	func webViewDidFinishLoad(webView: UIWebView) {
		
		UIView.animateWithDuration(0.3, animations: { [unowned self] in
			self.loadingIndicatorView.alpha = 0.0
			}) { (finished) -> Void in
				self.loadingIndicatorView.hidden = true
		}
	}
	
	func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
		
		if (Instagram.extractTokenFromURL(request.URL))
		{
			NSLog("URL: %@", request.URL!);
				signup()
				NSNotificationCenter.defaultCenter().postNotificationName("InstagramUserAuthenticatedNotification", object: nil)
		}

		return true;

	}

	func signup() {
		
		webView = nil;
		let sharedApp = UIApplication.sharedApplication().delegate!
		if let win = sharedApp.window! {
			win.rootViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateInitialViewController();
		}
	}
	
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .Default
	}
}
