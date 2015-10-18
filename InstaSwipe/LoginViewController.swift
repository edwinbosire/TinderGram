//
//  LoginViewController.swift
//  InstaSwipe
//
//  Created by edwin bosire on 18/10/2015.
//  Copyright © 2015 Edwin Bosire. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIWebViewDelegate {

	@IBOutlet weak var webView: UIWebView!
	let Instagram:InstagramManager = InstagramManager.shared()
	
    override func viewDidLoad() {
        super.viewDidLoad()

       webView.scrollView.bounces = false
		
		let authenticationURL:NSURL = Instagram.authenticationURL()
		let request = NSURLRequest.init(URL: authenticationURL)
		webView.loadRequest(request)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
		
		if (Instagram.extractTokenFromURL(request.URL))
		{
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
}
