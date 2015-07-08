//
//  ImageDocument.h
//  ImportantJpgs
//
//  Created by Cory Alder on 2015-07-07.
//  Copyright (c) 2015 Cory Alder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageDocument : UIDocument

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSDictionary *imageInfo;

@end
