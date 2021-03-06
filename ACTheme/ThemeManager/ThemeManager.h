//
//  ThemeManager.h
//  PodDe
//
//  Created by lizhanpeng on 17/9/19.
//  Copyright © 2017年 anchen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,ThemeM) {
    _T_Black,
    _T_White,
};

#define THEME_DB    @"THEME_DB"
#define C_THEME_Notifiction    @"C_THEME_Notifiction"

@interface ThemeManager : NSObject
{
    NSDictionary *_themeDic;
    ThemeM _themeM;
}


- (NSDictionary *)themeDic;
+ (instancetype)shareInstance;

- (ThemeM)themeM;
- (void)setthemeM:(ThemeM)themeM;

@end
