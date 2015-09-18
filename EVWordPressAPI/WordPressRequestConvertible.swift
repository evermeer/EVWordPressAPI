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
    static var token: String?
    
    case Users(Dictionary<String, AnyObject>?)
    case Suggest(Dictionary<String, AnyObject>?)
    case Me(Dictionary<String, AnyObject>?)
    case MeLikes(Dictionary<String, AnyObject>?)
    case Shortcodes(Dictionary<String, AnyObject>?)
    case ShortcodesRender(Dictionary<String, AnyObject>?)
    case Embeds(Dictionary<String, AnyObject>?)
    case EmbedsRender(Dictionary<String, AnyObject>?)
    case MeSites(Dictionary<String, AnyObject>?)
    
    var path: String {
        switch self {
        case .Users(_):
            if let site = WordPressRequestConvertible.site {
                return "/sites/\(site)/users"
            }
            return "/sites/users"
        case .Suggest(_):
            return "/users/suggest"
        case .Me(_):
            return "/me"
        case .MeLikes(_):
            return "/me/likes"
        case .Shortcodes(_):
            return "/sites/\(WordPressRequestConvertible.site)/shortcodes"
        case .ShortcodesRender(_):
            return "/sites/\(WordPressRequestConvertible.site)/shortcodes/render"
        case .Embeds(_):
            return "/sites/\(WordPressRequestConvertible.site)/embeds"
        case .EmbedsRender(_):
            return "/sites/\(WordPressRequestConvertible.site)/embeds/render"
        case .MeSites(_):
            return "/me/sites"
        }
    }
    
    var URLRequest: NSMutableURLRequest { get
        {
            let URL = NSURL(string: WordPressRequestConvertible.baseURLString!)!
            let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(self.path))
            mutableURLRequest.HTTPMethod = "GET"
            
            let parameters = self.associated.value as! [String:AnyObject]?
            if let t = WordPressRequestConvertible.token {
                mutableURLRequest.setValue("Bearer \(t)", forHTTPHeaderField: "Authorization")
            }
            let encoding = Alamofire.ParameterEncoding.URL
            return encoding.encode(mutableURLRequest, parameters: parameters).0
        }
    }
}



