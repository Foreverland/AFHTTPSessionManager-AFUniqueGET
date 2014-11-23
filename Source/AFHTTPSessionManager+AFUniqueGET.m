#import "AFHTTPSessionManager+AFUniqueGET.h"

@implementation AFHTTPSessionManager (AFUniqueGET)

- (void)uniqueGET:(NSString *)URLString
       parameters:(id)parameters
             task:(void (^)(NSURLSessionDataTask *task))task
          success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
          failure:(void (^)(NSURLSessionDataTask *task, BOOL canceled, NSError *error))failure
{
    NSString *path = [[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString];

    NSError *error = nil;
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"GET"
                                                                   URLString:path
                                                                  parameters:parameters
                                                                       error:&error];
    if (error) NSLog(@"AFHTTPSessionManager+AFUniqueGET: Error creating request %@", error);

    [self request:request exists:^(NSURLSessionDataTask *existingTask) {
        if (existingTask) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (task) task(existingTask);
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
         exists:(void (^)(NSURLSessionDataTask *existingTask))exists
{
    __block NSURLSessionDataTask *existingTask;

    [self.session getTasksWithCompletionHandler:^(NSArray *dataTasks, NSArray * __unused uploadTasks, NSArray * __unused downloadTasks) {

        for (NSURLSessionDataTask *dataTask in dataTasks) {
            if ([[dataTask.originalRequest.URL absoluteString] isEqualToString:[request.URL absoluteString]]) {
                existingTask = dataTask;
                break;
            }
        }

        if (exists) exists(existingTask);
    }];
}

@end
