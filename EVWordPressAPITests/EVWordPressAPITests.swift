//
//  EVWordPressAPITests.swift
//  EVWordPressAPITests
//
//  Created by Edwin Vermeer on 7/22/15.
//  Copyright (c) 2015 evict. All rights reserved.
//

import UIKit
import XCTest
import AlamofireOauth2
import EVReflection

class EVWordPressAPITests: XCTestCase {
    
    let baseUrl = "https://public-api.wordpress.com/rest/v1.1"
    
    // Create your own clientID and clientSecret at https://developer.wordpress.com/docs/oauth2/
    let wordpressOauth2Settings = Oauth2Settings(
        baseURL: "https://public-api.wordpress.com/rest/v1.1",
        authorizeURL: "https://public-api.wordpress.com/oauth2/authorize",
        tokenURL: "https://public-api.wordpress.com/oauth2/token",
        redirectURL: "alamofireoauth2://wordpress/oauth_callback",
        clientID: "????????????",
        clientSecret: "????????????"
    )

    var api:EVWordPressAPI!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.api = EVWordPressAPI(baseUrl: self.baseUrl, site: "evict.nl")
        EVReflection.setBundleIdentifier(Posts.self)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPosts() {
        let expect = expectation(description: "")
        // For parameters and other details see: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/posts/
        api.posts([.number(19)]) { result in
            if let err = result?.error, let message = result?.message {
                print("Warning: WordPress error \(err) : \(message)")
            } else {
                print("Number of posts = \(result?.found), returend by call = \(result?.posts.count)")
                XCTAssertEqual(result?.posts.count ?? 0, 19, "Number of returned posts should be 19")
            }
            expect.fulfill()
        }

        waitForExpectations(timeout: 10) { (error:Error?) -> Void in
            XCTAssertNil(error, "\(error)")
        }
    }

    func testSite() {
        let expect = expectation(description: "")
        // For parameters and other details see: https://developer.wordpress.com/docs/api/1.1/get/sites/%24site/
        api.site { result in
            if let err = result?.error, let message = result?.message {
                print("Warning: WordPress error \(err) : \(message)")
            } else {
                print("Site name = \(result?.name), description = \(result?._description)")
                XCTAssertEqual(result?.name ?? "", "E.V.I.C.T. B.V.", "Site name should be 'E.V.I.C.T. B.V.'")
            }
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error: Error?) -> Void in
            XCTAssertNil(error, "\(error)")
        }
    }
    
    func testReadMenu() {
        let expect = expectation(description: "")
        api.readMenu { result in
            if let err = result?.error, let message = result?.message {
                print("Warning: WordPress error \(err) : \(message)")
            } else {
                print("default = \(result?._default), subscribed = \(result?.subscribed), recommended = \(result?.recommended)")
                XCTAssertTrue(result?.recommended?.list.count ?? 0 > 10, "Menu should return more than 10 items")
            }
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error: Error?) -> Void in
            XCTAssertNil(error, "\(error)")
        }
    }
    
    func testTags() {
        let expect = expectation(description: "")
        api.readerTags { result in
            if let err = result?.error, let message = result?.message {
                print("Warning: WordPress error \(err) : \(message)")
            } else {
                print("tags = \(result?.tags)")
                //XCTAssertTrue(result?.tags?.tags.count > 1, "Tags should return more than 1 items")
            }
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error: Error?) -> Void in
            XCTAssertNil(error, "\(error)")
        }
    }

    
    
    func testTag() {
        let expect = expectation(description: "")
        api.readerTag(tag: "WordPress") { result in
            if let err = result?.error, let message = result?.message {
                print("Warning: WordPress error \(err) : \(message)")
            } else {
                print("tags = \(result?.tag)")
                XCTAssertEqual(result?.tag?.title, "WordPress", "Menu should return more than 1 items")
            }
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error: Error?) -> Void in
            XCTAssertNil(error, "\(error)")
        }
    }
    
    
    func testEnum() {
        let parameters:[usersParameters] = [.number(19), .authors_only(false)]
        let y = WordPressRequestConvertible.MeLikes(Dictionary(associated: parameters))
        let associated = y.associated
        let label = associated.label
        let value = associated.value
        print("\(label) = \(value) - \(type(of: value))")
//        let param = associated.value as! [String:AnyObject]?
//        print("\(label), params = \(param)")
    }
}
