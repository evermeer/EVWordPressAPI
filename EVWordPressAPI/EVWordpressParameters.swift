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
public enum embedsRenderParameters: EVAssociated {
    case context(String)
    case http_envelope(Bool)
    case pretty(Bool)
    case meta(String)
    case fields(String)
    case callback(String)
    case embed_url(String)
}

/**
Parameters for the meSites call
*/
public enum meSitesParameters: EVAssociated {
    case context(String)
    case http_envelope(Bool)
    case pretty(Bool)
    case meta(String)
    case fields(String)
    case callback(String)
    case site_visibility(String)
}

/**
Parameters for the shortcodes call
*/
public enum commentsParameters: EVAssociated {
    case context(String)
    case http_envelope(Bool)
    case pretty(Bool)
    case meta(String)
    case fields(String)
    case callback(String)
    case number(Int)
    case offset(Int)
    case page(Int)
    case order(String)
    case hierarchical(Bool)
    case after(NSDate)
    case before(NSDate)
    case type(String)
    case status(String)
}

/**
Parameters for the tags call
*/
public enum tagsParameters: EVAssociated {
    case context(String)
    case http_envelope(Bool)
    case pretty(Bool)
    case meta(String)
    case fields(String)
    case callback(String)
    case number(Int)
    case offset(Int)
    case page(Int)
    case search(String)
    case order(String)
    case order_by(String)
}

/**
Parameters for the follows call
*/
public enum followsParameters: EVAssociated {
    case context(String)
    case http_envelope(Bool)
    case pretty(Bool)
    case meta(String)
    case fields(String)
    case callback(String)
    case page(Int)
    case number(Int)
}

/**
Parameters for the freshlyPressed call
*/
public enum freshlyPressedParameters: EVAssociated {
    case context(String)
    case http_envelope(Bool)
    case pretty(Bool)
    case meta(String)
    case fields(String)
    case callback(String)
    case number(Int)
    case after(NSDate)
    case before(NSDate)
    case content_width(Int)
    case thumb_width(Int)
    case thumb_height(Int)
}

/**
Parameters for the insightsForSlub call
*/
public enum insightsForSlugParameters: EVAssociated {
    case context(String)
    case http_envelope(Bool)
    case pretty(Bool)
    case meta(String)
    case fields(String)
    case callback(String)
    case unit(String)
    case after(NSDate)
    case before(NSDate)
    case slug(String)
}

/**
Parameters for the following call
*/
public enum followingParameters: EVAssociated {
    case context(String)
    case http_envelope(Bool)
    case pretty(Bool)
    case meta(String)
    case fields(String)
    case callback(String)
    case number(Int)
    case page(Int)
    case order(String)
    case after(NSDate)
    case before(NSDate)
}

/**
Parameters for the following call
*/
public enum recommendationsParameters: EVAssociated {
    case context(String)
    case http_envelope(Bool)
    case pretty(Bool)
    case meta(String)
    case fields(String)
    case callback(String)
    case exclude(String)
    case number(Int)
    case lang(String)
    case source(String)
}

/**
 Parameters for the shortcodes call
 */
public enum statsSummaryParameters: EVAssociated {
    case context(String)
    case http_envelope(Bool)
    case pretty(Bool)
    case meta(String)
    case fields(String)
    case callback(String)
    case num(Int)
    case period(String)
    case date(String)
    case offset(Int)
}

/**
 Parameters for the stats referrers call
 */
public enum statsReferrersParameters: EVAssociated {
    case context(String)
    case http_envelope(Bool)
    case pretty(Bool)
    case meta(String)
    case fields(String)
    case callback(String)
    case num(Int)
    case period(String)
    case date(String)
    case max(Int)
    case offset(Int)
}

/**
 Parameters for the stats tags call
*/
public enum statsTagsParameters: EVAssociated {
    case context(String)
    case http_envelope(Bool)
    case pretty(Bool)
    case meta(String)
    case fields(String)
    case callback(String)
    case max(Int)
}



