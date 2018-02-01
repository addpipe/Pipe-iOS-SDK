//
//  PipeRecorder.h
//  Pipe
//
//  Created by Remus on 08/03/16.
//  Copyright © 2018 Pipe Services SRL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "PipeDelegate.h"

@interface PipeRecorder: UIImagePickerController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,PipeRecorderDelegate>

@property (nonatomic) int maxDuration;
@property (nonatomic) NSString *payload;
@property (nonatomic) BOOL recordHD;

@property (nonatomic) PipeDelegate *pipeCustomDelegate;

-(id) initWithPipeAccountHash:(NSString*)hash;

-(void) useExistingVideo;

@end
