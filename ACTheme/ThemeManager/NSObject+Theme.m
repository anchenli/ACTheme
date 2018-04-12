//
//  NSObject+Theme.m
//  PodDe
//
//  Created by lizhanpeng on 17/9/19.
//  Copyright © 2017年 anchen. All rights reserved.
//

#import "NSObject+Theme.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

const NSString *ThemeEM_AID   =    @"ThemeEM_AID";
const NSString *ObjSave       =    @"ObjSave";

@implementation NSObject (Theme)

-(void)T_SetThemeEM:(_ACThemeC_E)EM{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTheme) name:C_THEME_Notifiction object:nil];

    [self setThemeEM_V:EM];
    [self changeTheme];
}

- (void)changeTheme{
    
    _ACThemeC_E EM = [self getThemEM];
    switch (EM) {
        case _ACTheme_ComViewBacColor:
            [self AC_ComViewBacColor];
            break;
        case _ACTheme_HomeImage:
            [self AC_HomeImage];
            break;
        default:
            break;
    }
}
- (void)AC_ComViewBacColor{
    NSDictionary *thDic = [self getThemeDic:_cmd];
    if ([self isKindOfClass:[UIView class]]) {
        UIView *v = (UIView *)self;
        NSString *color = thDic[@"color"];
        v.backgroundColor = [self colorFromHexRGB:color];
    }
}
- (void)AC_HomeImage{
    NSDictionary *thDic = [self getThemeDic:_cmd];
    if ([self isKindOfClass:[UIImageView class]]) {
        UIImageView *im = (UIImageView *)self;
        NSString *imgN = thDic[@"img"];
        im.image = [UIImage imageNamed:imgN];
    }
}

/*
-(id)T_GetThemeEM:(_ACThemeC_E)EM{
    
    switch (EM) {
        case _ACTheme_ComViewBacColor:
        {
            SEL sel = @selector(C_Theme_MyPageSectionImage);
            NSDictionary *thDic = [self getThemeDic:sel];
            return thDic;
        }
            
            break;
        case _ACTheme_HomeImage:
        {
            SEL sel = @selector(C_AllImage);
            NSDictionary *thDic = [self getThemeDic:sel];
            return thDic;
        }
            
            break;
            
        default:
            break;
    }
    return nil;
}
*/

- (NSDictionary *)getThemeDic:(SEL)sel{

    return [ThemeManager shareInstance].themeDic[NSStringFromSelector(sel)];
}

- (void)setThemeEM_V:(_ACThemeC_E)EM {
    objc_setAssociatedObject(self, &ThemeEM_AID,[NSString stringWithFormat:@"%ld",EM], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (_ACThemeC_E)getThemEM{
   return [objc_getAssociatedObject(self, &ThemeEM_AID) integerValue];
}

- (void)removeObserver{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (UIColor *)colorFromHexRGB:(NSString *)inColorString
{
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode];
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode);
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:1.0];
    return result;
}

@end
