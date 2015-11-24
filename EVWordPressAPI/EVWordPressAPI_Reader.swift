//
//  EVWordPressAPI_Reader.swift
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
    // MARK: - Reader
    
    
    /**
    Get default reader menu.
    See: https://developer.wordpress.com/docs/api/1.1/get/read/menu/
    
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Posts object
    :return: No return value
    */
    public func readMenu(parameters:[basicContextParameters]? = nil, completionHandler: (Menu?) -> Void) {
        genericCall("/read/menu", parameters:parameters, completionHandler: completionHandler)
    }


    /**
    Get details about a feed.
    See: https://developer.wordpress.com/docs/api/1.1/get/read/feed/%24feed_url_or_id/
    
    :param: feedId The url or feed id where you want details of
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Feed object
    :return: No return value
    */
    public func feed(feedId:String, parameters:[basicContextParameters]? = nil, completionHandler: (Feed?) -> Void) {
        genericCall("/read/feed/\(feedId)", parameters:parameters, completionHandler: completionHandler)
    }

    
    /**
    Get a list of posts from the blogs a user follows.
    See: https://developer.wordpress.com/docs/api/1.1/get/read/following/
    
    :param: parameters an array of followingParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Posts object
    :return: No return value
    */
    public func following(parameters:[followingParameters]? = nil, completionHandler: (Posts?) -> Void) {
        genericCall("/read/following", parameters:parameters, completionHandler: completionHandler)
    }

    
    /**
    Get a list of posts from the blogs a user likes.
    See: https://developer.wordpress.com/docs/api/1.1/get/read/liked/
    
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Posts object
    :return: No return value
    */
    public func liked(parameters:[followingParameters]? = nil, completionHandler: (Posts?) -> Void) {
        genericCall("/read/liked", parameters:parameters, completionHandler: completionHandler)
    }

    
    /**
    Get a list of posts from a tag.
    See: https://developer.wordpress.com/docs/api/1.1/get/read/tags/%24tag/posts/
    
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Posts object
    :return: No return value
    */
    public func tagPosts(tag:String, parameters:[followingParameters]? = nil, completionHandler: (Posts?) -> Void) {
        genericCall("/read/tags/\(tag)/posts", parameters:parameters, completionHandler: completionHandler)
    }

    
    /**
    Get a list of tags subscribed to by the user.
    See: https://developer.wordpress.com/docs/api/1.1/get/read/tags/
    
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the TagsWrappper object
    :return: No return value
    */
    public func readerTags(parameters:[basicContextParameters]? = nil, completionHandler: (TagsWrapper?) -> Void) {
        genericCall("/read/tags", parameters:parameters, completionHandler: completionHandler)
    }


    /**
    Get details about a specified tag.
    See: https://developer.wordpress.com/docs/api/1.1/get/read/tags/%24tag/
    
    :param: tag The tag for what you want details
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Tag object
    :return: No return value
    */
    public func readerTag(tag:String, parameters:[basicContextParameters]? = nil, completionHandler: (Tag?) -> Void) {
        genericCall("/read/tags/\(tag)", parameters:parameters, completionHandler: completionHandler)
    }


    /**
    Get the subscribed status of the user to a given tag.
    See: https://developer.wordpress.com/docs/api/1.1/get/read/tags/%24tag/mine/
    
    :param: tag The tag for what you want details
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Tag object
    :return: No return value
    */
    public func tagStatus(tag:String, parameters:[basicContextParameters]? = nil, completionHandler: (Status?) -> Void) {
        genericOauthCall(.TagStatus(pdict(parameters), tag), completionHandler: completionHandler)
    }


    /**
    Get a list of the feeds the user is following.
    See: https://developer.wordpress.com/docs/api/1.1/get/read/following/mine/
    
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Subscriptions object
    :return: No return value
    */
    public func following(parameters:[followingParameters]? = nil, completionHandler: (Subscriptions?) -> Void) {
        genericOauthCall(.Following(pdict(parameters)), completionHandler: completionHandler)
    }

    
    /**
    Get a list of blog recommendations for the current user.
    See: https://developer.wordpress.com/docs/api/1.1/get/read/recommendations/mine/
    
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Subscriptions object
    :return: No return value
    */
    public func recommendations(parameters:[recommendationsParameters]? = nil, completionHandler: (Blogs?) -> Void) {
        genericOauthCall(.Recommendations(pdict(parameters)), completionHandler: completionHandler)
    }
    
}