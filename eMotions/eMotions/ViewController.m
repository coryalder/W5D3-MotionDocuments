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
    
//    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
//        
//        //NSLog(@"accelleration is %f, %f, %f", accelerometerData.acceleration.x, accelerometerData.acceleration.y, accelerometerData.acceleration.z);
//        
//        CGFloat angle = atan2(accelerometerData.acceleration.x, accelerometerData.acceleration.y) - M_PI;
//        
//        self.imageView.transform = CGAffineTransformMakeRotation(angle);
//        
//    }];
//    
//    [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
//       
//        
//        self.imageView.transform = CGAffineTransformMakeRotation(motion.attitude.yaw);
//
//    }];
    
    //CGFloat angle = atan2(.x, .y) - M_PI;
    
    // or "yaw"
    
    
//    self.motionActivityManager = [[CMMotionActivityManager alloc] init];
//    
//    [self.motionActivityManager startActivityUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMMotionActivity *activity) {
//       
//        if (activity.cycling == YES) {
//            NSLog(@"THis phone is riding a bike");
//        }
//        
//    }];
    
    
//    [self.motionActivityManager queryActivityStartingFromDate:[NSDate ] toDate:<#(NSDate *)#> toQueue:<#(NSOperationQueue *)#> withHandler:^(NSArray *activities, NSError *error) {
//        
//    }]
//    
    // "start", "query"
    
//    if ([CMPedometer isStepCountingAvailable]) {
//        self.pedometer = [[CMPedometer alloc] init];
//        
//        [self.pedometer startPedometerUpdatesFromDate:[NSDate date] withHandler:^(CMPedometerData *pedometerData, NSError *error) {
//            
//        }];
//        
//    } else {
//        NSLog(@"no step counter");
//    }
////    
//    [self.pedometer queryPedometerDataFromDate:<#(NSDate *)#> toDate:<#(NSDate *)#> withHandler:<#^(CMPedometerData *pedometerData, NSError *error)handler#>]
    
    
    
    
    
    
    
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
    
    UIDocumentInteractionController *interactionController = [UIDocumentInteractionController interactionControllerWithURL:pusheenUrl];

    [interactionController presentOpenInMenuFromRect:sender.frame inView:sender.superview animated:YES];
}



- (IBAction)open:(id)sender {
    
    
    UIDocumentMenuViewController *menu = [[UIDocumentMenuViewController alloc] initWithDocumentTypes:@[@"public.jpeg"] inMode:UIDocumentPickerModeImport];
    
    menu.delegate = self;
//
    
    [self presentViewController:menu animated:YES completion:nil];
//    
//    UIDocumentPickerViewController *picker = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:@[@"public.image"] inMode:UIDocumentPickerModeImport];
//    
//    picker.delegate = self;
//    
//    [self presentViewController:picker animated:YES completion:nil];
    
    // icloud entitlement
    
    
    // show menu, import mode
    
}

-(void)documentMenu:(UIDocumentMenuViewController *)documentMenu didPickDocumentPicker:(UIDocumentPickerViewController *)documentPicker {
    
    documentPicker.delegate = self;
    
    [self presentViewController:documentPicker animated:YES completion:nil];

}

-(void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentAtURL:(NSURL *)url {
    
    self.imageView.image = [UIImage imageWithContentsOfFile:[url path]];
    
}

// menu delegate (set and show picker delegate)

// picker delegate, show document

@end
