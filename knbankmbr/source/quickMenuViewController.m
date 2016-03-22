//
//  quickMenuViewController.m
//  knbankmbr
//
//  Created by gclee on 2016. 3. 22..
//  Copyright © 2016년 knbank. All rights reserved.
//

#define TRANSITION_DURATION  0.3
#define SCREENSHOT_QUALITY  0.75
#define FRAME_OFFSET 10


#import "quickMenuViewController.h"

#pragma mark Category

@implementation UIView (ScreenShot)

-(UIImage*)screenShot{
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage * screenImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData * imageData = UIImageJPEGRepresentation(screenImage, SCREENSHOT_QUALITY);
    screenImage = [UIImage imageWithData:imageData];
    return screenImage;
}

-(UIImage*)screenShotOnScrolViewWithContentOffset:(CGPoint)offset{
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, -offset.x, -offset.y);
    [self.layer renderInContext:context];
    UIImage * screenImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData * imageData = UIImageJPEGRepresentation(screenImage, SCREENSHOT_QUALITY);
    screenImage = [UIImage imageWithData:imageData];
    return screenImage;
}

-(void)addTopBorderwithWidth:(CGFloat)width andColor:(CGColorRef)borderColor{
    CALayer *upperBorder = [CALayer layer];
    upperBorder.backgroundColor = borderColor;
    upperBorder.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), width);
    [self.layer addSublayer:upperBorder];
}

@end

@implementation UIImage (Blur_and_Color_Filter)

-(UIImage*)blurWithRadius:(CGFloat)radius{
    radius =(radius<0)?0:radius;
    radius =(radius>4)?4:radius;
    CIImage * inputImage = [CIImage imageWithCGImage:self.CGImage];
    CIFilter * blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [blurFilter setValue:inputImage forKey:@"inputImage"];
    [blurFilter setValue:[NSNumber numberWithFloat:radius] forKey:@"inputRadius"];
    CIImage * outputImage = [blurFilter outputImage];
    outputImage = [outputImage imageByCroppingToRect:[inputImage extent]];
    UIImage * blurImage = [UIImage imageWithCIImage:outputImage];
    return blurImage;
}

@end


@interface quickMenuViewController ()
{
    //UITextField *searchTextField;
    UIImageView * blurView;
}
@end

@implementation quickMenuViewController

#pragma mark -Animation

-(void)showMenuInParentViewController:(UIViewController *)parentVC withCenter:(CGPoint)center{
    [self ct_addToParentVC:parentVC withAnimation:YES];
    self.view.frame = parentVC.view.bounds;
    blurView = [[UIImageView alloc]init];
    [self.view addSubview:blurView];
    [self createScreenshotwithComleteAction:^{
        [self layoutMenuView];
    }];
}

-(void)dismissMenu{
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.75 options:0 animations:^{
        if (self.menuView.superview!=nil) {
            self.menuView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        }
    } completion:^(BOOL finished) {
        [self ct_removeFromParentVCwithAnimation:YES];
    }];
}

-(void)createScreenshotwithComleteAction:(dispatch_block_t)completeAction{
    self.blurView.frame = self.view.bounds;
    self.blurView.alpha = 0.0;
    self.menuView.alpha = 0.0;
    UIImage * screenshot = nil;
    if ([self.parentViewController.view isKindOfClass:[UIScrollView class]]) {
        screenshot = [self.parentViewController.view screenShotOnScrolViewWithContentOffset:[(UIScrollView*)self.parentViewController.view contentOffset]];
    }else{
        screenshot = [self.parentViewController.view screenShot];
    }
    self.blurView.alpha = 1.0; //gclee original 1.0
    self.menuView.alpha = 1.0;
    if (self.blurLevel >0.0) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage * blurImage = [screenshot blurWithRadius:self.blurLevel];
            dispatch_async(dispatch_get_main_queue(), ^{
                CATransition * transition = [CATransition animation];
                transition.duration = TRANSITION_DURATION;
                transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                transition.type = kCATransitionFade;
                
                self.blurView.image = blurImage;
                //[self.blurView setBackgroundColor:[UIColor blackColor]]; gclee
                
                [self.blurView.layer addAnimation:transition forKey:@"showBlurView"];
                [self.view setNeedsLayout];
                if (completeAction != nil) {
                    completeAction();
                }
                
                [self.view setNeedsLayout];
                [self.view layoutIfNeeded];
            });
        });
    }else{
        self.blurView.image = screenshot;
        if (completeAction != nil) {
            completeAction();
        }
    }
}

#pragma mark -Layout
-(void)layoutMenuView{
    self.itemViews = [NSMutableArray new];
    
    self.menuView.backgroundColor = _backgroundColor;
    self.menuView.layer.borderWidth = self.borderWidth;
    self.menuView.layer.borderColor = self.borderColor;
    self.menuView.layer.cornerRadius = self.borderRadius;
    self.menuView.layer.masksToBounds = YES;
    
    self.titleView = [UITextView new];
    self.titleView.userInteractionEnabled = NO;
    self.titleView.backgroundColor = [UIColor clearColor];
    [self.titleView setTextAlignment:self.textAligment];
    [self.titleView setTextColor:self.tintColor];
    [self.titleView setText:self.titleText];
    [self.titleView setFont:self.titleFont];
    
    self.messageView = [UITextView new];
    self.messageView.userInteractionEnabled = NO;
    self.messageView.backgroundColor = [UIColor clearColor];
    [self.messageView setTextAlignment:self.textAligment];
    [self.messageView setTextColor:self.tintColor];
    [self.messageView setText:self.messageText];
    [self.messageView setFont:self.messageFont];
    
    switch (self.menuStyle) {
        case MenuStyleList:
            [self layoutasList];
            break;
        case MenuStyleOval:
            [self layoutasOval];
            break;
        case MenuStyleGrid:
            [self layoutasGrid];
            break;
        default:
            [self layoutasDefault];
            break;
    }
    
    [self.view addSubview:self.menuView];
    self.menuView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.75 options:0 animations:^{
        self.menuView.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        self.menuView.transform = CGAffineTransformMakeScale(1, 1);
        
        //gclee
        //        self.activityIndicator.center = CGPointMake(self.menuView.bounds.size.width/2, self.menuView.bounds.size.height/2);
        //        [self.menuView addSubview:self.activityIndicator];
    }];
}


#pragma mark -Private
-(void)ct_addToParentVC:(UIViewController*)parentVC withAnimation:(BOOL)animate{
    [parentVC addChildViewController:self];
    [parentVC.view addSubview:self.view];
}


@end
