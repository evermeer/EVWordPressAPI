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
    List the users of a site (authentication is required)
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/users/
    
    :param: viewController the viewController that will be the parent of the OAuth2 webview
    :param: parameters an array of usersParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Users object
    :return: No return value
    */
    public func users(parameters:[usersParameters]? = nil, completionHandler: (Users?) -> Void) {
        genericOauthCall(.Users(pdict(parameters)), completionHandler: completionHandler)
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
        genericOauthCall(.Suggest(pdict(parameters)), completionHandler: completionHandler)
    }
        
    
    /**
    The loged in user info (authentication is required)
    See: https://developer.wordpress.com/docs/api/1.1/get/me/
    
    :param: viewController the viewController that will be the parent of the OAuth2 webview
    :param: parameters an array of meParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the User object
    :return: No return value
    */
    public func me(parameters:[basicParameters]? = nil, completionHandler: (User?) -> Void) {
        genericOauthCall(.Me(pdict(parameters)), completionHandler: completionHandler)
    }
    
    
    /**
    Get a list of the current user's likes.
    See: https://developer.wordpress.com/docs/api/1.1/get/me/likes/
    
    :param: viewController the viewController that will be the parent of the OAuth2 webview
    :param: parameters an array of meLikesParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the User object
    :return: No return value
    */
    public func meLikes(parameters:[basicParameters]? = nil, completionHandler: (Likes?) -> Void) {
        genericOauthCall(.MeLikes(pdict(parameters)), completionHandler: completionHandler)
    }
    
    
}