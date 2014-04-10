//
//  ISSearchResults.m
//  client
//
//  Created by Yuriy Buyanov on 09/04/14.
//  Copyright (c) 2014 Yuriy Buyanov. All rights reserved.
//

#import "ISSearchResults.h"
#import "ISItem.h"

@implementation ISSearchResults

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

+ (NSValueTransformer*) resultsJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[ISItem class]];
}

@end
