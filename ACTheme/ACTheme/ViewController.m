//
//  ViewController.m
//  ACTheme
//
//  Created by lizhanpeng on 2018/4/12.
//  Copyright © 2018年 anchen. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Theme.h"
#import "ThemeManager.h"

@interface ViewController ()
{
    UIView *topView;
    UIImageView *topImageView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    topView = [UIView new];
    [self.view addSubview:topView];
    topView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 120);
    [topView T_SetThemeEM:_ACTheme_ComViewBacColor];
    
    topImageView = [UIImageView new];
    [self.view addSubview:topImageView];
    topImageView.frame = CGRectMake(0, 120, CGRectGetWidth(self.view.frame), 60);
    topImageView.contentMode = UIViewContentModeScaleAspectFit;
    [topImageView T_SetThemeEM:_ACTheme_HomeImage];
    
    
    UIButton *cThemeButton = [UIButton buttonWithType:0];
    cThemeButton.backgroundColor = [UIColor redColor];
    cThemeButton.frame = CGRectMake(0, CGRectGetMaxY(self.view.frame)-44, CGRectGetWidth(self.view.frame), 44);
    [self.view addSubview:cThemeButton];
    [cThemeButton setTitle:@"切换主题" forState:0];
    [cThemeButton setTitleColor:[UIColor whiteColor] forState:0];
    [cThemeButton addTarget:self action:@selector(changeThemeAction:) forControlEvents:UIControlEventTouchUpInside];
}
static int _THEME_MARK = 1;
- (void)changeThemeAction:(UIButton *)sender{
    
    if (_THEME_MARK % 2 == 0) {
        [[ThemeManager shareInstance] setthemeM:_T_Black];
    }else{
        [[ThemeManager shareInstance] setthemeM:_T_White];
    }
    
    _THEME_MARK++;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
