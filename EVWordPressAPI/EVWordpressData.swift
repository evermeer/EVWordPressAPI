//
//  EVWordpressData.swift
//
//  Created by Edwin Vermeer on 7/12/15.
//  Copyright (c) 2015 evict. All rights reserved.
//
import Foundation
import EVReflection

public class WPObject: EVObject {
    var error: String?
    var message: String?
}

public class Posts: WPObject {
    var found: Int = 0
    var date_range:DateRange?
    var number: Int = 0
    var posts: [Post] = [Post]()
    var meta: Meta?
}

public class Post: WPObject {
    var ID: Int = 0
    var site_ID: Int = 0
    var author: Author?
    var date: String?
    var modified: String?
    var title: String?
    var URL: String?
    var link: String?
    var short_URL: String?
    var other_URLs: String?
    var content: String?
    var excerpt: String?
    var slug: String?
    var guid: String?
    var status: String?
    var sticky: Bool = false
    var password: String?
    var parent: Bool = false
    var type: String?
    var comments_open: Bool = false
    var pings_open: Bool = false
    var likes_enabled: Bool = false
    var sharing_enabled: Bool = false
    var comment_count: Int = 0
    var like_count: Int = 0
    var i_like: Bool = false
    var is_reblogged: Bool = false
    var is_following: Bool = false
    var global_ID: String?
    var featured_image: String?
    var format: String?
    var geo: Bool = false
    var menu_order: Int = 0
    var publicize_URLs: [String] = [String]()
    var tags: Tags?
    var categories: Categories?
    var attachments: Attachments?
    var metadata: [Metadata] = [Metadata]()
    var meta: Meta?
    var current_user_can: Capabilities?
    var capabilities: Capabilities?
    var post_thumbnail: Attachment?
    var page_template: String?
    var attachment_count: Int = 0
    var discussion: Discussion?
    var pseudo_ID: String?
    var is_external: Bool = false
    var site_name: String?
    var site_is_private: String?
    var featured_Media: Attachment?
    var editorial: Editorial?
}

public class Discussion: EVObject {
    var comments_open: Bool = false
    var comment_status: String?
    var pings_open: Bool = false
    var ping_status: String?
    var comment_count: Int = 0
}

public class Meta: EVObject {
    var links: Links?
    var next_page: String?
}

public class Links: EVObject {
    var _self: String?
    var help: String?
    var site: String?
    var flags: String?
    var post: String?
    var posts: String?
    var replies: String?
    var comments: String?
    var likes: String?
    var counts: String?
    var xmlrpc: String?
}

public class Metadata: EVObject {
    var id: String?
    var key: String?
    var value: String?
}

public class Author: EVObject {
    var ID: Int = 0
    var login: String?
    var email: Bool = false
    var name: String?
    var first_name: String?
    var last_name: String?
    var nice_name: String?
    var URL: String?
    var avatar_URL: String?
    var profile_URL: String?
    var site_ID: String?
}

public class Capabilities: EVObject {
    var publish_post: Bool = false
    var delete_post: Bool = false
    var edit_post: Bool = false
}


public class Categories: WPObject {
    var found: Int = 0
    var categories = [Taxonomy]()
    
    // This way we can solve that the JSON uses values for keys
    public override func setValue(value: AnyObject!, forUndefinedKey key: String) {
        if let dic = value as? NSDictionary {
            categories.append(Taxonomy(dictionary: dic))
            return
        }
        NSLog("---> setValue for key '\(key)' should be handled.")
    }
}

public class TagsWrapper: WPObject {
    var tags:Tags?
}

public class Tags: WPObject {
    var found: Int = 0
    var tags:[Taxonomy] = [Taxonomy]()
    
    // This way we can solve that the JSON uses values for keys
    public override func setValue(value: AnyObject!, forUndefinedKey key: String) {
        if let dic = value as? NSDictionary {
            tags.append(Taxonomy(dictionary: dic))
            return
        }
        NSLog("---> setValue for key '\(key)' should be handled.")
    }
}

