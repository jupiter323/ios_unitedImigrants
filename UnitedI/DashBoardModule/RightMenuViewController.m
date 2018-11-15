//
//  RightMenuViewController.m
//  UnitedI
//
//  Created by Peace on 10/31/18.
//  Copyright © 2018 Peace. All rights reserved.
//

#import "RightMenuViewController.h"
#import "UIViewController+LMSideBarController.h"
@interface RightMenuViewController ()

@end

@implementation RightMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Navigation
- (IBAction)gotoTutorial:(id)sender {
    [self hiddeMenu:sender];
    [self toTutorial];
}
#pragma mark - Hide menu
- (IBAction)hiddeMenu:(id)sender {
    [self.sideBarController hideMenuViewController:YES];
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
