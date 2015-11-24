//
//  EVWordPressAPI_Insights.swift
//  EVWordPressAPI
//
//  Created by Edwin Vermeer on 9/21/15.
//  Copyright © 2015 evict. All rights reserved.
//

import Alamofire
import AlamofireOauth2
import AlamofireJsonToObjects


extension EVWordPressAPI {
    // MARK: - Insights
    
    /**
    List the users of a site (authentication is required)
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/users/
    
    :param: parameters an array of usersParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Users object
    :return: No return value
    */
    public func insights(parameters:[basicContextParameters]? = nil, completionHandler: (Insights?) -> Void) {
        genericOauthCall(.Insights(pdict(parameters)), completionHandler: completionHandler)
    }


    /**
    List the users of a site (authentication is required)
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/users/
    
    :param: parameters an array of usersParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Users object
    :return: No return value
    */
    public func insightsForSlug(slug:String, parameters:[insightsForSlugParameters]? = nil, completionHandler: (Insights?) -> Void) {
        genericOauthCall(.InsightsSlug(pdict(parameters), slug), completionHandler: completionHandler)
    }

}