//
//  EVWordPressAPI_Stats.swift
//  EVWordPressAPI
//
//  Created by Edwin Vermeer on 11/24/15.
//  Copyright © 2015 evict. All rights reserved.
//

import Alamofire
import AlamofireOauth2
import AlamofireJsonToObjects
import EVReflection


public extension EVWordPressAPI {
    // MARK: - Stats
    
    
    /**
    Get a site's stats (authentication is required)
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/stats/
    
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Stats object
    :return: No return value
    */
    public func stats(parameters:[basicContextParameters]? = nil, completionHandler: (Stats?) -> Void) {
        genericOauthCall(.Stats(pdict(parameters)), completionHandler: completionHandler)
    }
    
    /**
     View a site's summarized views, visitors, likes and comments (authentication is required)
     See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/stats/summary/
     
     :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
     :param: completionHandler A code block that will be called with the Stats object
     :return: No return value
     */
    public func statsSummary(parameters:[statsSummaryParameters]? = nil, completionHandler: (StatsSummary?) -> Void) {
        genericOauthCall(.StatsSummary(pdict(parameters)), completionHandler: completionHandler)
    }
    

}