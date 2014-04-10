//
//  ISItem.h
//  client
//
//  Created by Yuriy Buyanov on 09/04/14.
//  Copyright (c) 2014 Yuriy Buyanov. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface ISItem : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString* trackName;
@property (nonatomic, assign) NSUInteger trackId;
@property (nonatomic, strong) NSURL*artworkUrl60;

@end
