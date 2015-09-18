//
//  EVWordpressParameters.swift
//  EVWordPressAPI
//
//  Created by Edwin Vermeer on 9/14/15.
//  Copyright © 2015 evict. All rights reserved.
//

import Foundation
import EVReflection


/**
Basic parameters for calls like the users, me, site, ..
*/
public enum basicParameters: EVAssociated {
    case http_envelope(Bool)
    case pretty(Bool)
    case meta(String)
    case fields(String)
    case callback(String)
}

/**
Parameters for the shortcodes call
*/
public enum basicContextParameters: EVAssociated {
    case context(String)
    case http_envelope(Bool)
    case pretty(Bool)
    case meta(String)
    case fields(String)
    case callback(String)
}



// MARK: - Users

/**
Parameters for the users call
*/
public enum usersParameters: EVAssociated {
    case context(String)
    case http_envelope(Bool)
    case pretty(Bool)
    case meta(String)
    case fields(String)
    case callback(String)
    case number(Int)
    case offset(Int)
    case order(String)
    case order_by(String)
    case authors_only(Bool)
    case type(String)
}


/**
Parameters for the suggest call
*/
public enum suggestParameters: EVAssociated {
    case context(String)
    case http_envelope(Bool)
    case pretty(Bool)
    case meta(String)
    case fields(String)
    case callback(String)
    case site_id(Int)
    case site(String)
    case filter(String)
    case image_size(Int)
    case client(String)
}


// MARK: - Sites


// MARK: - Posts

/**
Parameters for the users call
*/
public enum postsParameters: EVAssociated {
    case context(String)
    case http_envelope(Bool)
    case pretty(Bool)
    case meta(String)
    case fields(String)
    case callback(String)
    case number(Int)
    case offset(Int)
    case page(Int)
    case page_handle(String)
    case order(String)
    case order_by(String)
    case after(NSDate)
    case before(NSDate)
    case modified_after(NSDate)
    case modified_before(NSDate)
    case tag(String)
    case category(String)
    case type(String)
    case parent_id(Int)
    case exclude([Int])
    case exclude_tree(Int)
    case status(String)
    case sticky(String)
    case author(Int)
    case search(String)
    case meta_key(String)
    case meta_value(String)
}

/**
Parameters for the shortcodes call
*/
public enum shortcodesRenderParameters: EVAssociated {
    case context(String)
    case http_envelope(Bool)
    case pretty(Bool)
    case meta(String)
    case fields(String)
    case callback(String)
    case shortcode(String)
}

/**
Parameters for the embedsRender call
*/
public enum embedsRenderParameters:EVAssociated {
    case context(String)
    case http_envelope(Bool)
    case pretty(Bool)
    case meta(String)
    case fields(String)
    case callback(String)
    case embed_url(String)
}

