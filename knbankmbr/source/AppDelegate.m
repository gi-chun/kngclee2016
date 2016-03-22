//
//  AppDelegate.m
//  knbankmbr
//
//  Created by gclee on 2016. 2. 26..
//  Copyright © 2016년 knbank. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "UIImage+ImageWithColor.h"

@interface AppDelegate ()
{
    UIView *shadow;
    UIButton *btnCompose;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //gclee
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    ViewController *mainViewCnr = [[ViewController alloc] init];
    
    //    _navigation = [[UINavigationController alloc] initWithRootViewController:mainViewCnr];
    //    [_navigation setNavigationBarHidden:YES];
    //
    //    self.window.rootViewController = _navigation;
    //    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = mainViewCnr;
    
    
    //create application main window - subview - global view
    
//    UIView* roundedView = [[UIView alloc] initWithFrame: CGRectMake(kScreenBoundsWidth-50, kScreenBoundsHeight-50, 50, 50)];
//    roundedView.layer.cornerRadius = 5.0;
//    roundedView.layer.masksToBounds = YES;
//    
//    UIView* shadowView = [[UIView alloc] initWithFrame: CGRectMake(kScreenBoundsWidth-50, kScreenBoundsHeight-50, 50, 50)];
//    shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
//    shadowView.layer.shadowRadius = 5.0;
//    shadowView.layer.shadowOffset = CGSizeMake(3.0, 3.0);
//    shadowView.layer.shadowOpacity = 1.0;
//    [shadowView addSubview: roundedView];
//    
//    //[[[UIApplication sharedApplication] keyWindow] addSubview:shadowView];
//    [self.window addSubview:shadowView];
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    shadow = [[UIView alloc]init];
    shadow.layer.cornerRadius = 5.0;
    shadow.layer.shadowColor = [[UIColor redColor] CGColor];
    shadow.layer.shadowOpacity = 1.0;
    shadow.layer.shadowRadius = 10.0;
    shadow.layer.shadowOffset = CGSizeMake(0.0f, -0.5f);
    
    btnCompose = [[UIButton alloc]initWithFrame:CGRectMake(kScreenBoundsWidth-80, kScreenBoundsHeight-80, 80, 80)];
    [btnCompose setUserInteractionEnabled:YES];
    btnCompose.layer.cornerRadius = 30;
    btnCompose.layer.masksToBounds = YES;
    [btnCompose setImage:[UIImage imageNamed:@"location_icon"] forState:UIControlStateNormal];
    [btnCompose setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0x000000)] forState:UIControlStateHighlighted];
    
    [btnCompose addTarget:self action:@selector(btnCompose_click:) forControlEvents:UIControlEventTouchUpInside];
    [shadow addSubview:btnCompose];
    [self.window addSubview:shadow];
    
    UIButton *btnEmpty = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnEmpty setFrame:CGRectMake(kScreenBoundsWidth-80, kScreenBoundsHeight-80, 80, 80)];
    [btnEmpty setBackgroundColor:[UIColor clearColor]];
    [btnEmpty addTarget:self action:@selector(btnCompose_click:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:btnEmpty];
    
    //[shadow setHidden:true];
    
//    UIButton *bannerImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [bannerImageButton setFrame:bannerImageView.frame];
//    [bannerImageButton setBackgroundColor:[UIColor clearColor]];
//    [bannerImageButton setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0x000000)] forState:UIControlStateHighlighted];
//    [bannerImageButton addTarget:self action:@selector(touchBannerButton) forControlEvents:UIControlEventTouchUpInside];
//    [bannerImageButton setAlpha:0.3];
//    [containerView addSubview:bannerImageButton];
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////

    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Selectors

- (void)btnCompose_click:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"알림"
                                                    message:@"설정 > 개인 정보 보호 > 연락처 정보를 활성화 해주세요."
                                                   delegate:self
                                          cancelButtonTitle:NSLocalizedString(@"Confirm", nil)
                                          otherButtonTitles:nil];
    [alert setDelegate:self];
    [alert show];
    
    NSLog(@"친구 등록 실패: 권한이 없음");

}


@end
