//
//  EVWordPressAPI_FreshlyPressed.swift
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
    // MARK: - FreshlyPressed
    
    
    /**
    Get information about a single category.
    See: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/categories/slug:%24category/
    
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Posts object
    :return: No return value
    */
    public func freshlyPressed(parameters:[basicContextParameters]? = nil, completionHandler: (Posts?) -> Void) {
        genericCall("/freshly-pressed", parameters:parameters, completionHandler: completionHandler)
    }
}