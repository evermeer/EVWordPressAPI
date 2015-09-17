//
//  EVWordPressAPI_Sites.swift
//  EVWordPressAPI
//
//  Created by Edwin Vermeer on 7/30/15.
//  Copyright (c) 2015 evict. All rights reserved.
//

import Alamofire
import AlamofireOauth2
import AlamofireJsonToObjects


public extension EVWordPressAPI {
    // MARK: - Sites
    
    
    /**
    Get information about a site.
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/
    
    :param: parameters an array of siteParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Site object
    :return: No return value
    */
    public func site(parameters:[basicParameters]? = nil, completionHandler: (Site?) -> Void) {
        Alamofire.request(.GET, self.wordpressOauth2Settings.baseURL + "/sites/\(self.site)", parameters: Dictionary<String,AnyObject>(associated: parameters))
            .responseObject { (result:Result<Site>) -> Void in
                self.handleResponse(result, completionHandler: completionHandler)
            }
    }
    
    /**
    Get page templates for a site
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/page-templates/
    
    - parameter parameters: <#parameters description#>
    */
//    public func pageTemplates(parameters:[basicParameters]? = nil, completionHandler: (Template?) -> Void) {
//        Alamofire.request(.GET, self.wordpressOauth2Settings.baseURL + "/sites/\(self.site)/page-templates", parameters: self.paramToDict(parameters))
//            .responseObject { (result:Result<Template>) -> Void in
//                self.handleResponse(result, completionHandler: completionHandler)
//        }
//    }
    
        
    /**
    Get the available shortcodes for a site
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/shortcodes/
    
    :param: parameters an array of shortcodesParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Shortcodes object
    :return: No return value
    */
    public func shortcodes(parameters:[shortcodesParameters]? = nil, completionHandler: (Shortcodes?) -> Void) {
        UsingOauth2(self.wordpressOauth2Settings, performWithToken: { token in
            Alamofire.request(WordPressRequestConvertible.Shortcodes(token, Dictionary<String,AnyObject>(associated: parameters)))
                .responseObject { (result:Result<Shortcodes>) -> Void in
                    self.handleResponse(result, completionHandler: completionHandler)
                }
            }, errorHandler: {
                completionHandler(self.oauthError(Shortcodes()))
        })
    }

    
}