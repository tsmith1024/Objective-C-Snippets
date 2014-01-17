//
//  UIColor+TSStringColor.h
//  BetterThanYesterday
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