public class Taxonomy: WPObject {
    var ID: Int = 0
    var name: String?
    var title: String?
    var slug: String?
    var _description: String?
    var post_count: Int = 0
    var meta: Meta?
    var parent: Int = 0
}

public class Attachments: EVObject {
    var IDs = [Attachment]()
    
    // This way we can solve that the JSON has numeric fields that are used as keys
    public override func setValue(value: AnyObject!, forUndefinedKey key: String) {
        if let _ = Int(key), dic = value as? NSDictionary {
            IDs.append(Attachment(dictionary: dic))
            return
        }
        NSLog("---> setValue for key '\(key)' should be handled.")
    }
}

public class Attachment: EVObject {
    var ID: Int = 0
    var URL: String?
    var guid: String?
    var mime_type: String?
    var width: Int = 0
    var height: Int = 0
}

public class Users: WPObject {
    var found: Int = 0
    var users: [User]? = [User]()
    var authors: [User]? = [User]()
}

public class User: WPObject {
    var ID: Int = 0
    var display_name: String?
    var username: String?
    var email: String?
    var primary_blog: Int = 0
    var language: String?
    var token_site_id: Int = 0
    var token_scope: [String]? = [String]()
    var avatar_URL: String?
    var profile_URL: String?
    var verified: Bool = false
    var email_verified: Bool = false
    var date: String?
    var site_count: Int = 0
    var visible_site_count: Int = 0
    var has_unseen_notes: Bool = false
    var newest_note_type: String?
    var phone_account: Bool = false
    var meta: Meta?
    var URL: String?
    var linked_user_ID: Int = 0
    var name: String?
    var is_valid_google_apps_country: Bool = true
}

public class Suggestion: EVObject {
    var ID: Int = 0
    var user_login: String?
    var display_name: String?
    var source: [String]? = [String]()
    var image_URL: String?
}

public class Suggestions: WPObject {
    var suggestions: [Suggestion]? = [Suggestion]()
}

public class Like: EVObject {
    var ID: Int = 0
    var login: String?
    var email: Bool = false
    var name: String?
    var nice_name: String?
    var URL: String?
    var avatar_URL: String?
    var profile_URL:  String?
    var default_vavatar: Bool = false
    var site_id: String?
    var post_id: String?
    var meta: Links?
    var added: String?
}

public class Likes: WPObject {
    var found: Int = 0
    var i_like: Bool = false
    var like_count: Int = 0
    var site_ID: Int = 0
    var post_ID: Int = 0
    var likes: [Like]? = [Like]()
    var meta: Meta?
}

public class Icon: EVObject {
    var img: String?
    var ico: String?
}

public class Logo: EVObject {
    var id: Int = 0
    var sizes: [String]? = [String]()
    var url: String?
}

public class Site: WPObject {
    var ID: Int = 0
    var name: String?
    var _description: String?
    var URL: String?
    var jetpack: Bool = true
    var subscribers_count: Int = 0
    var icon: Icon?
    var logo: Logo?
    var is_private: Bool = false
    var is_following: Bool = false
    var meta: Meta?
}

public class Shortcodes: WPObject {
    var shortcodes:[String]? = []
}

public class Template: EVObject {
    var label: String?
    var file: String?
}

public class Headers: EVObject {
    var Date:String?
    var Content_Type: String?
}

public class Templates: WPObject
{
    var templates: [Template]? = [Template]()
    var _headers: Headers?
}

public class Script_Slug: EVObject {
    var src: String?
    var extra: String?
}

public class Style_Slug: EVObject {
    var src: String?
    var media: String?
}

public class Scripts: EVObject {
    var scripts = [String: Script_Slug]()
    
    // This way we can solve that the JSON has arbitrary keys
    public override func setValue(value: AnyObject!, forUndefinedKey key: String) {
        if let dic = value as? NSDictionary {
            scripts[key] = Script_Slug(dictionary: dic)
            return
        }
        NSLog("---> setValue for key '\(key)' should be handled.")
    }
}

