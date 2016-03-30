//
//  MenuViewController.m
//  knbankmbr
//
//  Created by gclee on 2016. 3. 30..
//  Copyright © 2016년 knbank. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()
{
    
}
@end

@implementation MenuViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view setBackgroundColor:UIColorFromRGB(0xe3e3e8)];
    
    // iOS7 Layout
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    
    // Navigation : viewDidLoad에서 한번, viewDidAppear에서 한번 더 한다.
    [self.navigationItem setHidesBackButton:YES];
    
    // data init
    //[self initData];
    
    // Layout
    [self initLayout];
    
    // API
    //[self getCategoryDetailData:categoryUrl];
    
    //LoadingView
//    loadingView = [[CPLoadingView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2-40,
//                                                                  (CGRectGetHeight(self.view.frame)-kToolBarHeight)/2-40,
//                                                                  80,
//                                                                  80)];

    
}

#pragma mark - Init

- (void)initLayout
{
//    [mainScrollView removeFromSuperview];
//    
//    //메인 스크롤뷰
//    mainScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    [mainScrollView setBackgroundColor:[UIColor clearColor]];
//    [mainScrollView setBounces:NO];
//    [mainScrollView setDelegate:self];
//    [self.view addSubview:mainScrollView];
    
//    productThumbnailView = [[CPProductThumbnailView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(mainScrollView.frame), 0) product:productInfo];
//    [productThumbnailView setDelegate:self];
//    [mainScrollView addSubview:productThumbnailView];
    
//    //상품명 & 가격정보 & 만족도, 리뷰 영역 - prdNm & prdPrice
//    productPriceView = [[CPProductPriceView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(productBadgeView.frame)+6, kScreenBoundsWidth-20, 0)
//                                                         product:productInfo];
//    [productPriceView setDelegate:self];
//    [mainScrollView addSubview:productPriceView];
    
    //도서-시리즈상품 상세보기
//    bookSeriesView = [[CPBookSeriesView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(productLikeView.frame), kScreenBoundsWidth, 0) product:productInfo];
//    [bookSeriesView setDelegate:self];
//    [mainScrollView addSubview:bookSeriesView];
    
    //탭 메뉴 Height
//    defaultInfoHeight = CGRectGetMaxY(productBannerView.frame);
//    
//    //탭 메뉴
//    tabMenuView = [[CPProductTabMenuView alloc] initWithFrame:CGRectMake(0, defaultInfoHeight, CGRectGetWidth(mainScrollView.frame), 49)
//                                                      product:productInfo];
//    [tabMenuView setBackgroundColor:UIColorFromRGB(0xe3e3e8)];
//    [tabMenuView setDelegate:self];
//    [mainScrollView addSubview:tabMenuView];
    
    
//    //탭 메뉴 스크롤뷰
//    tabScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(tabMenuView.frame), CGRectGetWidth(mainScrollView.frame), CGRectGetHeight(mainScrollView.frame)-CGRectGetHeight(tabMenuView.frame)-(optDrawerYn?50:0))];
//    [tabScrollView setBackgroundColor:[UIColor grayColor]];
//    [tabScrollView setBounces:NO];
//    [tabScrollView setDelegate:self];
//    [mainScrollView addSubview:tabScrollView];
//
//    [tabScrollView setContentSize:CGSizeMake(CGRectGetWidth(mainScrollView.frame), CGRectGetHeight(tabScrollView.frame))];
    
    //버튼들
//    UIImage *imgTopNor = [UIImage imageNamed:@"bt_pd_floating_top_nor.png"];
//    UIImage *imgTopPress = [UIImage imageNamed:@"bt_pd_floating_top_press.png"];
//    topButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [topButton setImage:imgTopNor forState:UIControlStateNormal];
//    [topButton setImage:imgTopPress forState:UIControlStateHighlighted];
//    [topButton setFrame:CGRectMake(tabScrollView.frame.size.width-imgTopNor.size.width-5.f,
//                                   CGRectGetHeight(tabScrollView.frame)-imgTopNor.size.height-5.f,
//                                   imgTopNor.size.width, imgTopNor.size.height)];
//    [topButton addTarget:self action:@selector(onClickedTopButton:) forControlEvents:UIControlEventTouchUpInside];
//    [tabScrollView addSubview:topButton];
    
    
//    [mainScrollView setContentSize:CGSizeMake(kScreenBoundsWidth, 5000)];
//    
//    //스크롤뷰 설정
//    [self setMainScrollViewEnable:YES];
    
 }

@end

