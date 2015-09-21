//
//  EVWordpressData.swift
//
//  Created by Edwin Vermeer on 7/12/15.
//  Copyright (c) 2015 evict. All rights reserved.
//

import EVReflection

public class WPObject: EVObject {
    var error: String?
    var message: String?
}

public class Posts: WPObject {
    var found: Int = 0
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
    var short_URL: String?
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
    var email: Bool = false
    var name: String?
    var URL: String?
    var avatar_URL: String?
    var profile_URL: String?
}

public class Capabilities: EVObject {
    var publish_post: Bool = false
    var delete_post: Bool = false
    var edit_post: Bool = false
}


public class Categories: EVObject {
    var categories = [Categorie]()
    
    // This way we can solve that the JSON uses values for keys
    public override func setValue(value: AnyObject!, forUndefinedKey key: String) {
        if let dic = value as? NSDictionary {
            categories.append(Categorie(dictionary: dic))
            return
        }
        NSLog("---> setValue for key '\(key)' should be handled.")
    }
}

public class Tags: EVObject {
    var tags = [Categorie]()
    
    // This way we can solve that the JSON uses values for keys
    public override func setValue(value: AnyObject!, forUndefinedKey key: String) {
        if let dic = value as? NSDictionary {
            tags.append(Categorie(dictionary: dic))
            return
        }
        NSLog("---> setValue for key '\(key)' should be handled.")
    }
}

public class Categorie: EVObject {
    var ID: Int = 0
    var name: String?
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
    var site_id: String?
    var post_id: String?
    var meta: Links?
    var added: String?
}

public class Likes: WPObject {
    var found: Int = 0
    var likes: [Like]? = [Like]()
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
