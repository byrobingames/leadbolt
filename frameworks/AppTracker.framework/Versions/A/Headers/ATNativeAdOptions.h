//
//  ATNativeAdOptions.h
//
//  Created by Leadbolt
//  Copyright © 2018 LeadBolt. All rights reserved.
//

@interface ATNativeAdOptions : NSObject

@property float width;
@property float height;
@property NSString *placement;
@property ATNativeAdOptionMediaType mediaType;
@property NSString *sid;
@property BOOL cacheAssets;

-(NSString *) toString;

@end
