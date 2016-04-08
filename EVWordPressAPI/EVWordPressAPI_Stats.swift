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
     
     :param: parameters an array of statsSummaryParameters. For complete list plus documentation see the api documentation
     :param: completionHandler A code block that will be called with the StatsSummary object
     :return: No return value
     */
    public func statsSummary(parameters:[statsSummaryParameters]? = nil, completionHandler: (StatsSummary?) -> Void) {
        genericOauthCall(.StatsSummary(pdict(parameters)), completionHandler: completionHandler)
    }

    /**
     View a site's top posts and pages by views (authentication is required)
     See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/stats/top-posts/
     
     :param: parameters an array of statsSummaryParameters. For complete list plus documentation see the api documentation
     :param: completionHandler A code block that will be called with the StatsTopTasks object
     :return: No return value
     */
    public func statsTopPosts(parameters:[statsSummaryParameters]? = nil, completionHandler: (StatsTopTasks?) -> Void) {
        genericOauthCall(.StatsTopTasks(pdict(parameters)), completionHandler: completionHandler)
    }

    
    /**
     View the details of a single video (authentication is required)
     See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/stats/video/%24post_id/
     
     :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
     :param: completionHandler A code block that will be called with the StatsVideo object
     :return: No return value
     */
    public func statsVideo(parameters:[basicContextParameters]? = nil, videoId: String, completionHandler: (StatsVideo?) -> Void) {
        genericOauthCall(.StatsVideo(pdict(parameters), videoId), completionHandler: completionHandler)
    }

    /**
     View a site's referrers (authentication is required)
     See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/stats/referrers/
     
     :param: parameters an array of statsReferrersParameters. For complete list plus documentation see the api documentation
     :param: completionHandler A code block that will be called with the StatsReferrer object
     :return: No return value
     */
    public func statsReferrers(parameters:[statsReferrersParameters]? = nil, completionHandler: (StatsReferrer?) -> Void) {
        genericOauthCall(.StatsReferrers(pdict(parameters)), completionHandler: completionHandler)
    }
    
    /**
     View a site's outbound clicks (authentication is required)
     See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/stats/clicks/
     
     :param: parameters an array of statsReferrersParameters. For complete list plus documentation see the api documentation
     :param: completionHandler A code block that will be called with the StatsClicks object
     :return: No return value
     */
    public func statsClicks(parameters:[statsReferrersParameters]? = nil, completionHandler: (StatsClicks?) -> Void) {
        genericOauthCall(.StatsClicks(pdict(parameters)), completionHandler: completionHandler)
    }

    /**
     View a site's views by tags and categories (authentication is required)
     See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/stats/tags/
     
     :param: parameters an array of statsTagsParameters. For complete list plus documentation see the api documentation
     :param: completionHandler A code block that will be called with the StatsTags object
     :return: No return value
     */
    public func statsTags(parameters:[statsTagsParameters]? = nil, completionHandler: (StatsTags?) -> Void) {
        genericOauthCall(.StatsTags(pdict(parameters)), completionHandler: completionHandler)
    }

    /**
     View a site's top authors (authentication is required)
     See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/stats/top-authors/
     
     :param: parameters an array of statsReferrersParameters. For complete list plus documentation see the api documentation
     :param: completionHandler A code block that will be called with the StatsAuthors object
     :return: No return value
     */
    public func statsAuthors(parameters:[statsReferrersParameters]? = nil, completionHandler: (StatsAuthors?) -> Void) {
        genericOauthCall(.StatsAuthors(pdict(parameters)), completionHandler: completionHandler)
    }

    /**
     View a site's top comment authors and most-commented posts (authentication is required)
     See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/stats/comments/
     
     :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
     :param: completionHandler A code block that will be called with the StatsComments object
     :return: No return value
     */
    public func statsComments(parameters:[basicContextParameters]? = nil, completionHandler: (StatsComments?) -> Void) {
        genericOauthCall(.StatsComments(pdict(parameters)), completionHandler: completionHandler)
    }

    /**
     View a site's video plays (authentication is required)
     See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/stats/video-plays/
     
     :param: parameters an array of statsReferrersParameters. For complete list plus documentation see the api documentation
     :param: completionHandler A code block that will be called with the StatsVideoPlays object
     :return: No return value
     */
    public func statsVideoPlays(parameters:[statsReferrersParameters]? = nil, completionHandler: (StatsVideoPlays?) -> Void) {
        genericOauthCall(.StatsVideoPlays(pdict(parameters)), completionHandler: completionHandler)
    }

    public func statsPost(parameters:[basicContextParameters]? = nil, completionHandler: (StatsPost?) -> Void) {
        genericOauthCall(.StatsPost(pdict(parameters)), completionHandler: completionHandler)
    }

}





