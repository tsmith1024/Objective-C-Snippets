//
//  UIColor+TSStringColor.m
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

#import "UIColor+TSStringColor.h"

@implementation UIColor (TSStringColor)

// base method — returns a UIColor from a plist array that contains 0 - 255 values for RGB
+ (UIColor *)colorFromPList:(NSString *)pListName withColor:(NSString *)colorName {
    NSArray *colorArray = [self colorArrayFromPList:pListName withColor:colorName];
    return [self colorFloatsFromIntArray:colorArray];
}

// gets the color array from the specified plist
+ (NSArray *)colorArrayFromPList:(NSString *)pListName withColor:(NSString *)colorName {
    NSString *colorListPath = [[NSBundle mainBundle] pathForResource:pListName ofType:@"plist"];
    NSDictionary *colorListDict = [[NSDictionary alloc] initWithContentsOfFile:colorListPath];
    
    return [colorListDict objectForKey:colorName];
}

// converts a color array (R, G, and B values) from 0 - 255 to 0 - 1.0 range
+ (UIColor *)colorFloatsFromIntArray:(NSArray *)colorArray {
    float redFloat = [[colorArray objectAtIndex:0] floatValue] / 255;
    float greenFloat = [[colorArray objectAtIndex:1] floatValue] / 255;
    float blueFloat = [[colorArray objectAtIndex:2] floatValue] / 255;
    
    UIColor *returnColor = [[UIColor alloc] initWithRed:redFloat green:greenFloat blue:blueFloat alpha:1.0f];
    
    return returnColor;
}

// blends between two colors in a specified plist based on a mix percentage
+ (UIColor *)blendColorsFromPList:(NSString *)pListName minColor:(NSString *)minColorKey maxColor:(NSString *)maxColorKey withPercentage:(float)mix
{
    NSArray *minColor = [self colorArrayFromPList:pListName withColor:minColorKey];
    NSArray *maxColor = [self colorArrayFromPList:pListName withColor:maxColorKey];
    
    // (((Max - Min) * mix) + Min) / 255
    float redBlend = ((([[maxColor objectAtIndex:0] floatValue] - [[minColor objectAtIndex:0] floatValue]) * mix) + [[minColor objectAtIndex:0] floatValue])/255;
    float greenBlend = ((([[maxColor objectAtIndex:1] floatValue] - [[minColor objectAtIndex:1] floatValue]) * mix) + [[minColor objectAtIndex:1] floatValue])/255;
    float blueBlend = ((([[maxColor objectAtIndex:2] floatValue] - [[minColor objectAtIndex:2] floatValue]) * mix) + [[minColor objectAtIndex:2] floatValue])/255;
    
    return [[UIColor alloc] initWithRed:redBlend green:greenBlend blue:blueBlend alpha:1.0f];
}

@end
