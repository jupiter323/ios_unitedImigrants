//
//  RecordingInViewController.m
//  UnitedI
//
//  Created by Peace on 10/31/18.
//  Copyright © 2018 Peace. All rights reserved.
//

#import "RecordingInViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface RecordingInViewController (){
    UIImagePickerController *pickerController;
    UIView* overlayView;
    BOOL isRecording;
    int leftSecond;
    NSTimer *TimeOfActiveUser;
    UILabel *leftSecondLbl;
    UILabel *recordinInLbl;
    UIButton *cancelBtn;
    UILabel *recordingInDesLbl;
    
    int timeMin;
    int timeSec;
    UILabel *labelTime;
}

@end

@implementation RecordingInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    leftSecond = 4;
    isRecording = NO;
    pickerController = [[UIImagePickerController alloc] init];
    pickerController.delegate = self;
    pickerController.allowsEditing = NO;
//    pickerController.videoMaximumDuration = 300.0f;
    pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    pickerController.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
    
    // I want default controls be available here...
    pickerController.showsCameraControls = NO;
    [self openCamera];
    
}
- (void)viewDidAppear:(BOOL)animated{
    overlayView = [[UIView alloc] initWithFrame:self.view.frame];
    [self settingOverviewForRecordingIn];
    pickerController.cameraOverlayView = overlayView;
    [pickerController.cameraOverlayView setHidden:NO];
    [self timeIntervalFun];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Set overview

-(void)settingOverviewForRecordingIn{
    [overlayView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8f]];
    
    leftSecondLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height/2-45, self.view.bounds.size.width,90)];
    leftSecondLbl.textAlignment = NSTextAlignmentCenter;
    [leftSecondLbl setFont:[UIFont systemFontOfSize:90]];
    leftSecondLbl.textColor = [UIColor redColor];
    [overlayView addSubview:leftSecondLbl];
    
    recordinInLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height/2-155, self.view.bounds.size.width,20)];
    recordinInLbl.text = @"RECORDING IN";
    recordinInLbl.textAlignment = NSTextAlignmentCenter;
    [recordinInLbl setFont:[UIFont systemFontOfSize:20]];
    recordinInLbl.textColor = [UIColor redColor];
    [overlayView addSubview:recordinInLbl];
    
    cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(45, self.view.bounds.size.height/2+85, self.view.bounds.size.width - 90, 45)];
    [cancelBtn setBackgroundColor:[UIColor grayColor]];
    cancelBtn.layer.cornerRadius = 10;
    [cancelBtn setTitle:@"CANCEL" forState:normal];
    [cancelBtn setTitleColor:UIColorWithHexString(@"3C3C3C") forState:normal];
    [cancelBtn addTarget:self action:@selector(gotoDashboard:) forControlEvents:UIControlEventTouchUpInside];
    [overlayView addSubview:cancelBtn];
    
    recordingInDesLbl = [[UILabel alloc] initWithFrame:CGRectMake(40, self.view.bounds.size.height/2+150, self.view.bounds.size.width - 80,105)];
    recordingInDesLbl.numberOfLines = 3;
    recordingInDesLbl.text = @"The video will automatically send every minute to our network and will be no longer than 5 minutes.";
    recordingInDesLbl.textAlignment = NSTextAlignmentCenter;
    [recordingInDesLbl setFont:[UIFont systemFontOfSize:14]];
    recordingInDesLbl.textColor = UIColorWithHexString(@"3C3C3C");
    [overlayView addSubview:recordingInDesLbl];
    
    
    
    
}
-(void)settingOverviewForRecording{
    [overlayView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    leftSecondLbl.hidden = YES;
    recordinInLbl.hidden = YES;
    recordingInDesLbl.hidden = YES;
    cancelBtn.hidden = YES;
    // Start/ Stop fake button
    UIView *ssViewContainer = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 35, self.view.frame.size.height - 170, 70, 70)];
    [ssViewContainer setUserInteractionEnabled:YES];
    // Background color below is only there to make sure myt pseudo-button overlaps native Start/Stop button
    [ssViewContainer setBackgroundColor:[UIColor clearColor]];
    ssViewContainer.layer.cornerRadius = 35;
    ssViewContainer.layer.borderColor = [UIColor grayColor].CGColor;
    ssViewContainer.layer.borderWidth = 4;
    [overlayView addSubview:ssViewContainer];
    
    UIView *ssView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 26, self.view.frame.size.height - 161, 52, 52)];
    [ssView setUserInteractionEnabled:YES];
    // Background color below is only there to make sure myt pseudo-button overlaps native Start/Stop button
    [ssView setBackgroundColor:[UIColor redColor]];
    ssView.layer.cornerRadius = 26;
    UITapGestureRecognizer *t = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedClose:)];
    [ssView addGestureRecognizer:t];
    [overlayView addSubview:ssView];
    
    UILabel *recordingbl = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 80, self.view.bounds.size.width,20)];
    recordingbl.text = @"END RECORDING";
    recordingbl.textAlignment = NSTextAlignmentCenter;
    [recordingbl setFont:[UIFont systemFontOfSize:20]];
    recordingbl.textColor = [UIColor grayColor];
    [overlayView addSubview:recordingbl];
    
    
    labelTime = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 40)];
    labelTime.textAlignment = NSTextAlignmentCenter;
    [labelTime setFont:[UIFont systemFontOfSize:40]];
    labelTime.textColor = [UIColor whiteColor];
    [overlayView addSubview:labelTime];
    
    
}
- (void)startTimetrack {
    timeMin = 0;
    timeSec = 0;
    
    //String format 00:00
    NSString* timeNow = [NSString stringWithFormat:@"%02d:%02d", timeMin, timeSec];
    //Display on your label
    //[timeLabel setStringValue:timeNow];
    labelTime.text= timeNow;
    
    TimeOfActiveUser = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTick:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:TimeOfActiveUser forMode:NSDefaultRunLoopMode];
    
}



