//
//  ViewController.m
//  testApp
//
//  Created by Remus on 08/03/16.
//  Copyright © 2018 Pipe Services SRL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) IBOutlet UIView *customView;
@property (weak, nonatomic) IBOutlet UIButton *btnRec;
@property (weak, nonatomic) IBOutlet UIButton *btnStop;


@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _recorder = [[PipeRecorder alloc] initWithPipeAccountHash:@"YOUR_ACCOUNT_HASH"];
    _recorder.pipeCustomDelegate.delegate = self;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)recordVideo:(UIButton *)sender {
    
    _recorder.maxDuration = 60;
    _recorder.recordHD = TRUE;
    _recorder.payload = @"Test payload for recording default";
    
    [self presentViewController:_recorder animated:true completion:nil];
    
    NSLog(@"Camera started default");
}

- (IBAction)recordVideoCustom:(UIButton *)sender {
    
    _recorder.maxDuration = 5;
    _recorder.recordHD = FALSE;
    _recorder.payload = @"Test payload for recording custom";
    
    //Using a custom UI example (see customOverlay.xib file). Hiding the default controls and adding the custom created view.
    [[NSBundle mainBundle] loadNibNamed:@"customOverlay" owner:self options:nil];
    self.customView.frame = _recorder.cameraOverlayView.frame;
    _recorder.cameraOverlayView = self.customView;
    _recorder.showsCameraControls = NO;
    self.customView = nil;
    // end custom UI code
    
    [self presentViewController:_recorder animated:true completion:nil];
    
    self.btnStop.enabled = NO;
    
    NSLog(@"Camera started custom");
}

- (IBAction)useVideo:(UIButton *)sender {
    
    _recorder.payload = @"Test payload for existing video";
    [self presentViewController:_recorder animated:true completion:nil];
    [_recorder useExistingVideo];
    
    NSLog(@"Albums opened");
}


/*
 * Custom UI methods
 */

- (IBAction)closeButtonPressed:(id)sender {
    if(_recorder) [_recorder dismissViewControllerAnimated:YES completion:nil];
    _recorder = nil;
    
}

- (IBAction)recordButtonPressed:(id)sender {
    if(_recorder) [_recorder startVideoCapture];
    self.btnStop.enabled = YES;
    self.btnRec.enabled = NO;
}

- (IBAction)stopButtonPressed:(id)sender {
    if(_recorder) [_recorder stopVideoCapture];
}


/*
 * Delegate methods
 */

-(void) videoUploadSuccess:(PipeDelegate *)sender withResult:(NSString *)result{
    NSLog(@"Video result = %@", result);
}

-(void) videoUploadFail:(PipeDelegate *)sender withError:(NSError *)error{
    NSLog(@"Video error = %@", error);
}

@end
