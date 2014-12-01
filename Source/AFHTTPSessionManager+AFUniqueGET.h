#import "AFHTTPSessionManager.h"

@interface AFHTTPSessionManager (AFUniqueGET)

- (void)uniqueGET:(NSString *)URLString
       parameters:(id)parameters
             task:(void (^)(NSURLSessionDataTask *task, BOOL existing))task
          success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
          failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