#pragma mark - Time interval

- (void)timeIntervalFun
{
    
    TimeOfActiveUser = [NSTimer scheduledTimerWithTimeInterval:1.0  target:self selector:@selector(actionTimer) userInfo:nil repeats:YES];
}


-(void)actionTimer
{
    leftSecond--;
    leftSecondLbl.text =   [NSString stringWithFormat:@"%d", leftSecond];
    if(leftSecond==0){
        [self stopTimer];
        [self settingOverviewForRecording];
        [self startTimetrack];
        [self startRecording];
        
    }
}
//Event called every time the NSTimer ticks.
- (void)timerTick:(NSTimer *)timer {
    timeSec++;
    if(timeSec == 300)[self closeRecord];
    if (timeSec == 60)
    {
        timeSec = 0;
        timeMin++;
    }
    //String format 00:00
    NSString* timeNow = [NSString stringWithFormat:@"%02d:%02d", timeMin, timeSec];
    //Display on your label
    labelTime.text= timeNow;
    
}

-(void)stopTimer
{
    [TimeOfActiveUser invalidate];
    TimeOfActiveUser = nil;
}
#pragma mark - Imagepicker delegate
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    // Cancel button tapped
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSLog(@"Got image : %@", info);
    [self stopTimer];
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self toVideoSent];
    // Do something with video captured
}
#pragma mark - camera control funs
-(void)startRecording{
    if ([pickerController startVideoCapture]) {
        NSLog(@"Video capturing started...");
        // add your business logic here ie start updating progress bar etc...
        isRecording = YES;
    }
}
-(void)tappedClose:(id)sender {
    if (isRecording) {
        [self closeRecord];
        return;
    }
}
-(void)closeRecord{
    [pickerController stopVideoCapture];
    NSLog(@"Video capturing stopped...");
    // add your business logic here ie stop updating progress bar etc...
    isRecording = NO;
}
- (void)openCamera {
    [pickerController.cameraOverlayView setHidden:NO];
    [self presentViewController:pickerController animated:YES completion:nil];
}

-(void)gotoDashboard:(UIButton *)sender{
    [pickerController dismissViewControllerAnimated:YES completion:nil];
    [self toDashboard];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
