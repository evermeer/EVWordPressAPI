//
//  EVWordPressAPI_Posts.swift
//  EVWordPressAPI
//
//  Created by Edwin Vermeer on 7/30/15.
//  Copyright (c) 2015 evict. All rights reserved.
//

import Alamofire
import AlamofireOauth2
import AlamofireJsonToObjects


public extension EVWordPressAPI {
    // MARK: - Posts
    
    
    /**
    Parameters for the users call
    */
    public enum postsParameters: EVparam {
        case context(String)
        case http_envelope(Bool)
        case pretty(Bool)
        case meta(String)
        case fields(String)
        case callback(String)
        case number(Int)
        case offset(Int)
        case page(Int)
        case page_handle(String)
        case order(String)
        case order_by(String)
        case after(NSDate)
        case before(NSDate)
        case modified_after(NSDate)
        case modified_before(NSDate)
        case tag(String)
        case category(String)
        case type(String)
        case parent_id(Int)
        case exclude([Int])
        case exclude_tree(Int)
        case status(String)
        case sticky(String)
        case author(Int)
        case search(String)
        case meta_key(String)
        case meta_value(String)
        
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
                case number(let i):
                    return ("number", i)
                case offset(let i):
                    return ("offset", i)
                case page(let i):
                    return("page", i)
                case page_handle(let s):
                    return ("page_handle", s)
                case order(let s):
                    return ("order", s)
                case order_by(let s):
                    return ("order_by", s)
                case after(let d):
                    return ("after", d)
                case before(let d):
                    return ("before", d)
                case modified_after(let d):
                    return ("modified_after", d)
                case modified_before(let d):
                    return ("modified_before", d)
                case tag(let s):
                    return ("tag", s)
                case category(let s):
                    return ("category", s)
                case type(let s):
                    return ("type", s)
                case parent_id(let i):
                    return ("parent_id", i)
                case exclude(let ia):
                    return ("exclude", ia)
                case exclude_tree(let i):
                    return ("exclude_tree", i)
                case status(let s):
                    return ("status", s)
                case sticky(let s):
                    return ("sticky", s)
                case author(let i):
                    return ("author", i)
                case search(let s):
                    return ("search", s)
                case meta_key(let s):
                    return ("meta_key", s)
                case meta_value(let s):
                    return ("meta_value", s)
                }
            }
        }
    }
    
    
    /**
    Get a list of matching posts
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/posts/
    
    :param: parameters an array of postsParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Posts object
    :return: No return value
    */
    public func posts(parameters:[postsParameters]?, completionHandler: (Posts?) -> Void) {
        Alamofire.request(.GET, self.wordpressOauth2Settings.baseURL + "/sites/\(self.site)/posts/", parameters: self.paramToDict(parameters))
            .responseObject { (response: Posts?, error: NSError?) in
                self.handleResponse(response, error: error, completionHandler: completionHandler)
        }
    }
    
}