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
    case Follows(Dictionary<String, AnyObject>?)
    case FollowsMine(Dictionary<String, AnyObject>?)
    case Insights(Dictionary<String, AnyObject>?)
    case InsightsSlug(Dictionary<String, AnyObject>?, String)
    case TagStatus(Dictionary<String, AnyObject>?, String)
    case Following(Dictionary<String, AnyObject>?)
    case Recommendations(Dictionary<String, AnyObject>?)
    case Stats(Dictionary<String, AnyObject>?)
    case StatsSummary(Dictionary<String, AnyObject>?)
    case StatsTopTasks(Dictionary<String, AnyObject>?)
    case StatsVideo(Dictionary<String, AnyObject>?, String)
    case StatsReferrers(Dictionary<String, AnyObject>?)
    case StatsClicks(Dictionary<String, AnyObject>?)
    case StatsTags(Dictionary<String, AnyObject>?)
    case StatsAuthors(Dictionary<String, AnyObject>?)
    case StatsComments(Dictionary<String, AnyObject>?)
    case StatsVideoPlays(Dictionary<String, AnyObject>?)
    case StatsPost(Dictionary<String, AnyObject>?)

    
    var path: String {
        switch self {
        case .Users(_):
            return "/sites/\(WordPressRequestConvertible.site)/users"
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
        case .Follows(_):
            return "/sites/\(WordPressRequestConvertible.site)/follows"
        case .FollowsMine(_):
            return "/sites/\(WordPressRequestConvertible.site)/follows/mine"
        case .Insights(_):
            return "/insights"
        case .InsightsSlug(_, let slug):
            return "/insights\(slug)"
        case .TagStatus(_, let tag):
            return "/read/tags/\(tag)/mine"
        case .Following(_):
            return "/read/following/mine"
        case .Recommendations(_):
            return "/read/recommendations/mine"
        case .Stats(_):
            return "/sites/\(WordPressRequestConvertible.site)/stats"
        case .StatsSummary(_):
            return "/sites/\(WordPressRequestConvertible.site)/stats/summary"
        case .StatsTopTasks(_):
            return "/sites/\(WordPressRequestConvertible.site)/stats/top-posts"
        case .StatsVideo(_, let id):
            return "/sites/\(WordPressRequestConvertible.site)/stats/viceo/\(id)"
        case .StatsReferrers(_):
            return "/sites/\(WordPressRequestConvertible.site)/stats/referrers"
        case .StatsClicks(_):
            return "/sites/\(WordPressRequestConvertible.site)/stats/clicks"
        case .StatsTags(_):
            return "/sites/\(WordPressRequestConvertible.site)/stats/tags"
        case .StatsAuthors(_):
            return "/sites/\(WordPressRequestConvertible.site)/stats/top-authors"
        case .StatsComments(_):
            return "/sites/\(WordPressRequestConvertible.site)/stats/comments"
        case .StatsVideoPlays(_):
            return "/sites/\(WordPressRequestConvertible.site)/stats/video-plays"
        case .StatsPost(_):
            return "/sites/\(WordPressRequestConvertible.site)/stats/stats-post"  //TODO: TEST
        }
    }
    
    var URLRequest: NSMutableURLRequest { get
        {
            let URL = NSURL(string: WordPressRequestConvertible.baseURLString!)!
            let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(self.path))
            mutableURLRequest.HTTPMethod = "GET"
            
            var parameters = self.associated.value as? [String:AnyObject]
            if parameters == nil {
                if (self.associated.value as? ([String:AnyObject]?, String)) != nil {
                    let (param, _) = (self.associated.value as? ([String:AnyObject]?, String))!
                    parameters = param
                }
            }
            
            if let t = WordPressRequestConvertible.token {
                mutableURLRequest.setValue("Bearer \(t)", forHTTPHeaderField: "Authorization")
            }
            let encoding = Alamofire.ParameterEncoding.URL
            return encoding.encode(mutableURLRequest, parameters: parameters).0
        }
    }
}



