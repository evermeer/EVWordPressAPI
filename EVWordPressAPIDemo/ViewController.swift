//
//  ViewController.swift
//  EVWordPressAPI
//
//  Created by Edwin Vermeer on 7/22/15.
//  Copyright (c) 2015 evict. All rights reserved.
//

import UIKit
import AlamofireOauth2

class ViewController: UIViewController {

    // Create your own clientID and clientSecret at https://developer.wordpress.com/docs/oauth2/
    let wordpressOauth2Settings = Oauth2Settings(
        baseURL: "https://public-api.wordpress.com/rest/v1.1",
        authorizeURL: "https://public-api.wordpress.com/oauth2/authorize",
        tokenURL: "https://public-api.wordpress.com/oauth2/token",
        redirectURL: "alamofireoauth2://wordpress/oauth_callback",
        clientID: "??????",
        clientSecret: "??????????"
    )
    
    var api:EVWordPressAPI!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.api = EVWordPressAPI(wordpressOauth2Settings: self.wordpressOauth2Settings, site: "evict.nl")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // ------------------------------------------------------------------------
    // MARK: - Users
    // ------------------------------------------------------------------------
    
    @IBAction func testUsers(sender: AnyObject) {
        // For parameters and other details see: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/users/
        api.users(self, parameters:[.number(19), .authors_only(false)], completionHandler: { result in
            if let err = result?.error, message = result?.message {
                println("Warning: WordPress error \(err) : \(message)")
            } else {
                println("Number of users = \(result?.found), returend by call = \(result?.users?.count)")
            }
        })        
    }
    
    @IBAction func testSuggest(sender: AnyObject) {
        // For parameters and other details see: https://developer.wordpress.com/docs/api/1.1/get/users/suggest/
        api.suggest(self, parameters:nil, completionHandler: { result in
            if let err = result?.error, message = result?.message {
                println("Warning: WordPress error \(err) : \(message)")
            } else {
                println("Number of suggestions returend by call = \(result?.suggestions?.count)")
            }
        })
    }
    

    @IBAction func testMe(sender: AnyObject) {
        // For parameters and other details see: https://developer.wordpress.com/docs/api/1.1/get/me/
        api.me(self, parameters:nil, completionHandler: { result in
            if let err = result?.error, message = result?.message {
                println("Warning: WordPress error \(err) : \(message)")
            } else {
                println("Loged in as user = \(result?.display_name)")
            }
        })
    }

    @IBAction func testMeLikes(sender: AnyObject) {
        // For parameters and other details see: https://developer.wordpress.com/docs/api/1.1/get/me/
        api.meLikes(self, parameters:nil, completionHandler: { result in
            if let err = result?.error, message = result?.message {
                println("Warning: WordPress error \(err) : \(message)")
            } else {
                println("Number of likes = \(result?.found), returend by call = \(result?.likes?.count)")
            }
        })
    }

    // ------------------------------------------------------------------------
    // MARK: - ...
    // ------------------------------------------------------------------------
    
    

}
