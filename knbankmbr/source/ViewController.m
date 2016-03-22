//
//  ViewController.m
//  knbankmbr
//
//  Created by gclee on 2016. 2. 26..
//  Copyright © 2016년 knbank. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//gclee
//#define Appdelegate (((AppDelegate *)[[UIApplication sharedApplication] delegate]))
//#define Appdelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])
//                  ^----------------------parenthesis--------------------------^
    
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
//    [self.view addSubview:shadowView];
    
    
//    ////////////////////////////////////////////////////////////////////////////////////////////////////
//    UIView *shadow = [[UIView alloc]init];
//    shadow.layer.cornerRadius = 5.0;
//    shadow.layer.shadowColor = [[UIColor redColor] CGColor];
//    shadow.layer.shadowOpacity = 1.0;
//    shadow.layer.shadowRadius = 10.0;
//    shadow.layer.shadowOffset = CGSizeMake(0.0f, -0.5f);
//    
//    UIButton *btnCompose = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btnCompose setFrame:CGRectMake(kScreenBoundsWidth-80, kScreenBoundsHeight-80, 80, 80)];
//    //[btnCompose setUserInteractionEnabled:YES];
//    btnCompose.layer.cornerRadius = 30;
//    btnCompose.layer.masksToBounds = YES;
//    [btnCompose setImage:[UIImage imageNamed:@"location_icon"] forState:UIControlStateNormal];
//    [btnCompose addTarget:self action:@selector(btnCompose_click) forControlEvents:UIControlEventTouchUpInside];
//    [shadow addSubview:btnCompose];
//    [self.view addSubview:shadow];
//    
//    UIButton *btnEmpty = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btnEmpty setFrame:CGRectMake(kScreenBoundsWidth-80, kScreenBoundsHeight-80, 80, 80)];
//    [btnEmpty setBackgroundColor:[UIColor clearColor]];
//    [btnEmpty addTarget:self action:@selector(btnCompose_click) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btnEmpty];
//    ///////////////////////////////////////////////////////////////////////////////////////////////////
    
    //    UIButton *bannerImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [bannerImageButton setFrame:bannerImageView.frame];
    //    [bannerImageButton setBackgroundColor:[UIColor clearColor]];
    //    [bannerImageButton setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0x000000)] forState:UIControlStateHighlighted];
    //    [bannerImageButton addTarget:self action:@selector(touchBannerButton) forControlEvents:UIControlEventTouchUpInside];
    //    [bannerImageButton setAlpha:0.3];
    //    [containerView addSubview:bannerImageButton];


    
    //return shadow;
}

#pragma mark - Selectors

- (void)btnCompose_click
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

    
    
    /////////////////////////////////////////////////

//    - (UIView*)putView:(UIView*)view insideShadowWithColor:(UIColor*)color andRadius:(CGFloat)shadowRadius andOffset:(CGSize)shadowOffset andOpacity:(CGFloat)shadowOpacity
//    {
//        CGRect shadowFrame; // Modify this if needed
//        shadowFrame.size.width = 0.f;
//        shadowFrame.size.height = 0.f;
//        shadowFrame.origin.x = 0.f;
//        shadowFrame.origin.y = 0.f;
//        UIView * shadow = [[UIView alloc] initWithFrame:shadowFrame];
//        shadow.userInteractionEnabled = NO; // Modify this if needed
//        shadow.layer.shadowColor = color.CGColor;
//        shadow.layer.shadowOffset = shadowOffset;
//        shadow.layer.shadowRadius = shadowRadius;
//        shadow.layer.masksToBounds = NO;
//        shadow.clipsToBounds = NO;
//        shadow.layer.shadowOpacity = shadowOpacity;
//        [view.superview insertSubview:shadow belowSubview:view];
//        [shadow addSubview:view];
//        return shadow;
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//+ (UIView *)genComposeButton:(UIViewController <UIComposeButtonDelegate> *)observer;
//{
//    UIView *shadow = [[UIView alloc]init];
//    shadow.layer.cornerRadius = 5.0;
//    shadow.layer.shadowColor = [[UIColor blackColor] CGColor];
//    shadow.layer.shadowOpacity = 1.0;
//    shadow.layer.shadowRadius = 10.0;
//    shadow.layer.shadowOffset = CGSizeMake(0.0f, -0.5f);
//    
//    UIButton *btnCompose = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,60, 60)];
//    [btnCompose setUserInteractionEnabled:YES];
//    btnCompose.layer.cornerRadius = 30;
//    btnCompose.layer.masksToBounds = YES;
//    [btnCompose setImage:[UIImage imageNamed:@"60x60"] forState:UIControlStateNormal];
//    [btnCompose addTarget:observer action:@selector(btnCompose_click:) forControlEvents:UIControlEventTouchUpInside];
//    [shadow addSubview:btnCompose];
//    return shadow;
//}

@end
