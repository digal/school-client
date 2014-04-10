//
//  ISSessionManager.m
//  client
//
//  Created by Yuriy Buyanov on 09/04/14.
//  Copyright (c) 2014 Yuriy Buyanov. All rights reserved.
//

#import "ISSessionManager.h"
#import <Mantle/Mantle.h>
#import "ISItem.h"
#import "ISSearchResults.h"


@implementation ISSessionManager

+ (instancetype)sharedManager {
    static ISSessionManager* _sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:@"https://itunes.apple.com/"]];
        
        _sharedInstance.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:0];
    });
    return _sharedInstance;
}

- (NSURLSessionDataTask *) searchWithParams: (NSDictionary*)params                       success:(void (^)(NSURLSessionDataTask *task, ISSearchResults *results))success
                                    failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    return [self GET:@"search" parameters:params success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        NSError* error = nil;
        ISSearchResults* results = [MTLJSONAdapter modelOfClass:[ISSearchResults class] fromJSONDictionary:responseObject error:&error];
        if (error) {
            failure(task, error);
        } else {
            success(task, results);
        }
    } failure:failure];
    
}

@end
