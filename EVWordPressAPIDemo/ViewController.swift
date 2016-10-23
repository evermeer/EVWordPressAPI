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
        baseURL: "https://public-api.wordpress.com/rest/v1",
        authorizeURL: "https://public-api.wordpress.com/oauth2/authorize",
        tokenURL: "https://public-api.wordpress.com/oauth2/token",
        redirectURL: "http://evict.nl",
        clientID: "41739",
        clientSecret: "31eC5no1cKXH3RS8sKfjv9WEpHiyvl24jvx0iXXwqc4Dajhq9OeAgRDazVoHtKtq"
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
        api.users([.number(19), .authors_only(false)]) { result in
            if let err = result?.error, let message = result?.message {
                print("Warning: WordPress error \(err) : \(message)")
            } else {
                print("Number of users = \(result?.found), returend by call = \(result?.users?.count)")
            }
        }
    }
    
    @IBAction func testSuggest(sender: AnyObject) {
        // For parameters and other details see: https://developer.wordpress.com/docs/api/1.1/get/users/suggest/
        api.suggest { result in
            if let err = result?.error, let message = result?.message {
                print("WaprintWordPress error \(err) : \(message)")
            } else {
                print("Number of suggestions returend by call = \(result?.suggestions?.count)")
            }
        }
    }
    

    @IBAction func testMe(sender: AnyObject) {
        // For parameters and other details see: https://developer.wordpress.com/docs/api/1.1/get/me/
        api.me { result in
            if let err = result?.error, let message = result?.message {
                print("Warning: WordPress error \(err) : \(message)")
            } else {
                print("Loged in as user = \(result?.display_name)")
            }
        }
    }

    @IBAction func testMeLikes(sender: AnyObject) {
        // For parameters and other details see: https://developer.wordpress.com/docs/api/1.1/get/me/
        api.meLikes { result in
            if let err = result?.error, let message = result?.message {
                print("Warning: WordPress error \(err) : \(message)")
            } else {
                print("Number of likes = \(result?.found), returend by call = \(result?.likes?.count)")
            }
        }
    }

    @IBAction func testShortcodes(sender: AnyObject) {
        // For parameters and other details see: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/shortcodes/
        api.shortcodes { result in
            if let err = result?.error, let message = result?.message {
                print("Warning: WordPress error \(err) : \(message)")
            } else {
                print("Number of shortcodes = \(result?.shortcodes?.count)")
            }
        }
    }

    // ------------------------------------------------------------------------
    // MARK: - ...
    // ------------------------------------------------------------------------
    
    

}

