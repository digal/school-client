//
//  ISSearchResults.h
//  client
//
//  Created by Yuriy Buyanov on 09/04/14.
//  Copyright (c) 2014 Yuriy Buyanov. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface ISSearchResults : MTLModel<MTLJSONSerializing>

@property (nonatomic, assign) NSUInteger resultCount;
@property (nonatomic, strong) NSArray* results;

@end
