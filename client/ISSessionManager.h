//
//  ISSessionManager.h
//  client
//
//  Created by Yuriy Buyanov on 09/04/14.
//  Copyright (c) 2014 Yuriy Buyanov. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@class ISSearchResults;

@interface ISSessionManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

- (NSURLSessionDataTask *) searchWithParams: (NSDictionary*)params                       success:(void (^)(NSURLSessionDataTask *task, ISSearchResults *results))success
                                    failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;


@end
