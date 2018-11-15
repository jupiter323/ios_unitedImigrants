//
//  ReportSentViewController.m
//  UnitedI
//
//  Created by Peace on 10/31/18.
//  Copyright © 2018 Peace. All rights reserved.
//

#import "ReportSentViewController.h"

@interface ReportSentViewController ()

@end

@implementation ReportSentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    delay(2.0, ^{
        [self toRecordingIn];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
