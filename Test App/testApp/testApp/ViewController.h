//
//  ViewController.h
//  testApp
//
//  Created by Remus on 08/03/16.
//  Copyright © 2016 nusofthq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Pipe/Pipe.h>

@interface ViewController : UIViewController<PipeRecorderDelegate>{
    
}  

@property (nonatomic) PipeRecorder* recorder;

@end

