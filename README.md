# AFHTTPSessionManager-AFUniqueGET

This category of AFHTTPSessionManager adds the `uniqueGET` method, which is useful if you want to avoid getting multiple times at the same resource if the operation is still in progress.

## Usage

### Installation

**AFHTTPSessionManager-AFUniqueGET** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

`pod 'AFHTTPSessionManager-AFUniqueGET'`

### API

```objc
- (void)uniqueGET:(NSString *)URLString
       parameters:(id)parameters
             task:(void (^)(NSURLSessionDataTask *task))task
          success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
          failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
```

## Author

Elvis Nuñez, hello@nselvis.com

## License

**AFHTTPSessionManager-AFUniqueGET** is available under the MIT license. See the LICENSE file for more info.
