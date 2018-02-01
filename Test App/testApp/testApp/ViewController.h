//
//  ViewController.h
//  testApp
//
//  Created by Remus on 08/03/16.
//  Copyright © 2018 Pipe Services SRL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Pipe/Pipe.h>

@interface ViewController : UIViewController<PipeRecorderDelegate>{
    
}  

@property (nonatomic) PipeRecorder* recorder;

@end

