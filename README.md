![AFHTTPSessionManager-AFUniqueGET](https://raw.githubusercontent.com/NSElvis/AFHTTPSessionManager-AFUniqueGET/master/Images/AFUniqueGET-logo.png)

[![CI Status](http://img.shields.io/travis/NSElvis/AFHTTPSessionManager-AFUniqueGET.svg?style=flat)](https://travis-ci.org/NSElvis/AFHTTPSessionManager-AFUniqueGET)
[![Version](https://img.shields.io/cocoapods/v/AFHTTPSessionManager-AFUniqueGET.svg?style=flat)](http://cocoadocs.org/docsets/AFHTTPSessionManager-AFUniqueGET)
[![License](https://img.shields.io/cocoapods/l/AFHTTPSessionManager-AFUniqueGET.svg?style=flat)](http://cocoadocs.org/docsets/AFHTTPSessionManager-AFUniqueGET)
[![Platform](https://img.shields.io/cocoapods/p/AFHTTPSessionManager-AFUniqueGET.svg?style=flat)](http://cocoadocs.org/docsets/AFHTTPSessionManager-AFUniqueGET)

This category adds the `uniqueGET` method to **AFHTTPSessionManager**, which is useful if you want to avoid making multiple calls at the same resource if the operation is still in progress.

A common request between AFNetworking users (for example [#499](https://github.com/AFNetworking/AFNetworking/issues/499), [#1460](https://github.com/AFNetworking/AFNetworking/issues/1460)).

We achieve this by checking on-going operations before creating new ones.

## Usage

### Installation

**AFHTTPSessionManager-AFUniqueGET** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

`pod 'AFHTTPSessionManager-AFUniqueGET'`

### API

```objc
- (void)uniqueGET:(NSString *)URLString
       parameters:(id)parameters
             task:(void (^)(NSURLSessionDataTask *task, BOOL existing))task
          success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
          failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
```

## Author

Elvis Nuñez, hello@nselvis.com

## License

**AFHTTPSessionManager-AFUniqueGET** is available under the MIT license. See the LICENSE file for more info.
