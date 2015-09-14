//
//  EVWordPressAPI_Users.swift
//  EVWordPressAPI
//
//  Created by Edwin Vermeer on 7/30/15.
//  Copyright (c) 2015 evict. All rights reserved.
//

import Alamofire
import AlamofireOauth2
import AlamofireJsonToObjects


extension EVWordPressAPI {
    // MARK: - Users
    
    /**
    Parameters for the users call
    */
    public enum usersParameters: EVparam {
        case context(String)
        case http_envelope(Bool)
        case pretty(Bool)
        case meta(String)
        case fields(String)
        case callback(String)
        case number(Int)
        case offset(Int)
        case order(String)
        case order_by(String)
        case authors_only(Bool)
        case type(String)
        
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
                case order(let s):
                    return ("order", s)
                case order_by(let s):
                    return ("order_by", s)
                case authors_only(let b):
                    return ("authors_only", b)
                case type(let s):
                    return ("type", s)
                }
            }
        }
    }
    
    /**
    List the users of a site (authentication is required)
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/users/
    
    :param: viewController the viewController that will be the parent of the OAuth2 webview
    :param: parameters an array of usersParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Users object
    :return: No return value
    */
    public func users(parameters:[usersParameters]? = nil, completionHandler: (Users?) -> Void) {
        UsingOauth2(self.wordpressOauth2Settings, performWithToken: { token in
            Alamofire.request(WordPressRequestConvertible.Users(token, self.paramToDict(parameters)))
                .responseObject { (result:Result<Users>) -> Void in
                    self.handleResponse(result, completionHandler: completionHandler)
                }
            }, errorHandler: {
                completionHandler(self.oauthError(Users()))
        })
    }
    
    /**
    Parameters for the suggest call
    */
    public enum suggestParameters: EVparam {
        case context(String)
        case http_envelope(Bool)
        case pretty(Bool)
        case meta(String)
        case fields(String)
        case callback(String)
        case site_id(Int)
        case site(String)
        case filter(String)
        case image_size(Int)
        case client(String)
        
        public var value: (String, AnyObject) {
            get {
                switch(self) {
                case context(let p):
                    return ("context", p)
                case http_envelope(let p):
                    return ("http_envelop", p)
                case pretty(let p):
                    return ("pretty", p)
                case meta(let p):
                    return ("meta", p)
                case fields(let p):
                    return ("fields", p)
                case callback(let p):
                    return ("callback", p)
                case site_id(let p):
                    return ("site_id", p)
                case site(let p):
                    return ("site", p)
                case filter(let p):
                    return ("filter", p)
                case image_size(let p):
                    return ("image_size", p)
                case client(let p):
                    return ("client", p)
                }
            }
        }
    }
    
    
    /**
    Get a list of possible users to suggest for @mentions.
    See: https://developer.wordpress.com/docs/api/1.1/get/users/suggest/
    
    :param: viewController the viewController that will be the parent of the OAuth2 webview
    :param: parameters an array of suggestParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Suggestions object
    :return: No return value
    */
    public func suggest(parameters:[suggestParameters]? = nil, completionHandler: (Suggestions?) -> Void) {
        UsingOauth2(self.wordpressOauth2Settings, performWithToken: { token in
            Alamofire.request(WordPressRequestConvertible.Suggest(token, self.paramToDict(parameters)))
                .responseObject { (result:Result<Suggestions>) -> Void in
                    self.handleResponse(result, completionHandler: completionHandler)
                }
            }, errorHandler: {
                completionHandler(self.oauthError(Suggestions()))
        })
    }
    
    
    /**
    Parameters for the users call
    */
    public enum meParameters: EVparam {
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
    The loged in user info (authentication is required)
    See: https://developer.wordpress.com/docs/api/1.1/get/me/
    
    :param: viewController the viewController that will be the parent of the OAuth2 webview
    :param: parameters an array of meParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the User object
    :return: No return value
    */
    public func me(parameters:[meParameters]? = nil, completionHandler: (User?) -> Void) {
        UsingOauth2(self.wordpressOauth2Settings, performWithToken: { token in
            Alamofire.request(WordPressRequestConvertible.Me(token, self.paramToDict(parameters)))
                .responseObject { (result:Result<User>) -> Void in
                    self.handleResponse(result, completionHandler: completionHandler)
                }
            }, errorHandler: {
                completionHandler(self.oauthError(User()))
        })
    }
    
    /**
    Parameters for the me call
    */
    public enum meLikesParameters: EVparam {
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
    Get a list of the current user's likes.
    See: https://developer.wordpress.com/docs/api/1.1/get/me/likes/
    
    :param: viewController the viewController that will be the parent of the OAuth2 webview
    :param: parameters an array of meLikesParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the User object
    :return: No return value
    */
    public func meLikes(parameters:[meLikesParameters]? = nil, completionHandler: (Likes?) -> Void) {
        UsingOauth2(self.wordpressOauth2Settings, performWithToken: { token in
            Alamofire.request(WordPressRequestConvertible.MeLikes(token, self.paramToDict(parameters)))
                .responseObject { (result:Result<Likes>) -> Void in
                    self.handleResponse(result, completionHandler: completionHandler)
                }
            }, errorHandler: {
                completionHandler(self.oauthError(Likes()))
        })
    }
    
    
}