//
//  ColorHelper
//
//  initiallly written for iOS 7. use at your own risk in previous versions.
//
//  useful for selecting colors by their names from a plist titled "colorPalette"
//  handles conversion from 0 - 255 integer range (typical for colors from image editing programs or other sources) to 0.0 - 1.0 floating point range, as UIColor prefers by default.
//  also includes a method to handle linear blending between two colors at a certain mix percentage
//
//  Created by Taylor Smith on 12/16/13.
//  first used in Better Than Yesterday, available now.
//  Copyright (c) 2013 Taylor Smith. All rights reserved.
//

#import "ColorHelper.h"

@implementation ColorHelper

// request a color by name from the plist, return UIColor ready for use where needed
+ (UIColor *)colorFromPListName:(NSString *)pListName {
    NSArray *colorArray = [self colorArrayFromPListName:pListName];
    return [self colorFloatsFromIntArray:colorArray];
}

// return an NSArray from the colorPalette plist for the desired object
+ (NSArray *)colorArrayFromPListName:(NSString *)pListName {
    NSString *colorListPath = [[NSBundle mainBundle] pathForResource:@"colorPalette" ofType:@"plist"];
    NSDictionary *colorListDict = [[NSDictionary alloc] initWithContentsOfFile:colorListPath];
    
    return [colorListDict objectForKey:pListName];
}

// return a UIColor after converting from 0 - 255 range to 0.0 - 1.0 range
+ (UIColor *)colorFloatsFromIntArray:(NSArray *)colorArray {
    float redFloat = [[colorArray objectAtIndex:0] floatValue] / 255;
    float greenFloat = [[colorArray objectAtIndex:1] floatValue] / 255;
    float blueFloat = [[colorArray objectAtIndex:2] floatValue] / 255;
    
    UIColor *returnColor = [[UIColor alloc] initWithRed:redFloat green:greenFloat blue:blueFloat alpha:1.0f];
    
    return returnColor;
}

// return a UIColor by blending the two colors requested at the desired percentage
+ (UIColor *)blendColors:(NSString *)minColorKey maxColor:(NSString *)maxColorKey withPercentage:(float)mix
{
    NSArray *minColor = [self colorArrayFromPListName:minColorKey];
    NSArray *maxColor = [self colorArrayFromPListName:maxColorKey];
    
    // (((Max - Min) * mix) + Min) / 255
    float redBlend = ((([[maxColor objectAtIndex:0] floatValue] - [[minColor objectAtIndex:0] floatValue]) * mix) + [[minColor objectAtIndex:0] floatValue])/255;
    float greenBlend = ((([[maxColor objectAtIndex:1] floatValue] - [[minColor objectAtIndex:1] floatValue]) * mix) + [[minColor objectAtIndex:1] floatValue])/255;
    float blueBlend = ((([[maxColor objectAtIndex:2] floatValue] - [[minColor objectAtIndex:2] floatValue]) * mix) + [[minColor objectAtIndex:2] floatValue])/255;
    
    return [[UIColor alloc] initWithRed:redBlend green:greenBlend blue:blueBlend alpha:1.0f];
}

@end
