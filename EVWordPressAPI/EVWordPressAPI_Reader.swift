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
    // MARK: - Comments
    
    
    /**
    Get default reader menu.
    See: https://developer.wordpress.com/docs/api/1.1/get/read/menu/
    
    :param: category The category where you want to get the information of
    :param: parameters an array of basicContextParameters. For complete list plus documentation see the api documentation
    :param: completionHandler A code block that will be called with the Posts object
    :return: No return value
    */
    public func readMenu(parameters:[basicContextParameters]? = nil, completionHandler: (Menu?) -> Void) {
        genericCall("/read/menu", parameters:parameters, completionHandler: completionHandler)
    }
}