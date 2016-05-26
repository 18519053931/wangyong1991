//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "DuWenViewController.h"
#import "LeftViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //    检测网络状态变化
    [self initializeWithApplication:application];
    /** 配置全局UI的样式 */
    [self configGlobalUIStyle];
    /** 配置侧滑控制器为根视图控制器 */
    self.window.rootViewController = self.sideMeun;
    return YES;
}

-(UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}

/** 配置全局UI的样式 */
-(void)configGlobalUIStyle{
    /** 导航栏不透明 */
    [[UINavigationBar appearance] setTranslucent:NO];
    // iOS5及其以后提供了一个比较强大的工具UIAppearance，我们通过UIAppearance设置一些UI的全局效果，这样就可以很方便的实现UI的自定义效果又能最简单的实现统一界面风格。
    // + (id)appearance  这个方法是统一全部改
    [[UINavigationBar appearance] setBackgroundColor:[UIColor greenSeaColor]];
    //greenSeaColor 扁平化界面风格框架提供的UIColor分类
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldFlatFontOfSize:24.0], NSForegroundColorAttributeName: [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]}];
}

/** 配置侧滑控制器 */
//MMDrawerController 配置普通的侧滑界面
-(RESideMenu *)sideMeun{
    if (!_sideMeun) {
        _sideMeun = [[RESideMenu alloc]initWithContentViewController:[DuWenViewController standatdNavi] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        _sideMeun.backgroundImage = [UIImage imageNamed:@"backgroud"];
//        _sideMeun.menuPrefersStatusBarHidden = YES;
    }
    //设置不能水平滑动
    _sideMeun.bouncesHorizontally = NO;
    return _sideMeun;
}

@end
