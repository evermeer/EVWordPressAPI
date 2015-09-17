//
//  WordPressRequestConvertible.swift
//
//  Created by Edwin Vermeer on 7/28/15.
//  Copyright (c) 2015 evict. All rights reserved.
//

import Alamofire
import EVReflection

// Alamofire implementation. For more info see https://github.com/Alamofire/Alamofire#crud--authorization
enum WordPressRequestConvertible: URLRequestConvertible, EVAssociated {
    static var baseURLString: String?
    static var site: String?
    
    case Users(String, Dictionary<String, AnyObject>?)
    case Suggest(String, Dictionary<String, AnyObject>?)
    case Me(String, Dictionary<String, AnyObject>?)
    case MeLikes(String, Dictionary<String, AnyObject>?)
    case Shortcodes(String, Dictionary<String, AnyObject>?)
    
    var path: String {
        switch self {
        case .Users( _, _):
            if let site = WordPressRequestConvertible.site {
                return "/sites/\(site)/users"
            }
            return "/sites/users"
        case .Suggest(_, _):
            return "/users/suggest"
        case .Me(_,  _):
            return "/me"
        case .MeLikes(_,  _):
            return "/me/likes"
        case .Shortcodes(_,  _):
            if let site = WordPressRequestConvertible.site {
                return "/sites/\(site)/shortcodes"
            }
            return "/sites/shortcodes"
        }
    }
    
    var URLRequest: NSMutableURLRequest { get
        {
            let URL = NSURL(string: WordPressRequestConvertible.baseURLString!)!
            let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(self.path))
            mutableURLRequest.HTTPMethod = "GET"
            
            let (token, parameters) = self.associated.value as! (String, [String:AnyObject]?)

            mutableURLRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            let encoding = Alamofire.ParameterEncoding.URL
            return encoding.encode(mutableURLRequest, parameters: parameters).0
        }
    }
}



