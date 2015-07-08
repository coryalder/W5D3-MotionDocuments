//
//  ViewController.m
//  eMotions
//
//  Created by Cory Alder on 2015-07-08.
//  Copyright (c) 2015 Cory Alder. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIDocumentPickerDelegate, UIDocumentMenuDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) CMMotionManager *motionManager;
@property (nonatomic, strong) CMMotionActivityManager *motionActivityManager;
@property (nonatomic, strong) CMPedometer *pedometer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.motionManager = [[CMMotionManager alloc] init];
    
    //CGFloat angle = atan2(.x, .y) - M_PI;
    
    // or "yaw"
    
    
    
    
    self.motionActivityManager = [[CMMotionActivityManager alloc] init];
    
    // "start", "query"
    
    
    
    
    
    
    self.pedometer = [[CMPedometer alloc] init];
    
    // "start", "query"
    

    
    
    // motion effects
    
    
    
//    UIInterpolatingMotionEffect *xMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
//    
//    xMotionEffect.minimumRelativeValue = @(-50);
//    
//    xMotionEffect.maximumRelativeValue = @(50);
//    
//    UIInterpolatingMotionEffect *yMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
//    
//    yMotionEffect.minimumRelativeValue = @(-50);
//    
//    yMotionEffect.maximumRelativeValue = @(50);
//    
//    
//    
//    UIMotionEffectGroup *group = [[UIMotionEffectGroup alloc] init];
//    
//    group.motionEffects = @[xMotionEffect, yMotionEffect];
//    
//    [self.imageView addMotionEffect:group];
    
    
    
}







// Document sharing and importing.



- (IBAction)openIn:(UIView *)sender {
    
    
    NSURL *pusheenUrl = [[NSBundle mainBundle] URLForResource:@"pizza" withExtension:@"jpg"];
    
//    UIDocumentInteractionController *interactionController = [UIDocumentInteractionController interactionControllerWithURL:pusheenUrl];
//    
//    [interactionController presentOpenInMenuFromRect:sender.frame inView:sender.superview animated:YES];
    
}



- (IBAction)open:(id)sender {
    
    // icloud entitlement
    
    
    // show menu, import mode
    
}


// menu delegate (set and show picker delegate)

// picker delegate, show document

@end
