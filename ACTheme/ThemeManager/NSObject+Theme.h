//
//  NSObject+Theme.h
//  PodDe
//
//  Created by lizhanpeng on 17/9/19.
//  Copyright © 2017年 anchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThemeManager.h"

typedef NS_ENUM(NSInteger,_ACThemeC_E){
    _ACTheme_ComViewBacColor      =   0,
    _ACTheme_HomeImage,
};

@interface NSObject (Theme)

-(void)T_SetThemeEM:(_ACThemeC_E)EM;
-(id)T_GetThemeEM:(_ACThemeC_E)EM;


@end