public class Styles: EVObject {
    var styles = [String: Style_Slug]()
    
    // This way we can solve that the JSON has arbitrary keys
    public override func setValue(value: AnyObject!, forUndefinedKey key: String) {
        if let dic = value as? NSDictionary {
            styles[key] = Style_Slug(dictionary: dic)
            return
        }
        NSLog("---> setValue for key '\(key)' should be handled.")
    }
}

public class ShortcodesRender: WPObject {
    var shortcode: String?
    var result: String?
    var scripts: Scripts?
    var styles: Styles?
    var _headers: Headers?
}

public class Embeds: WPObject {
    var embeds: [String]? = []
}

public class EmbedsRender: WPObject {
    var embed_url: String?
    var result: String?
}

public class Sites: WPObject {
    var sites: [Site]? = []
}

public class Setting: EVObject {
    
}

public class Widget: WPObject {
    var id: String?
    var sidebar: String?
    var position: NSNumber?
    var settings: [Setting]? = []
}

public class Widgets: WPObject {
    var widgets: [Widget]? = []
}

public class Header: WPObject {
    var random_default: Bool = false
    var random_uploaded: Bool = false
    var text_color: String?
    var url: String?
    var width: Int = 0
    var height: Int = 0
    var defaults: String?
}

public class Reblogs: WPObject {
    var is_reblogged: Bool = false
    var meta: Meta?
    var ID: Int = 0
}

public class Comments: WPObject {
    var found: Int = 0
    var site_ID: Int = 0
    var comments: [Comment]? = []
}

public class Comment: WPObject {
    var ID: Int = 0
    var post: Post?
    var author: Author?
    var date: NSDate?
    var URL: String?
    var short_URL: String?
    var content: String?
    var status: String?
    var parent: Bool = false
    var type: String?
    var like_count: Int = 0
    var i_like: Bool = false
    var meta: Meta?
}

public class Following: WPObject {
    var is_following: Bool = false
    var meta: Meta?
}

public class DateRange: EVObject {
    var oldest: NSDate?
    var newest: NSDate?
}

public class Editorial: EVObject {
    var blog_id: String?
    var post_id:String?
    var image: String?
    var custom_headline: String?
    var custom_blog_title: String?
    var displayed_on: NSDate?
    var picked_on: NSDate?
    var highlight_topic: String?
    var highlight_topic_title: String?
    var screen_offset: Int = 0
    var blog_name: String?
    var site_id: Int = 0
}

public class Insights: WPObject {
    var ID: Int = 0
    var name: String?
    var insights: [String]? = []
    var today: Today?
    var has_custom: Bool = false
}

public class Stat: EVObject {
    var number: Int = 0
    var percent: String?
}

public class Today: EVObject {
    var today = [String: Stat]()
    
    // This way we can solve that the JSON has arbitrary keys
    public override func setValue(value: AnyObject!, forUndefinedKey key: String) {
        if let dic = value as? NSDictionary {
            today[key] = Stat(dictionary: dic)
            return
        }
        NSLog("---> setValue for key '\(key)' should be handled.")
    }
}

public class Item: WPObject {
    var ID: Int = 0
    var title: String?
    var display_name: String?
    var URL: String?
    var slug: String?
}

public class Items: EVObject {
    var list:[String:Item] = [String:Item]()

    // This way we can solve that the JSON has arbitrary keys
    public override func setValue(value: AnyObject!, forUndefinedKey key: String) {
        if let dic = value as? NSDictionary {
            list[key] = Item(dictionary: dic)
            return
        }
        NSLog("---> setValue for key '\(key)' should be handled.")
    }
}

public class Menu: WPObject {
    var _default: Items?
    var subscribed: Items?
    var recommended: Items?
}

