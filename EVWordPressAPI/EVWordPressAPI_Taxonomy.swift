//
//  EVWordPressAPI_Taxonomy.swift
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
    // MARK: - Taxonomy
    
    
    /**
    Get information about a single category.
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/categories/slug:%24category/
    
    :param: category The category where you want to get the information of
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Posts object
    :return: No return value
    */
    public func category(category:String?, parameters:[basicContextParameters]? = nil, completionHandler: (Taxonomy?) -> Void) {
        genericCall("/sites/\(self.site)/categories/slug:\(category)", parameters:parameters, completionHandler: completionHandler)
    }

    
    /**
    Get a list of a site's categories.
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/categories/
    
    :param: category The category where you want to get the information of
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Posts object
    :return: No return value
    */
    public func categories(parameters:[basicContextParameters]? = nil, completionHandler: (Categories?) -> Void) {
        genericCall("/sites/\(self.site)/categories/", parameters:parameters, completionHandler: completionHandler)
    }

    
    /**
    Get a list of a site's tags.
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/tags/
    
    :param: parameters an array of tagsParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Posts object
    :return: No return value
    */
    public func tags(parameters:[tagsParameters]? = nil, completionHandler: (Tags?) -> Void) {
        genericCall("/sites/\(self.site)/tags/", parameters:parameters, completionHandler: completionHandler)
    }

    
    /**
    Get information about a single tag.
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/tags/slug:%24tag/
    
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Posts object
    :return: No return value
    */
    public func tag(tag:String, parameters:[basicContextParameters]? = nil, completionHandler: (Taxonomy?) -> Void) {
        genericCall("/sites/\(self.site)/tags/slug:\(tag)", parameters:parameters, completionHandler: completionHandler)
    }
}