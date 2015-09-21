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
        genericCall("/sites/\(self.site)/posts/", parameters:parameters, completionHandler: completionHandler)
    }

    /**
    Get a specific post
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/posts/%24post_ID/
    
    :param: postId The post ID
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Post object
    :return: No return value
    */
    public func postById(postId:String, parameters:[basicContextParameters]? = nil, completionHandler: (Post?) -> Void) {
        genericCall("/sites/\(self.site)/posts/\(postId)", parameters:parameters, completionHandler: completionHandler)
    }

    /**
    Get a specific post by its slug
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/posts/slug:%24post_slug/
    
    :param: postSlug The post slug
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Post object
    :return: No return value
    */
    public func postBySlug(postSlug:String, parameters:[basicContextParameters]? = nil, completionHandler: (Post?) -> Void) {
        genericCall("/sites/\(self.site)/posts/slug:\(postSlug)", parameters:parameters, completionHandler: completionHandler)
    }

    
    /**
    Get the likes for a post
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/posts/%24post_ID/likes/
    
    :param: postId The post ID
    :param: parameters an array of basicParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Likes object
    :return: No return value
    */
    public func postLikes(postId:String, parameters:[basicParameters]? = nil, completionHandler: (Likes?) -> Void) {
        genericCall("/sites/\(self.site)/posts/\(postId)/likes/", parameters:parameters, completionHandler: completionHandler)
    }

    
    /**
    Get the current user's like status for a post.
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/posts/%24post_ID/likes/mine/
    
    :param: postId The post ID
    :param: parameters an array of basicParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Likes object
    :return: No return value
    */
    public func postLikesMine(postId:String, parameters:[basicParameters]? = nil, completionHandler: (Likes?) -> Void) {
        genericCall("/sites/\(self.site)/posts/\(postId)/likes/mine/", parameters:parameters, completionHandler: completionHandler)
    }
    
    
    /**
    Get reblog status for a post.
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/posts/%24post_ID/reblogs/mine/
    
    :param: postId The post ID
    :param: parameters an array of basicParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Reblog object
    :return: No return value
    */
    public func postReblogsMine(postId:String, parameters:[basicParameters]? = nil, completionHandler: (Reblogs?) -> Void) {
        genericCall("/sites/\(self.site)/posts/\(postId)/likes/mine/", parameters:parameters, completionHandler: completionHandler)
    }
}