public class Feed: WPObject {
    var blog_ID: Int = 0
    var feed_ID: Int = 0
    var name: String?
    var URL: String?
    var feed_URL: String?
    var subscribers_count: Int = 0
}

public class Tag: WPObject {
    var tag: Item?
}

public class Status: WPObject {
    var subscribed: Bool = false
}

public class Subscription: EVObject {
    var ID: Int = 0
    var blog_ID: Int = 0
    var URL: String?
    var date_subscribed: NSDate?
    var meta: Meta?
}

public class Subscriptions: WPObject {
    var subscriptions: [Subscription]? = []
}

public class Blog: EVObject {
    var follow_source: String?
    var blog_id: Int = 0
    var follow_reco_id: String?
    var image: String?
    var nonce: String?
    var reason: String?
    var score: String?
    var title: String?
    var title_short: String?
    var url: String?
    var blog_domain: String?
    var email_follow_url: String?
}

public class Blogs: WPObject {
    var blogs: [Blog]? = []
}

public class Stats: WPObject {
    var date: NSDate?
    var stats: [Statistic]? = []
    var visits: [Visit]? = []
}

public class Statistic: EVObject {
    var visitors_today: Int = 0
    var visitors_yesterday: Int = 0
    var visitors: Int = 0
    var views_today: Int = 0
    var views_yesterday: Int = 0
    var views_best_day: NSDate?
    var views_best_day_total: Int = 0
    var views: Int = 0
    var comments: Int = 0
    var posts: Int = 0
    var followers_blog: Int = 0
    var followers_comments: Int = 0
    var comments_per_month: Int = 0
    var comments_most_active_recent_day: NSDate?
    var comments_most_active_time: String?
    var comments_spam: Int = 0
    var categories: Int = 0
    var tags: Int = 0
    var shares: Int = 0
    var shares_twitter: Int = 0
    var shares_press_this: Int = 0
    var shares_google_plus_1: Int = 0
    var shares_facebook: Int =  0
}

public class Visit: EVObject {
    var unit: String?
    var fields: [String]?
    var data:[[Int]]?
}

public class StatsSummary: WPObject {
    var date: NSDate?
    var period: String?
    var views: Int = 0
    var visitors: Int = 0
    var likes: Int = 0
    var reblogs: Int = 0
    var comments: Int = 0
    var followers: Int = 0
}

public class TopTask: EVObject {
    var day: String?
    var postviews: [String]?
    var total_views: Int = 0
    
    // This way we can solve that the JSON has arbitrary keys
    public override func setValue(value: AnyObject!, forUndefinedKey key: String) {
        if let dic = value as? NSDictionary {
            day = key
            EVReflection.setPropertiesfromDictionary(dic, anyObject: self)
            return
        }
        NSLog("---> setValue for key '\(key)' should be handled.")
    }
}

public class StatsTopTasks: WPObject {
    var date: NSDate?
    var period: String?
    var days: [TopTask]?
}

public class VideoData: EVObject {
    var date: String?
    var p: Int = 0
}

public class StatsVideo: WPObject {
    var fields: [String]?
    var data: [VideoData]?
    var pages: [String]?
    var post: Bool = false
}

public class Referrer: EVObject {
    var day: String?
    var groups: [String]?
    var other_views: Int = 0
    var total_views: Int = 0
    
    // This way we can solve that the JSON has arbitrary keys
    public override func setValue(value: AnyObject!, forUndefinedKey key: String) {
        if let dic = value as? NSDictionary {
            day = key
            EVReflection.setPropertiesfromDictionary(dic, anyObject: self)
            return
        }
        NSLog("---> setValue for key '\(key)' should be handled.")
    }
}

public class StatsReferrer: WPObject {
    var date: NSDate?
    var period: String?
    var days: [Referrer]?
}

public class Clicks: EVObject {
    var day: String?
    var clicks: [String]?
    var other_clicks: Int = 0
    var total_clicks: Int = 0
    
