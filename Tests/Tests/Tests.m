@import XCTest;

#import "OHHTTPStubs.h"
#import "OHHTTPStubsResponse+JSON.h"
#import "AFHTTPSessionManager.h"
#import "AFHTTPSessionManager+AFUniqueGET.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];

    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return YES;
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithJSONObject:@{@"name" : @"Hello World"}
                                                 statusCode:200
                                                    headers:@{@"Content-Type":@"text/json"}]
                responseTime:15.0f];
    }];
}

- (void)tearDown
{
    [OHHTTPStubs removeAllStubs];

    [super tearDown];
}

- (void)testUniqueGET
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Networking expectations"];

    NSURL *url = [NSURL URLWithString:@"http://sample.com"];
    NSString *path = @"/sample.json";

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];

    __block NSURLSessionDataTask *currentTask;

    [manager uniqueGET:path parameters:nil task:^(NSURLSessionDataTask *task, BOOL existing) {

        currentTask = task;

        XCTAssertFalse(existing);

        [manager uniqueGET:path parameters:nil
                      task:^(NSURLSessionDataTask *task, BOOL existing) {

                          XCTAssertTrue(existing);

                          XCTAssertEqualObjects(task, currentTask);

                          [expectation fulfill];

                      } success:nil failure:nil];

    } success:nil failure:nil];

    [self waitForExpectationsWithTimeout:5.0f handler:nil];
}

@end
