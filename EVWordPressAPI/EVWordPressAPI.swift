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
    internal func handleResponse<T:WPObject>(response: Result<T, NSError> , completionHandler: (T?)-> Void) {
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

    /**
    Generic way to handle oauth api calls
    
    :param: request a specific WordPressRequestConvertible value for the request
    :param: parameters an array of parameters. For complete list plus documentation see the api documentation for the specific call
    :param: completionHandler A code block that will be called with the result object
    */
    internal func genericOauthCall<T:WPObject>(request:WordPressRequestConvertible, completionHandler: (T?) -> Void) {
        UsingOauth2(self.wordpressOauth2Settings, performWithToken: { token in
            WordPressRequestConvertible.token = token
            Alamofire.request(request)
                .responseObject { (result:Result<T, NSError>) -> Void in
                    self.handleResponse(result, completionHandler: completionHandler)
            }
            }, errorHandler: {
                completionHandler(self.oauthError(T()))
        })
    }

    /**
    Generic way to handle api calls
    
    :param: path the api url for the request
    :param: parameters an array of parameters. For complete list plus documentation see the api documentation for the specific call
    :param: completionHandler A code block that will be called with the result object
    */
    internal func genericCall<T:WPObject, P where P: EVAssociated>(path:String, parameters:[P]?, completionHandler: (T?) -> Void) {
        Alamofire.request(.GET, self.wordpressOauth2Settings.baseURL + path, parameters: Dictionary<String,AnyObject>(associated: parameters))
            .responseObject { (result:Result<T, NSError>) -> Void in
                self.handleResponse(result, completionHandler: completionHandler)
        }
    }
    
    /**
    Convert parameter array to dictionary
    
    - parameter parameters: parameter array
    
    - returns: parameter dictionary
    */
    internal func pdict<P where P: EVAssociated>(parameters:[P]?) -> Dictionary<String,AnyObject> {
        return Dictionary(associated: parameters)
    }
}

