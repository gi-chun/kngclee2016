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
#import "VCFloatingActionButton.h"
#import "CKMenuView.h"

@interface AppDelegate ()<CKMenuViewDelegate>
{
    UIView *shadow;
    UIButton *btnCompose;
    VCFloatingActionButton *addButton;
    CKMenuView *menuView;
    NSInteger *isShowedMenuView;
    
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //gclee
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
    
    ViewController *mainViewCnr = [[ViewController alloc] init];
    
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:mainViewCnr];
    
    //    _navigation = [[UINavigationController alloc] initWithRootViewController:mainViewCnr];
    //    [_navigation setNavigationBarHidden:YES];
    //
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    //self.window.rootViewController = mainViewCnr;
    
    //set status bar
    [application setStatusBarHidden:NO];
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    //set status bar end
    
//    // set navigaton ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Uncomment to change the background color of navigation bar
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGBA(0x067AB5, 1.0)];
    // Uncomment to change the color of back button
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    // Uncomment to assign a custom backgroung image
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg_ios7.png"] forBarMetrics:UIBarMetricsDefault];
    // Uncomment to change the back indicator image
    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"back_btn.png"]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_btn.png"]];
    // Uncomment to change the font style of the title
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    
//    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
//                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
//                                                           shadow, NSShadowAttributeName,
//                                                           [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
    
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                           nil, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
    //
    
//    // set navigation end ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    CGRect floatFrame = CGRectMake([UIScreen mainScreen].bounds.size.width - 44 - 20, [UIScreen mainScreen].bounds.size.height - 44 - 20, 44, 44);
    addButton = [[VCFloatingActionButton alloc]initWithFrame:floatFrame normalImage:[UIImage imageNamed:@"plus"] andPressedImage:[UIImage imageNamed:@"cross"] withScrollview:nil];
    addButton.imageArray = @[@"fb-icon",@"twitter-icon",@"google-icon",@"linkedin-icon",@"google-icon",@"linkedin-icon"];
    addButton.labelArray = @[@"설정",@"고객센터",@"간편송금",@"인증센터", @"ATM출금", @"홈"];
    
    addButton.hideWhileScrolling = YES;
    addButton.delegate = self;
    
    //[self.view addSubview:addButton];
    [self.window addSubview:addButton];
    
    //[addButton setHidden:true];
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // nemu vew
//    menuView = [[CKMenuView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    menuView.delegate = self;
//    
//    [self.window addSubview:menuView];
//    [menuView setHidden:false];
//    isShowedMenuView = 0;
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showMenuView:)
                                                 name:showMenuViewNotification
                                               object:nil];
    
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
//    shadow = [[UIView alloc]init];
//    shadow.layer.cornerRadius = 5.0;
//    shadow.layer.shadowColor = [[UIColor redColor] CGColor];
//    shadow.layer.shadowOpacity = 1.0;
//    shadow.layer.shadowRadius = 10.0;
//    shadow.layer.shadowOffset = CGSizeMake(0.0f, -0.5f);
//    
//    btnCompose = [[UIButton alloc]initWithFrame:CGRectMake(kScreenBoundsWidth-80, kScreenBoundsHeight-80, 80, 80)];
//    [btnCompose setUserInteractionEnabled:YES];
//    btnCompose.layer.cornerRadius = 30;
//    btnCompose.layer.masksToBounds = YES;
//    [btnCompose setImage:[UIImage imageNamed:@"location_icon"] forState:UIControlStateNormal];
//    [btnCompose setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0x000000)] forState:UIControlStateHighlighted];
//    
//    [btnCompose addTarget:self action:@selector(btnCompose_click:) forControlEvents:UIControlEventTouchUpInside];
//    [shadow addSubview:btnCompose];
//    [self.window addSubview:shadow];
//    
//    UIButton *btnEmpty = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btnEmpty setFrame:CGRectMake(kScreenBoundsWidth-80, kScreenBoundsHeight-80, 80, 80)];
//    [btnEmpty setBackgroundColor:[UIColor clearColor]];
//    [btnEmpty addTarget:self action:@selector(btnCompose_click:) forControlEvents:UIControlEventTouchUpInside];
//    [self.window addSubview:btnEmpty];
    
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

#pragma mark - table
-(void) didSelectMenuOptionAtIndex:(NSInteger)row
{
    NSLog(@"Floating action tapped index %tu",row);
}

#pragma mark - public
-(void) showQuickButton:(NSInteger)isShow
{
    NSLog(@"show quick button %tu",isShow);
    if(isShow == 1){
        [addButton setHidden:true];
    }else{
        [addButton setHidden:false];
    }
}

