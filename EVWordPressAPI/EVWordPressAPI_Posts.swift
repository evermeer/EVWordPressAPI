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
import EVReflection


public extension EVWordPressAPI {
    // MARK: - Posts
    

    /**
    Get a list of matching posts
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/posts/
    
    :param: parameters an array of postsParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Posts object
    :return: No return value
    */
    public func posts(parameters:[postsParameters]? = nil, completionHandler: (Posts?) -> Void) {
        genericCall("/sites/\(self.site)/posts/", parameters: Dictionary<String,AnyObject>(associated: parameters), completionHandler: completionHandler)
    }
    
}