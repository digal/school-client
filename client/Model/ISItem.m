//
//  ISItem.m
//  client
//
//  Created by Yuriy Buyanov on 09/04/14.
//  Copyright (c) 2014 Yuriy Buyanov. All rights reserved.
//

#import "ISItem.h"

@implementation ISItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

+ (NSValueTransformer*)artworkUrl60JSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
