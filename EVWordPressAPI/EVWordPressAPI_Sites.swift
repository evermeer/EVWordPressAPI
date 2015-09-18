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
    
    :parameter: parameters: an array of basicParameters. For a complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Template object
    */
    public func pageTemplates(parameters:[basicParameters]? = nil, completionHandler: (Templates?) -> Void) {
        Alamofire.request(.GET, self.wordpressOauth2Settings.baseURL + "/sites/\(self.site)/page-templates", parameters: Dictionary<String,AnyObject>(associated: parameters))
            .responseObject { (result:Result<Templates>) -> Void in
                self.handleResponse(result, completionHandler: completionHandler)
        }
    }
            
    /**
    Get the available shortcodes for a site
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/shortcodes/
    
    :param: parameters an array of shortcodesParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Shortcodes object
    */
    public func shortcodes(parameters:[basicContextParameters]? = nil, completionHandler: (Shortcodes?) -> Void) {
        UsingOauth2(self.wordpressOauth2Settings, performWithToken: { token in
            Alamofire.request(WordPressRequestConvertible.Shortcodes(token, Dictionary<String,AnyObject>(associated: parameters)))
                .responseObject { (result:Result<Shortcodes>) -> Void in
                    self.handleResponse(result, completionHandler: completionHandler)
                }
        }, errorHandler: {
            completionHandler(self.oauthError(Shortcodes()))
        })
    }

    /**
    Get the render for a shortcode
    
    :param: parameters an array of shortcodesRenderParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the ShortcodeRender object
    */
    public func shortcodesRender(parameters:[shortcodesRenderParameters]? = nil, completionHandler: (ShortcodesRender?) -> Void) {
        UsingOauth2(self.wordpressOauth2Settings, performWithToken: { token in
            Alamofire.request(WordPressRequestConvertible.ShortcodesRender(token, Dictionary<String,AnyObject>(associated: parameters)))
                .responseObject { (result:Result<ShortcodesRender>) -> Void in
                    self.handleResponse(result, completionHandler: completionHandler)
            }
        }, errorHandler: {
            completionHandler(self.oauthError(ShortcodesRender()))
        })
    }
    
    /**
    Get the list of embeds
    
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Embeds object
    */
    public func embeds(parameters:[basicContextParameters]? = nil, completionHandler: (Embeds?) -> Void) {
        UsingOauth2(self.wordpressOauth2Settings, performWithToken: { token in
            Alamofire.request(WordPressRequestConvertible.ShortcodesRender(token, Dictionary<String,AnyObject>(associated: parameters)))
                .responseObject { (result:Result<Embeds>) -> Void in
                    self.handleResponse(result, completionHandler: completionHandler)
            }
            }, errorHandler: {
                completionHandler(self.oauthError(Embeds()))
        })
    }

    /**
    Get an embeds render
    
    :param: parameters an array of embedsRenderParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the EmbedsRender object
    */
    public func embedsRender(parameters:[embedsRenderParameters]? = nil, completionHandler: (EmbedsRender?) -> Void) {
        UsingOauth2(self.wordpressOauth2Settings, performWithToken: { token in
            Alamofire.request(WordPressRequestConvertible.ShortcodesRender(token, Dictionary<String,AnyObject>(associated: parameters)))
                .responseObject { (result:Result<EmbedsRender>) -> Void in
                    self.handleResponse(result, completionHandler: completionHandler)
            }
            }, errorHandler: {
                completionHandler(self.oauthError(EmbedsRender()))
        })
    }

}