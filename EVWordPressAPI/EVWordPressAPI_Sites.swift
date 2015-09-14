//
//  EVWordPressAPI_Sites.swift
//  EVWordPressAPI
//
//  Created by Edwin Vermeer on 7/30/15.
//  Copyright (c) 2015 evict. All rights reserved.
//

import Alamofire
import AlamofireOauth2
import AlamofireJsonToObjects


public extension EVWordPressAPI {
    // MARK: - Sites
    
    
    /**
    Parameters for the users call
    */
    public enum siteParameters: EVparam {
        case http_envelope(Bool)
        case pretty(Bool)
        case meta(String)
        case fields(String)
        case callback(String)
        
        public var value: (String, AnyObject) {
            get {
                switch(self) {
                case http_envelope(let b):
                    return ("http_envelop", b)
                case pretty(let b):
                    return ("pretty", b)
                case meta(let s):
                    return ("meta", s)
                case fields(let s):
                    return ("fields", s)
                case callback(let s):
                    return ("callback", s)
                }
            }
        }
    }
    
    
    /**
    Get information about a site.
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/
    
    :param: parameters an array of siteParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Site object
    :return: No return value
    */
    public func site(parameters:[siteParameters]? = nil, completionHandler: (Site?) -> Void) {
        Alamofire.request(.GET, self.wordpressOauth2Settings.baseURL + "/sites/\(self.site)", parameters: self.paramToDict(parameters))
            .responseObject { (result:Result<Site>) -> Void in
                self.handleResponse(result, completionHandler: completionHandler)
            }
    }
    
    
    
    /**
    Parameters for the shortcodes call
    */
    public enum shortcodesParameters: EVparam {
        case context(String)
        case http_envelope(Bool)
        case pretty(Bool)
        case meta(String)
        case fields(String)
        case callback(String)
        
        public var value: (String, AnyObject) {
            get {
                switch(self) {
                case context(let s):
                    return ("context", s)
                case http_envelope(let b):
                    return ("http_envelop", b)
                case pretty(let b):
                    return ("pretty", b)
                case meta(let s):
                    return ("meta", s)
                case fields(let s):
                    return ("fields", s)
                case callback(let s):
                    return ("callback", s)
                }
            }
        }
    }
    
    /**
    Get the available shortcodes for a site
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/shortcodes/
    
    :param: parameters an array of shortcodesParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Shortcodes object
    :return: No return value
    */
    public func shortcodes(parameters:[shortcodesParameters]? = nil, completionHandler: (Shortcodes?) -> Void) {
        UsingOauth2(self.wordpressOauth2Settings, performWithToken: { token in
            Alamofire.request(WordPressRequestConvertible.Shortcodes(token, self.paramToDict(parameters)))
                .responseObject { (result:Result<Shortcodes>) -> Void in
                    self.handleResponse(result, completionHandler: completionHandler)
                }
            }, errorHandler: {
                completionHandler(self.oauthError(Shortcodes()))
        })
    }

    
}