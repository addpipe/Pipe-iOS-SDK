# Pipe iOS SDK v1.0

[Pipe](https://addpipe.com/) handles recording video from web and mobile, all the different file formats, ensures secure storage & delivery and has the JS and Webhook APIs needed for a seamless integration.

# How to setup
* Create iOS App
* Add Pipe.framework in your app target General->Embedded Binaries section.  In the resulting popup window ensure that "Copy items if needed" is checked.  Xcode will automatically add the framework to the "Linked Frameworks and Libraries" section as well.

# Initializing the Pipe recorder

## Initialization with default options

```
#import <Pipe/Pipe.h>

PipeRecorder* recorder = [[PipeRecorder alloc] initWithPipeAccountHash:@"YOUR_PIPE_ACCOUNT_HASH"];

[self presentViewController:recorder animated:true completion:nil];
```

The above lines of code will initialize the Pipe recorder with the default options:
* SD recording
* 2 minutes of maximum allowed recording
* empty custom data payload

But all of these can be customized and more.

# Changing the options

All of the following options must be specified before presenting the view i.e. before this line:

```
[self presentViewController:recorder animated:true completion:nil];
```

## Changing the default maximum recording duration

```
recorder.maxDuration = 60; // or any duration in seconds

```

## Changing the video quality

```
recorder.recordHD = TRUE;
```

## Adding a data payload

```
recorder.payload = @"My custom data payload";
```

## Customizing the UI

```
recorder.showsCameraControls = NO;
recorder.cameraOverlayView = a_custom_made_view
```

Pipe Recorder is a subclass of UIImagePickerController, so any standard ways of creating a custom camera UI apply. An example of a really simple custom UI can be viewed in the Test App.

# Select an existing recording

If you wish to select an already made video instead of recording a new one simply add the following line of code after presenting the recorder in your app:

```
[recorder useExistingVideo];
```

# Delegate

In order to get notified in your app of video uploading success or failure you need to use PipeRecorderDelegate like so:

In your .h file add

```
@interface ViewController:UIViewController<PipeRecorderDelegate>

...

```

In your .m file add

```
recorder.pipeCustomDelegate.delegate = self;
```

and implement the needed protocol methods:

```
-(void) videoUploadSuccess:(PipeDelegate *) sender withResult:(NSString *)result{

}

-(void) videoUploadFail:(PipeDelegate *) sender withError:(NSError *)error{

}

```
