//
//  ImageDocument.m
//  ImportantJpgs
//
//  Created by Cory Alder on 2015-07-07.
//  Copyright (c) 2015 Cory Alder. All rights reserved.
//

#import "ImageDocument.h"

@implementation ImageDocument

-(BOOL)loadFromContents:(id)contents ofType:(NSString *)typeName error:(NSError *__autoreleasing *)outError {
    
    NSFileWrapper *directoryWrapper = contents;
    
   NSFileWrapper *imageWrapper = [directoryWrapper.fileWrappers objectForKey:@"image"];
    
    NSFileWrapper *metaDataWrapper = [directoryWrapper.fileWrappers objectForKey:@"metadata"];
    
    NSData * imageData = [imageWrapper regularFileContents];
    NSData * metaData = [metaDataWrapper regularFileContents];
    
    if (imageData && metaData) {
        
        self.image = [UIImage imageWithData:imageData];
        
        self.imageInfo = [NSJSONSerialization JSONObjectWithData:metaData options:0 error:outError];
        
        return YES;
    } else {
        // create and set an NSError object.
        *outError = [NSError errorWithDomain:@"com.myapp.filesystem" code:100 userInfo:nil];
        return NO;
    }
}

-(id)contentsForType:(NSString *)typeName error:(NSError *__autoreleasing *)outError {
    
    NSData *imageData = UIImageJPEGRepresentation(self.image, 0.9);
    
    NSData *metaData = [NSJSONSerialization dataWithJSONObject:self.imageInfo options:0 error:outError];
    
    NSFileWrapper *imageWrapper = [[NSFileWrapper alloc] initRegularFileWithContents:imageData];
    
    NSFileWrapper *metadataWrapper = [[NSFileWrapper alloc] initRegularFileWithContents:metaData];
    
    NSFileWrapper * fileWrapper = [[NSFileWrapper alloc] initDirectoryWithFileWrappers:@{@"image" : imageWrapper, @"metadata" : metadataWrapper }];
    
    // if any step fails, set the outError
    
    return fileWrapper;
}

@end
