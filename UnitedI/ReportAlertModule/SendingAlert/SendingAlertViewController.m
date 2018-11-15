//
//  SendingAlertViewController.m
//  UnitedI
//
//  Created by Peace on 10/31/18.
//  Copyright © 2018 Peace. All rights reserved.
//

#import "SendingAlertViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface SendingAlertViewController (){
    NSTimer *TimeOfActiveUser;
    int leftSecond;
}
@property (weak, nonatomic) IBOutlet UILabel *leftSecondLbl;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *progressAI;

@end

@implementation SendingAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    leftSecond = 6;
    [self timeIntervalFun];
}
- (void)viewDidAppear:(BOOL)animated{
    self.progressAI.transform = CGAffineTransformMakeScale(4, 4);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Time interval
- (void)timeIntervalFun
{
    
    TimeOfActiveUser = [NSTimer scheduledTimerWithTimeInterval:1.0  target:self selector:@selector(actionTimer) userInfo:nil repeats:YES];
}


-(void)actionTimer
{
    leftSecond--;
    self.leftSecondLbl.text =   [NSString stringWithFormat:@"%d", leftSecond];
    if(leftSecond==0){
        [self stopTimer];
        [self toReportSent];
        
    }
    
    
}
-(void)stopTimer
{
    [TimeOfActiveUser invalidate];
    TimeOfActiveUser = nil;
}
#pragma mark - Navigation
- (IBAction)cancelFun:(id)sender {
    [self returnFun];
}

/*


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
