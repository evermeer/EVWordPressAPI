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
import EVReflection

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
    
    // move the error object into the response object
    internal func handleResponse<T:WPObject>(response: Result<T> , completionHandler: (T?)-> Void) {
        if response.error != nil {
            response.error.debugDescription
            response.value?.error = "Network error \(response.error)"
            response.value?.message = response.error.debugDescription
        }
        completionHandler(response.value)
    }
    
    // add an oauth error to the response object
    internal func oauthError<T: WPObject>(obj: T) -> T {
        obj.error = "OAuth2 error"
        obj.message = "Oauth2 failed"
        return obj
    }


}

