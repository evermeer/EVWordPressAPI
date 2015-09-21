//
//  EVWordpressAPI_Comments.swift
//  EVWordPressAPI
//
//  Created by Edwin Vermeer on 9/21/15.
//  Copyright © 2015 evict. All rights reserved.
//

import Alamofire
import AlamofireOauth2
import AlamofireJsonToObjects
import EVReflection


public extension EVWordPressAPI {
    // MARK: - Comments
    
    
    /**
    Get a list of recent comments.
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/comments/
    
    :param: parameters an array of postsParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Posts object
    :return: No return value
    */
    public func comments(parameters:[commentsParameters]? = nil, completionHandler: (Comments?) -> Void) {
        genericCall("/sites/\(self.site)/comments/", parameters:parameters, completionHandler: completionHandler)
    }

    /**
    Get a list of recent comments.
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/comments/
    
    :param: postId The postId where you want the replies for.
    :param: parameters an array of postsParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Posts object
    :return: No return value
    */
    public func replies(postId: String, parameters:[commentsParameters]? = nil, completionHandler: (Comments?) -> Void) {
        genericCall("/sites/\(self.site)/posts/\(postId)/replies/", parameters:parameters, completionHandler: completionHandler)
    }

    /**
    Get a single comments.
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/comments/%24comment_ID/
    
    :param: commentId The comment id
    :param: parameters an array of postsParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Posts object
    :return: No return value
    */
    public func comment(commentId: String, parameters:[basicContextParameters]? = nil, completionHandler: (Comment?) -> Void) {
        genericCall("/sites/\(self.site)/comments/", parameters:parameters, completionHandler: completionHandler)
    }
    
    
    /**
    Get the likes for a comment
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/comments/%24comment_ID/likes/
    
    :param: commentId The comment ID
    :param: parameters an array of basicParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Likes object
    :return: No return value
    */
    public func commentLikes(commentId:String, parameters:[basicParameters]? = nil, completionHandler: (Likes?) -> Void) {
        genericCall("/sites/\(self.site)/comments/\(commentId)/likes/", parameters:parameters, completionHandler: completionHandler)
    }
    
    
    /**
    Get the current user's like status for a post.
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/posts/%24post_ID/likes/mine/
    
    :param: commentId The comment ID
    :param: parameters an array of basicParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Likes object
    :return: No return value
    */
    public func commentsLikesMine(commentId:String, parameters:[basicParameters]? = nil, completionHandler: (Likes?) -> Void) {
        genericCall("/sites/\(self.site)/comments/\(commentId)/likes/mine/", parameters:parameters, completionHandler: completionHandler)
    }
}
