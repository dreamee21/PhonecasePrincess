//
//  IPhone5_ViewController.h
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 7/1/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "OrderViewController.h"
#import "ConfirmBuyingViewController.h"
#import "OrderViewController.h"

@interface IPhone5ViewController : UIViewController <UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>
{
    CGFloat _lastScale;
    CGFloat _firstX;
    CGFloat _firstY;
    
    UIImageView *photoImageView;
    UIImageView *tappedImageView;
    UIView *canvas;
    UIView *subCanvas;
    
    CAShapeLayer *_marque;
    
    UIImage *photoImage;
}
@property (strong, nonatomic) UIImage *photoImage;

@property (strong, nonatomic) IBOutlet UIView *canvas;
@property (strong, nonatomic) IBOutlet UIView *subCanvas;
@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) IBOutlet UIImageView *tappedImageView;

@property (strong, nonatomic) ConfirmBuyingViewController *confirmBuyingViewController;

- (IBAction)backBtn:(id)sender;
- (IBAction)confirmBuying:(id)sender;
- (void)takePhoto;
- (void)selectPhoto;

@end
