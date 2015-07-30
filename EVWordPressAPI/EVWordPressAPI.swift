//
//  EVWordPressAPI.swift
//
//  Created by Edwin Vermeer on 7/11/15.
//  Copyright (c) 2015 evict. All rights reserved.
//
// Test for getting wordpress posts. For api documentation see:
// https://developer.wordpress.com/docs/api/

import Alamofire
import AlamofireOauth2
import AlamofireJsonToObjects

extension Dictionary {
    init(_ pairs: [Element]) {
        self.init()
        for (k, v) in pairs {
            self[k] = v
        }
    }
}

public protocol EVparam {
    var value: (String, AnyObject) { get }
}

public class EVWordPressAPI {
    
    public var wordpressOauth2Settings: Oauth2Settings
    public var site: String
    
    // For if you use authentication
    public init(wordpressOauth2Settings: Oauth2Settings, site:String) {
        self.wordpressOauth2Settings = wordpressOauth2Settings
        WordPressRequestConvertible.baseURLString = wordpressOauth2Settings.baseURL
        WordPressRequestConvertible.site = site
        self.site = site
    }

    // For if you don't need authentication
    public init(baseUrl: String, site:String) {
        self.wordpressOauth2Settings = Oauth2Settings(baseURL: baseUrl, authorizeURL: "", tokenURL: "", redirectURL: "", clientID: "", clientSecret: "", scope: "")
        WordPressRequestConvertible.baseURLString = baseUrl
        WordPressRequestConvertible.site = site
        self.site = site
    }

    
    // ------------------------------------------------------------------------
    // MARK: - Generic internal functions
    // ------------------------------------------------------------------------
    
    // Convert a parameter array to a parameter dictionary
    internal func paramToDict<T:EVparam>(parameters: [T]?) -> Dictionary<String, AnyObject>? {
        var result: Dictionary<String, AnyObject>? = (parameters != nil) ? Dictionary(parameters!.map({ $0.value })) : nil
        return result
    }

    // move the error object into the response object
    internal func handleResponse<T:WPObject>(response: T?, error:NSError?, completionHandler: (T?)-> Void) {
        if error != nil {
            response?.error = "Network error \(error!.code)"
            response?.message = error!.description
        }
        completionHandler(response)
    }
    
    // add an oauth error to the response object
    internal func oauthError<T: WPObject>(obj: T) -> T {
        obj.error = "OAuth2 error"
        obj.message = "Oauth2 failed"
        return obj
    }


}

