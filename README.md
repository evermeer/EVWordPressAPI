# EVWordPressAPI

A Swift implementation of the WordPress (Jetpack) API.

[![Git](https://img.shields.io/badge/API%20call%20count-46-brightgreen.svg?style=flat)](https://github.com/evermeer/EVWordPressAPI#progress)

<!---
 [![Circle CI](https://img.shields.io/circleci/project/evermeer/EVWordPressAPI.svg?style=flat)](https://circleci.com/gh/evermeer/EVWordPressAPI)
  -->
[![Build Status](https://travis-ci.org/evermeer/EVWordPressAPI.svg?style=flat)](https://travis-ci.org/evermeer/EVWordPressAPI)
[![Issues](https://img.shields.io/github/issues-raw/evermeer/EVWordPressAPI.svg?style=flat)](https://github.com/evermeer/EVWordPressAPI/issues)
[![Stars](https://img.shields.io/github/stars/evermeer/EVWordPressAPI.svg?style=flat)](https://github.com/evermeer/EVWordPressAPI/stargazers)
[![Version](https://img.shields.io/cocoapods/v/EVWordPressAPI.svg?style=flat)](http://cocoadocs.org/docsets/EVWordPressAPI)
[![License](https://img.shields.io/cocoapods/l/EVWordPressAPI.svg?style=flat)](http://cocoadocs.org/docsets/EVWordPressAPI)
[![Platform](https://img.shields.io/cocoapods/p/EVWordPressAPI.svg?style=flat)](http://cocoadocs.org/docsets/EVWordPressAPI)

[![Git](https://img.shields.io/badge/GitHub-evermeer-blue.svg?style=flat)](https://github.com/evermeer)
[![Twitter](https://img.shields.io/badge/twitter-@evermeer-blue.svg?style=flat)](http://twitter.com/evermeer)
[![LinkedIn](https://img.shields.io/badge/linkedin-Edwin%20Vermeer-blue.svg?style=flat)](http://nl.linkedin.com/in/evermeer/en)
[![Website](https://img.shields.io/badge/website-evict.nl-blue.svg?style=flat)](http://evict.nl)
[![eMail](https://img.shields.io/badge/email-edwin@evict.nl-blue.svg?style=flat)](mailto:edwin@evict.nl?SUBJECT=About%20EVWordPressAPI)


# Intro

EVWordPressAPI maps WordPress (Jetpack) API calls to method calls where the result is returnd as easy to use Objects

For more information see the [WordPress API documentation](https://developer.wordpress.com/docs/api/)

The test calls that require authentication will be executed from the demo app. You have to configure the Oauth2Settings. See the ViewController.swift for more information. The calls that do not require authentication are tested from the unittests in EVWordPressAPITests.swift

# Dependencies
The EVWordPressAPI is using the folowing (cocoapods) libraries:

- The network functionality is handled using the [Alamofire](https://github.com/Alamofire/Alamofire) library.
- The API calls that require authentication will use the [AlamofireOauth2](https://github.com/evermeer/AlamofireOauth2) library
- The [AlamofireOauth2](https://github.com/evermeer/AlamofireOauth2) library is using the [KeychainAccess](https://github.com/kishikawakatsumi/KeychainAccess) library
- Result object mapping is done using the [AlamofireJsonToObjects](https://github.com/evermeer/AlamofireJsonToObjects) library
- The [AlamofireJsonToObjects](https://github.com/evermeer/AlamofireJsonToObjects) library is using the [EVReflection](https://github.com/evermeer/EVReflection) library

# Progress
This project started as a trial for [AlamofireJsonToObjects](https://github.com/evermeer/AlamofireJsonToObjects). There are more than 100 wordpress API callse. It will take some time to map all of these (help is welcome :) ). So far only the folowing API calles are implemented:

API sections - status (for now only the get calls)
- Users - all 4 get calls implemented
- Sites - all 11 get calls implemented
- Posts - all 6 get calls implemented
- Comments - all 5 get calls implemented
- Taxonomy - all 4 get calls implemented
- Follow - all 2 get calls implemented
- Freshly Pressed - the 1 get call implemented
- Notifications - only has posts
- Insights - the 2 get calls implemented
- Reader - the 10 get calls implemented
- Stats - 10 done, 9 to do
- Media - to do
- Menus - to do
- Batch - to do
- Videos - to do



## Using EVWordPressAPI in your own App 

'EVWordPressAPI' is now available through the dependency manager [CocoaPods](http://cocoapods.org). 
You do have to use cocoapods version 0.36. At this moment this can be installed by executing:

```
[sudo] gem install cocoapods
```

If you have installed cocoapods version 0.36 or later, then you can just add EVCloudKitDao to your workspace by adding the folowing 2 lines to your Podfile:

```
use_frameworks!
pod "EVWordPressAPI", :git => 'https://github.com/evermeer/EVWordPressAPI.git'
```

Version 0.36 of cocoapods will make a dynamic framework of all the pods that you use. Because of that it's only supported in iOS 8.0 or later. When using a framework, you also have to add an import at the top of your swift file like this:

```
import EVWordPressAPI
```

## Building the EVWordPressAPITests

1) Clone the repo to a working directory

2) [CocoaPods](http://cocoapods.org) is used to manage dependencies. Pods are setup easily and are distributed via a ruby gem. Follow the simple instructions on the website to setup. After setup, run the following command from the toplevel directory of EVWordPressAPI to download the dependencies:

```sh
pod install
```

3) Open the `EVWordPressAPI.xcworkspace` in Xcode.

4) Create your own clientID and clientSecret at https://developer.wordpress.com/docs/oauth2/ 

5) set the clientID and clientSecret in the wordpressOauth2Settings object in the ViewController.swift

and you are ready to go!

## How to use the EVWordPressAPI
Below is the sample code for a simple call:

```
let api = EVWordPressAPI(baseUrl: "https://public-api.wordpress.com/rest/v1.1", site: "evict.nl")
api.posts([.number(19)]) { posts in
    // now use the posts object
}
```

There is also support for API calls that require authentication (OAuth2). Here is a sample code for that: 
```
let wordpressOauth2Settings = Oauth2Settings(
    baseURL: "https://public-api.wordpress.com/rest/v1.1",
    authorizeURL: "https://public-api.wordpress.com/oauth2/authorize",
    tokenURL: "https://public-api.wordpress.com/oauth2/token",
    redirectURL: "alamofireoauth2://wordpress/oauth_callback",
    clientID: "????????????",
    clientSecret: "????????????"
)

let api = EVWordPressAPI(wordpressOauth2Settings: self.wordpressOauth2Settings, site: "evict.nl")
api.users(self, parameters:[.number(19), .authors_only(false)]) { users in
    // now use the users object
}
```

All calls have a parameters array that can contain a list of an enum where the value will be passed on as the associated value. You only have to specify the parameters with none default values.

All result objects have an error and a message property. These will have a value if something went wrong. These could contain the error information from the service ([See the documentation](https://developer.wordpress.com/docs/api/) for each call). Besides that it could also contain "OAuth2 error" or  "Network error .." plus the message details.

When authentication is required, then the method call will hava a parameter that should be populated with the active ViewController. The authentication webview will be created as a child of that viewcontroller.


## License

EVWordPressAPI is available under the MIT 3 license. See the LICENSE file for more info.

## My other libraries:
Also see my other open source iOS libraries:

- [EVReflection](https://github.com/evermeer/EVReflection) - Reflection based (Dictionary, CKRecord, JSON and XML) object mapping with extensions for Alamofire and Moya with RxSwift or ReactiveSwift 
- [EVCloudKitDao](https://github.com/evermeer/EVCloudKitDao) - Simplified access to Apple's CloudKit
- [EVFaceTracker](https://github.com/evermeer/EVFaceTracker) - Calculate the distance and angle of your device with regards to your face in order to simulate a 3D effect
- [EVURLCache](https://github.com/evermeer/EVURLCache) - a NSURLCache subclass for handling all web requests that use NSURLReques
- [AlamofireOauth2](https://github.com/evermeer/AlamofireOauth2) - A swift implementation of OAuth2 using Alamofire
- [EVWordPressAPI](https://github.com/evermeer/EVWordPressAPI) - Swift Implementation of the WordPress (Jetpack) API using AlamofireOauth2, AlomofireJsonToObjects and EVReflection (work in progress)
- [PassportScanner](https://github.com/evermeer/PassportScanner) - Scan the MRZ code of a passport and extract the firstname, lastname, passport number, nationality, date of birth, expiration date and personal numer.
- [AttributedTextView](https://github.com/evermeer/AttributedTextView) - Easiest way to create an attributed UITextView with support for multiple links (url, hashtags, mentions).


