//
//  ViewController.m
//  ImportantJpgs
//
//  Created by Cory Alder on 2015-07-07.
//  Copyright (c) 2015 Cory Alder. All rights reserved.
//

#import "ViewController.h"
#import <Photos/Photos.h>
#import "ImageDocument.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) ImageDocument *imageDoc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageDoc = [[ImageDocument alloc] initWithFileURL:[self imageDocURL]];
    
    [self.imageDoc openWithCompletionHandler:^(BOOL success) {
        self.imageView.image = self.imageDoc.image;
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)recentPhotoAndSave:(id)sender {
    
    PHPhotoLibrary *library = [PHPhotoLibrary sharedPhotoLibrary];
    
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        // got auth
        
        PHFetchResult *fetchResult = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:nil];
        
        NSUInteger rand = arc4random_uniform((u_int32_t)[fetchResult count]);
        
        PHAsset *randomImageAsset = fetchResult[rand];
        
        PHImageManager *imageManager = [PHImageManager defaultManager];
        
        CGSize requestedSize = (CGSize){600,600};
        
        [imageManager requestImageForAsset:randomImageAsset targetSize:requestedSize contentMode:(PHImageContentModeAspectFill) options:PHImageRequestOptionsVersionCurrent resultHandler:^(UIImage *result, NSDictionary *info) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (result) {
                    self.imageView.image = result;
                }
            });
        }];
    }];
}

-(NSURL *)imageDocURL {
    
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [searchPaths objectAtIndex:0];
    
    NSString *itemPath = [documentPath stringByAppendingPathComponent:@"file.ij"];
    
    NSLog(@"itemPath is %@", itemPath);
    return [NSURL fileURLWithPath:itemPath];
}

-(IBAction)saveDocument:(id)sender {
    NSLog(@"Saving");
    
    self.imageDoc.image = self.imageView.image;
    self.imageDoc.imageInfo = @{@"image_info" : @"info1111"};
    
    [self.imageDoc saveToURL:self.imageDoc.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:^(BOOL success) {
        NSLog(@"File saved!");
    }];

}

@end
