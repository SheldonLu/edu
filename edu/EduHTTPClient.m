//
//  EduHTTPClient.m
//  edu
//
//  Created by lubing on 13-4-7.
//  Copyright (c) 2013年 lubing. All rights reserved.
//

#import "EduHTTPClient.h"
#import "SVProgressHUD.h"

@implementation EduHTTPClient
+ (EduHTTPClient *)sharedClient {
    static EduHTTPClient *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:EduBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
 
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}


- (void)performRequestWithPath:(NSString *)path formDataDic:(NSDictionary *)formDataDic withSuccessBlock:(successBlock )sucBlock failureBlock:(failureBlock )failBlock
{
    NSDictionary *formDataDicMutableCopy = [formDataDic mutableCopy];
    [formDataDicMutableCopy setValue:@"1" forKey:@"deviceType"];
    NSMutableURLRequest *request = [[EduHTTPClient sharedClient] requestWithMethod:@"POST" path:path parameters:formDataDicMutableCopy];
    NSLog(@"%@",request);
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:sucBlock failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        NSLog(@"%@",error);
        [SVProgressHUD dismissWithError:@"当前无网络或者服务器不可用"];
    }];
//    [operation acceptableContentTypes [NSSet setWithObjects:@"application/json", @"text/json", @"text/plain", nil]];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
}


@end
