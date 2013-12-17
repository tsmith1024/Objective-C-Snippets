//
//  ColorHelper.h
//
//  see .m for details
//
//  Created by Taylor Smith on 12/16/13.
//  first used in Better Than Yesterday, available now.
//  Copyright (c) 2013 Taylor Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorHelper : NSObject

+ (UIColor *)colorFloatsFromIntArray:(NSArray *)colorArray;
+ (UIColor *)colorFromPListName:(NSString *)pListName;
+ (UIColor *)blendColors:(NSString *)minColorKey maxColor:(NSString *)maxColorKey withPercentage:(float)mix;

@end
