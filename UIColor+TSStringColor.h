//
//  UIColor+TSStringColor.h
//  First used in Better Than Yesterday
//  
//  Color conversion from 0 - 255 range to 0 - 1.0 float range
//  Selection and conversion of color from a specified plist file
//  Color blending between two colors in a specified plist file, including a percentage of blend
//
//
//  Created by Taylor Smith on 12/22/13.
//  Copyright (c) 2013 Taylor Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (TSStringColor)

+ (UIColor *)colorFloatsFromIntArray:(NSArray *)colorArray;

+ (UIColor *)colorFromPList:(NSString *)pListName withColor:(NSString *)colorName;
+ (UIColor *)blendColorsFromPList:(NSString *)pListName
                         minColor:(NSString *)minColorKey
                         maxColor:(NSString *)maxColorKey
                   withPercentage:(float)mix;

@end