    // This way we can solve that the JSON has arbitrary keys
    public override func setValue(value: AnyObject!, forUndefinedKey key: String) {
        if let dic = value as? NSDictionary {
            day = key
            EVReflection.setPropertiesfromDictionary(dic, anyObject: self)
            return
        }
        NSLog("---> setValue for key '\(key)' should be handled.")
    }
}

public class StatsClicks: WPObject {
    var date: NSDate?
    var period: String?
    var days: [Clicks]?
}

public class StatsTags: WPObject {
    var date: NSDate?
    var tags: [String]?
}

public class Authors: EVObject {
    var day: String?
    var authors: [String]?
    
    // This way we can solve that the JSON has arbitrary keys
    public override func setValue(value: AnyObject!, forUndefinedKey key: String) {
        if let dic = value as? NSDictionary {
            day = key
            EVReflection.setPropertiesfromDictionary(dic, anyObject: self)
            return
        }
        NSLog("---> setValue for key '\(key)' should be handled.")
    }
}

public class StatsAuthor: EVObject {
    var name: String?
    var link: String?
    var gravatar: String?
    var comments: Int = 0
    var follow_date: Bool = false
}

public class StatsAuthors: WPObject {
    var date: NSDate?
    var day: String?
    var _days: [StatsAuthor]?
    var period: String?
    var summary: [String]?

    // This way we can solve that the JSON has arbitrary keys
    public override func setValue(value: AnyObject!, forUndefinedKey key: String) {
        if let dic = value as? NSDictionary {
            day = key
            EVReflection.setPropertiesfromDictionary(dic, anyObject: self)
            return
        }
        NSLog("---> setValue for key '\(key)' should be handled.")
    }
}

public class StatsPostInfo: EVObject {
    var name: String?
    var link: String?
    var id: Int = 0
    var comments: Int = 0
}

public class StatsComments: WPObject {
    var date: String?
    var authors: [StatsAuthor]?
    var posts: [StatsPostInfo]?
    var monthly_comments: Int = 0
    var total_comments: Int = 0
    var most_active_day: String?
    var most_active_time: String?
    var most_commented_post: [StatsPostInfo]?
}

public class StatsPlays: EVObject {
    var day: String?
    var plays: [String]?
    var other_plays: Int = 0
    var total_plays: Int = 0

    // This way we can solve that the JSON has arbitrary keys
    public override func setValue(value: AnyObject!, forUndefinedKey key: String) {
        if let dic = value as? NSDictionary {
            day = key
            EVReflection.setPropertiesfromDictionary(dic, anyObject: self)
            return
        }
        NSLog("---> setValue for key '\(key)' should be handled.")
    }
}

public class StatsVideoPlays: WPObject {
    var date: NSDate?
    var days: [StatsPlays]?
    var period: String?
    var summary: [String]?
}


public class StatsPost: WPObject {
    var date: NSDate?
    var views: Int = 0
    var years: [StatsPostData]?
    var averages: [StatsPostData]?
    var weeks: [Week]?
    var fields: [String]?
    var data: Dictionary<String,Int> = Dictionary<String,Int>()
    var highest_month: Int = 0
    var highest_day_average: Int = 0
    var highest_week_average: Int = 0
    var post: Post?
}

public class Week: EVObject {
    var days: [Day]?
    var total: Int = 0
    var average: Int = 0
    var change: Int = 0
}

public class Day: EVObject {
    var day: NSDate?
    var count: Int = 0
}

public class StatsPostData: EVObject {
    var year: String?
    var months: Dictionary<String, Int>?
    var total: Int = 0
    var overall: Int = 0
    
    // This way we can solve that the JSON has arbitrary keys
    public override func setValue(value: AnyObject!, forUndefinedKey key: String) {
        if let dic = value as? NSDictionary {
            year = key
            EVReflection.setPropertiesfromDictionary(dic, anyObject: self)
            return
        }
        NSLog("---> setValue for key '\(key)' should be handled.")
    }
}


