//
//  PipeDelegate.h
//  Pipe
//
//  Created by Remus on 11/03/16.
//  Copyright © 2016 Pipe Services SRL. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PipeDelegate;

@protocol PipeRecorderDelegate <NSObject>

-(void) videoUploadSuccess:(PipeDelegate *) sender withResult:(NSString *)result;
-(void) videoUploadFail:(PipeDelegate *) sender withError:(NSError *)error;

@end

@interface PipeDelegate : NSObject{
    
}

@property (nonatomic, weak) id<PipeRecorderDelegate> delegate;

-(void) successDelegate:(NSString *) result;
-(void) failDelegate:(NSError *) error;

@end