-(void) showMenuView:(NSInteger)isShow
{
    NSLog(@"show Menu view %tu",isShow);
    
    if(isShowedMenuView){
        isShowedMenuView = 0;
        
//        CGRect initalFrame = CGRectMake(0, 0, 0, menuView.frame.size.height);
//        initalFrame.origin.x = -initalFrame.size.width;
//        menuView.frame = initalFrame;
//        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveFromLeftOrRight:) userInfo:@1 repeats:NO];
        
//        CGRect frame = menuView.frame ;
//        [UIView beginAnimations:nil context:nil];
//        [UIView setAnimationDuration:5.0];
//        [UIView setAnimationDelay:0];
//        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
//        menuView.frame = CGRectMake(frame.origin.x - 2*frame.size.width,menuView.frame.origin.y, menuView.frame.size.width, menuView.frame.size.height);
//        [UIView commitAnimations];
        
        [UIView animateWithDuration:0.4f
                         animations:^ {
                             CGRect frame = menuView.frame;
                             
// left to right
                             frame.origin.x = 0;
                             menuView.frame = frame;
                             menuView.frame = CGRectMake(frame.origin.x + 2*frame.size.width,frame.origin.y, frame.size.width, frame.size.height);
// right to left
//                             frame.origin.x = 0;
//                             menuView.frame = frame;
//                             menuView.frame = CGRectMake(frame.origin.x - 2*frame.size.width,frame.origin.y, frame.size.width, frame.size.height);
// top to buttom
//                             frame.origin.y = 0;
//                             menuView.frame = frame;
//                             menuView.frame = CGRectMake(frame.origin.x , frame.origin.y + 2*frame.size.height, frame.size.width, frame.size.height);
// buttom to top
//                             frame.origin.y = 0;
//                             menuView.frame = frame;
//                             menuView.frame = CGRectMake(frame.origin.x , frame.origin.y - 2*frame.size.height, frame.size.width, frame.size.height);
       
                             menuView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
                         }
                         completion:^(BOOL finished) {
                                
                             [UIView beginAnimations:nil context:nil];
                             [UIView setAnimationDuration:5.3];
                             [UIView commitAnimations];
                             
                             //        [menuView setHidden:true];
                             if (menuView) {
                                 for (UIView *subView in [menuView subviews]) {
                                     [subView removeFromSuperview];
                                 }
                                 
                                 [menuView removeFromSuperview];
                                 menuView = nil;
                             }

                         }];

        
        
    }
    else{// 0
        isShowedMenuView = 1;
//        menuView = [[CKMenuView alloc]initWithFrame:CGRectMake(0,0,0,kScreenBoundsHeight)];
        menuView = [[CKMenuView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        menuView.delegate = self;
        [self.window addSubview:menuView];
//        [menuView setHidden:false];
        
        CGRect initalFrame = menuView.frame;
        initalFrame.origin.x = initalFrame.size.width;
        menuView.frame = initalFrame;
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveFromLeftOrRight:) userInfo:@0 repeats:NO];
    }
    
    
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /*
    
    -(IBAction)rightClicked:(id)sender {
        CGRect initalFrame = self.baseView.frame;
        initalFrame.origin.x = initalFrame.size.width;
        self.baseView.frame = initalFrame;
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveFromLeftOrRight:) userInfo:@0 repeats:NO];
    }
    
    -(IBAction)leftClicked:(id)sender {
        CGRect initalFrame = self.baseView.frame;
        initalFrame.origin.x = -initalFrame.size.width;
        self.baseView.frame = initalFrame;
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveFromLeftOrRight:) userInfo:@1 repeats:NO];
    }
    
    -(void)moveFromLeftOrRight:(NSTimer *) timer {
        BOOL isLeft = [timer.userInfo boolValue];
        CGFloat bounceDistance = 10;
        CGFloat bounceDuration = 0.2;
        [UIView animateWithDuration:.2 delay:0.0 options:UIViewAnimationOptionAllowAnimatedContent
                         animations:^{
                             CGFloat direction = (isLeft ? 1 : -1);
                             self.baseView.center = CGPointMake(self.baseView.frame.size.width/2 + direction*bounceDistance, self.baseView.center.y);}
                         completion:^(BOOL finished){
                             [UIView animateWithDuration:bounceDuration animations:^{
                                 self.baseView.center = CGPointMake(self.baseView.frame.size.width/2, self.baseView.center.y);
                             }];
                         }];
    }

    
    */
    
    
    
}

#pragma mark - MenuView Delegate Method

- (void)touchDissmisView
{
    [self showMenuView:0];
}

-(void)moveFromLeftOrRight:(NSTimer *) timer {
    BOOL isLeft = [timer.userInfo boolValue];
    CGFloat bounceDistance = 0; //10
    CGFloat bounceDuration = 0.2;
    [UIView animateWithDuration:.2 delay:0.0 options:UIViewAnimationOptionAllowAnimatedContent
                     animations:^{
                         //0:to left
                         //1:to right
                         //2:to top
                         //3:to buttom
                         CGFloat direction = (isLeft ? 1 : -1);
                         menuView.center = CGPointMake(menuView.frame.size.width/2 + direction*bounceDistance, menuView.center.y);}
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:bounceDuration animations:^{
                             menuView.center = CGPointMake(menuView.frame.size.width/2, menuView.center.y);
                         }];
                         
                     }];
}





@end
