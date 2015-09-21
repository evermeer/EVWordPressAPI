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
import EVReflection

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
        genericCall("/sites/\(self.site)", parameters: parameters, completionHandler: completionHandler)
    }
    
    /**
    Get page templates for a site
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/page-templates/
    
    :parameter: parameters: an array of basicParameters. For a complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Template object
    */
    public func pageTemplates(parameters:[basicParameters]? = nil, completionHandler: (Templates?) -> Void) {
        genericCall("/sites/\(self.site)/page-templates", parameters: parameters, completionHandler: completionHandler)
    }
            
    /**
    Get the available shortcodes for a site
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/shortcodes/
    
    :param: parameters an array of shortcodesParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Shortcodes object
    */
    public func shortcodes(parameters:[basicContextParameters]? = nil, completionHandler: (Shortcodes?) -> Void) {
        genericOauthCall(.Shortcodes(pdict(parameters)), completionHandler: completionHandler)
    }

    /**
    Get the render for a shortcode
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/shortcodes/render/
    
    :param: parameters an array of shortcodesRenderParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the ShortcodeRender object
    */
    public func shortcodesRender(parameters:[shortcodesRenderParameters]? = nil, completionHandler: (ShortcodesRender?) -> Void) {
        genericOauthCall(.ShortcodesRender(pdict(parameters)), completionHandler: completionHandler)
    }
    
    /**
    Get the list of embeds
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/embeds/
    
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Embeds object
    */
    public func embeds(parameters:[basicContextParameters]? = nil, completionHandler: (Embeds?) -> Void) {
        genericOauthCall(.Embeds(pdict(parameters)), completionHandler: completionHandler)
    }

    /**
    Get an embeds render
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/embeds/render/
    
    :param: parameters an array of embedsRenderParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the EmbedsRender object
    */
    public func embedsRender(parameters:[embedsRenderParameters]? = nil, completionHandler: (EmbedsRender?) -> Void) {
        genericOauthCall(.EmbedsRender(pdict(parameters)), completionHandler: completionHandler)
    }

    /**
    Get a list of the current user's sites.
    See: https://developer.wordpress.com/docs/api/1.1/get/me/sites/
    
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Embeds object
    */
    public func meSites(parameters:[meSitesParameters]? = nil, completionHandler: (Sites?) -> Void) {
        genericOauthCall(.MeSites(pdict(parameters)), completionHandler: completionHandler)
    }

    /**
    Get the list of widgets
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/widgets/
    
    :param: parameters an array of basicParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Widgets object
    */
    public func widgets(parameters:[basicParameters]? = nil, completionHandler: (Widgets?) -> Void) {
        genericCall("/sites/\(self.site)/widgets", parameters: parameters, completionHandler: completionHandler)
    }

    /**
    Get the settings of a widget
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/widgets/widget:%24id/
    
    :param: id A specific widget id.
    :param: parameters an array of basicParameters. For complete list plus documentation see the api documentation.
    :param: completionHandler A code block that will be called with the Widgets object
    */
    public func widget(id:String, parameters:[basicParameters]? = nil, completionHandler: (Widget?) -> Void) {
        genericCall("/sites/\(self.site)/widgets/widget:\(id)", parameters: parameters, completionHandler: completionHandler)
    }

    /**
    Get the custom header options for a site with a particular theme.
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/headers/%24theme_slug/
    
    :param: themeSlug: The slug of the theme
    :param: parameters an array of basicParameters. For complete list plus documentation see the api documentation.
    :param: completionHandler A code block that will be called with the Widgets object
    */
    public func headersForTheme(themeSlug:String, parameters:[basicContextParameters]? = nil, completionHandler: (Header?) -> Void) {
        genericCall("/sites/\(self.site)/headers/\(themeSlug)", parameters: parameters, completionHandler: completionHandler)
    }

    /**
    Get the custom header options for a site.
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/headers/mine/
    
    :param: parameters an array of basicParameters. For complete list plus documentation see the api documentation.
    :param: completionHandler A code block that will be called with the Widgets object
    */
    public func headers(parameters:[basicContextParameters]? = nil, completionHandler: (Header?) -> Void) {
        genericCall("/sites/\(self.site)/headers/mine", parameters: parameters, completionHandler: completionHandler)
    }

}


