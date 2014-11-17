#import "AFHTTPSessionManager+AFUniqueGET.h"

@implementation AFHTTPSessionManager (AFUniqueGET)

- (void)uniqueGET:(NSString *)URLString
       parameters:(id)parameters
             task:(void (^)(NSURLSessionDataTask *task))task
          success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
          failure:(void (^)(NSURLSessionDataTask *task, BOOL canceled, NSError *error))failure
{
    NSString *path = [[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString];
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"GET"
                                                                   URLString:path
                                                                  parameters:parameters
                                                                       error:nil];

    [self request:request exists:^(NSURLSessionDataTask *foundTask) {
        if (foundTask) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (task) task(foundTask);
            });
        } else {
            __block NSURLSessionDataTask *dataTask = [self dataTaskWithRequest:request
                                                             completionHandler:^(NSURLResponse * __unused response, id responseObject, NSError *error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (error) {
                        NSHTTPURLResponse *response = (NSHTTPURLResponse *)dataTask.response;
                        BOOL canceled = (response.statusCode == 0);
                        if (failure) failure(dataTask, canceled, error);
                    } else {
                        if (success) success(dataTask, responseObject);
                    }
                });
            }];

            [dataTask resume];

            dispatch_async(dispatch_get_main_queue(), ^{
                if (task) task(dataTask);
            });
        }
    }];
}

- (void)request:(NSMutableURLRequest *)request
         exists:(void (^)(NSURLSessionDataTask *foundTask))exists
{
    __block NSURLSessionDataTask *found;

    [self.session getTasksWithCompletionHandler:^(NSArray * __unused dataTasks, NSArray * __unused uploadTasks, NSArray *downloadTasks) {
        for (NSURLSessionDataTask *existingTask in downloadTasks) {
            if ([[existingTask.originalRequest.URL absoluteString] isEqualToString:[request.URL absoluteString]]) {
                found = existingTask;
                break;
            }
        }

        if (exists) exists(found);
    }];
}

@end
