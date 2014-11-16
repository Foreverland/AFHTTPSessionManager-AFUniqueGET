//
//  AFHTTPSessionManager+AFUniqueGET.h
//  AFNetworking iOS Example
//
//  Created by Elvis Nuñez on 11/16/14.
//  Copyright (c) 2014 Gowalla. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface AFHTTPSessionManager (AFUniqueGET)

- (void)uniqueGET:(NSString *)URLString
       parameters:(id)parameters
             task:(void (^)(NSURLSessionDataTask *task))task
          success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
          failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
