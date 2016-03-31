//
//  CKMenuView.m
//  knbankmbr
//
//  Created by gclee on 2016. 3. 31..
//  Copyright © 2016년 knbank. All rights reserved.
//

#import "CKMenuView.h"

#define HEADVIEW_HEIGHT      100
#define LEFTVIEW_WIDTH       100
#define LEFTMARGIN_WIDTH     50

//-------------------------------

//-------------------------------






//-------------------------------

@interface CKMenuView() <CKMenuViewDelegate>
{
//    NSString *title;
//    NSString *linkUrl;
//    
//    UIImageView *containerView;
//    UIWebView *aWebview;
    UIView *backView;
    UIView *containerView;
    UIView *headerView;
    UIScrollView *leftVerticalView;
    UIScrollView *CenterHorizontalView;
}

@end

@implementation CKMenuView

- (void)releaseItem
{
//    if (title) title = nil;
//    if (linkUrl) linkUrl = nil;
//    if (containerView) containerView = nil;
//    if (aWebview) [aWebview stopLoading], aWebview = nil;
}

- (void)removeFromSuperview
{
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
    
    [super removeFromSuperview];
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
//        title = [aTitle copy];
//        
//        if (aLinkUrl) {
//            linkUrl = [aLinkUrl copy];
//            
//            [self initLayout];
//        }
    }
    [self initLayout];
    
    return self;
}

- (void)initLayout
{
    //[self setBackgroundColor:[UIColor clearColor]];
    //[self setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.6]];
    
//    UIView *containerView;
//    UIView *headerView;
//    UIScrollView *leftVerticalView;
//    UIScrollView *CenterHorizontalView;

    backView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
//    backView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8]; //0.5
    backView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    backView.alpha = 0.6;
    
    backView.userInteractionEnabled = YES;
    UITapGestureRecognizer *buttonTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    buttonTap.cancelsTouchesInView = NO;
    [backView addGestureRecognizer:buttonTap];
    [self addSubview:backView];

//      containerView =
    
    
//    UIImage *backgroundImage = [[UIImage imageNamed:@"layer_pd_popup_bg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
//    
//    UIImageView *contentView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenBoundsWidth, kScreenBoundsHeight)];
//    [contentView setUserInteractionEnabled:YES];
//    [self addSubview:contentView];
//    
//    containerView = [[UIImageView alloc] initWithFrame:CGRectMake(13.5f, 0, CGRectGetWidth(self.frame)-27, 260)];
//    [containerView setCenter:CGPointMake(kScreenBoundsWidth/2, kScreenBoundsHeight/2)];
//    [containerView setImage:backgroundImage];
//    [containerView setUserInteractionEnabled:YES];
//    [contentView addSubview:containerView];
//    
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(17, 0, kScreenBoundsWidth-42, 42)];
//    [titleLabel setText:title];
//    [titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
//    [titleLabel setTextColor:UIColorFromRGB(0x333333)];
//    [titleLabel setBackgroundColor:[UIColor clearColor]];
//    [containerView addSubview:titleLabel];
//    
//    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [closeButton setFrame:CGRectMake(CGRectGetWidth(containerView.frame)-42, 0, 42, 42)];
//    [closeButton setImage:[UIImage imageNamed:@"ic_pd_popup_close.png"] forState:UIControlStateNormal];
//    [closeButton addTarget:self action:@selector(touchCloseButton) forControlEvents:UIControlEventTouchUpInside];
//    [containerView addSubview:closeButton];
//    
//    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(2, 41, CGRectGetWidth(self.frame)-31, 1)];
//    [lineView setBackgroundColor:UIColorFromRGBA(0xafb0c2, 0.3f)];
//    [containerView addSubview:lineView];
//    
//    aWebview = [[UIWebView alloc] initWithFrame:CGRectMake(2.5f, CGRectGetMaxY(lineView.frame), containerView.frame.size.width-5.f, 0)];
//    aWebview.delegate = self;
//    aWebview.clipsToBounds = NO;
//    aWebview.scalesPageToFit = YES;
//    aWebview.scrollView.scrollsToTop = NO;
//    [containerView addSubview:aWebview];
    
}

-(void)handleTap:(id)sender //close view
{
    [self.delegate touchDissmisView];
}



@end
