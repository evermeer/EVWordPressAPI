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
    public func site(parameters:[siteParameters]?, completionHandler: (Site?) -> Void) {
        Alamofire.request(.GET, self.wordpressOauth2Settings.baseURL + "/sites/\(self.site)", parameters: self.paramToDict(parameters))
            .responseObject { (response: Site?, error: NSError?) in
                self.handleResponse(response, error: error, completionHandler: completionHandler)
        }
    }
    
}