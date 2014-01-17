//
//  UIColor+TSStringColor.m
//  BetterThanYesterday
//
//  Created by Taylor Smith on 12/22/13.
//  Copyright (c) 2013 Taylor Smith. All rights reserved.
//

#import "UIColor+TSStringColor.h"

@implementation UIColor (TSStringColor)

+ (UIColor *)colorFromPList:(NSString *)pListName withColor:(NSString *)colorName {
    NSArray *colorArray = [self colorArrayFromPList:pListName withColor:colorName];
    return [self colorFloatsFromIntArray:colorArray];
}

+ (NSArray *)colorArrayFromPList:(NSString *)pListName withColor:(NSString *)colorName {
    NSString *colorListPath = [[NSBundle mainBundle] pathForResource:pListName ofType:@"plist"];
    NSDictionary *colorListDict = [[NSDictionary alloc] initWithContentsOfFile:colorListPath];
    
    return [colorListDict objectForKey:colorName];
}

+ (UIColor *)colorFloatsFromIntArray:(NSArray *)colorArray {
    float redFloat = [[colorArray objectAtIndex:0] floatValue] / 255;
    float greenFloat = [[colorArray objectAtIndex:1] floatValue] / 255;
    float blueFloat = [[colorArray objectAtIndex:2] floatValue] / 255;
    
    UIColor *returnColor = [[UIColor alloc] initWithRed:redFloat green:greenFloat blue:blueFloat alpha:1.0f];
    
    return returnColor;
}

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
