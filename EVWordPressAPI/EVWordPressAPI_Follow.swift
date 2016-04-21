//
//  EVWordPressAPI_Follow.swift
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
    // MARK: - Follow
    
    
    /**
    List a site's followers in reverse chronological order.
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/follows/
    
    :param: parameters an array of followsParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Users object
    :return: No return value
    */
    public func follows(parameters:[followsParameters]? = nil, completionHandler: (Users?) -> Void) {
        genericOauthCall(.Follows(pdict(parameters)), completionHandler: completionHandler)
    }

    /**
    List a site's followers in reverse chronological order.
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/follows/
    
    :param: parameters an array of followsParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Users object
    :return: No return value
    */
    public func followsMine(parameters:[basicContextParameters]? = nil, completionHandler: (Following?) -> Void) {
        genericOauthCall(.FollowsMine(pdict(parameters)), completionHandler: completionHandler)
    }

}