//
//  EduHTTPClient.h
//  edu
//
//  Created by lubing on 13-4-7.
//  Copyright (c) 2013年 lubing. All rights reserved.
//

typedef void (^successBlock)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON);
typedef void (^failureBlock)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON);

#import "AFHTTPClient.h"

@interface EduHTTPClient : AFHTTPClient

+ (EduHTTPClient *)sharedClient;

- (void)performRequestWithPath:(NSString *)path formDataDic:(NSDictionary *)formDataDic withSuccessBlock:(successBlock )sucBlock failureBlock:(failureBlock )failBlock;

@end
