//
//  WordPressRequestConvertible.swift
//
//  Created by Edwin Vermeer on 7/28/15.
//  Copyright (c) 2015 evict. All rights reserved.
//

import Alamofire


// Alamofire implementation. For more info see https://github.com/Alamofire/Alamofire#crud--authorization
enum WordPressRequestConvertible: URLRequestConvertible {
    static var baseURLString: String?
    static var site: String?
    
    case Users(String, Dictionary<String, AnyObject>?)
    case Suggest(String, Dictionary<String, AnyObject>?)
    case Me(String, Dictionary<String, AnyObject>?)
    case MeLikes(String, Dictionary<String, AnyObject>?)
    case Shortcodes(String, Dictionary<String, AnyObject>?)
    
    var path: String {
        switch self {
        case .Users(let _, let _):
            if let site = WordPressRequestConvertible.site {
                return "/sites/\(site)/users"
            }
            return "/sites/users"
        case .Suggest(let _, let _):
            return "/users/suggest"
        case .Me(let _, let _):
            return "/me"
        case .MeLikes(let _, let _):
            return "/me/likes"
        case .Shortcodes(let _, let _):
            if let site = WordPressRequestConvertible.site {
                return "/sites/\(site)/shortcodes"
            }
            return "/sites/shortcodes"
        }
    }

    var params: Dictionary<String, AnyObject>? {
        switch self {
        case .Users(let _, let p):
            return p
        case .Suggest(let _, let p):
            return p
        case .Me(let _, let p):
            return p
        case .MeLikes(let _, let p):
            return p
        case .Shortcodes(let _, let p):
            return p
        }
    }

    var token: String? {
        switch self {
        case .Users(let t, let _):
            return t
        case .Suggest(let t, let _):
            return t
        case .Me(let t, let _):
            return t
        case .MeLikes(let t, let _):
            return t
        case .Shortcodes(let t, let _):
            return t
        }
    }

    var URLRequest: NSURLRequest {
        let URL = NSURL(string: WordPressRequestConvertible.baseURLString!)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(self.path))
        
        mutableURLRequest.HTTPMethod = "GET"
        
        if let token = self.token {
            mutableURLRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        if let parameters = self.params {
            let encoding = Alamofire.ParameterEncoding.URL
            return encoding.encode(mutableURLRequest, parameters: parameters).0
        } else {
            return mutableURLRequest
        }
        
    }
    
}