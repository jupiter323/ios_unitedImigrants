//
//  ReportRaidRootViewController.m
//  UnitedI
//
//  Created by Peace on 11/2/18.
//  Copyright © 2018 Peace. All rights reserved.
//

#import "ReportRaidRootViewController.h"
#import "LMSideBarDepthStyle.h"
#import "RightMenuViewController.h"
@interface ReportRaidRootViewController ()

@end

@implementation ReportRaidRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // Init side bar styles
    LMSideBarDepthStyle *sideBarDepthStyle = [LMSideBarDepthStyle new];
    sideBarDepthStyle.menuWidth = 232;
    
    // Init view controllers
    RightMenuViewController *rightMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RightMenuViewController"];
    UIViewController *contentController = [self.storyboard instantiateViewControllerWithIdentifier:@"ReportRaidViewController"];
    
    // Setup side bar controller
    [self setPanGestureEnabled:YES];
    [self setDelegate:self];
    [self setMenuViewController:rightMenuViewController forDirection:LMSideBarControllerDirectionRight];
    [self setSideBarStyle:sideBarDepthStyle forDirection:LMSideBarControllerDirectionRight];
    [self setContentViewController:contentController];
}


#pragma mark - SIDE BAR DELEGATE

- (void)sideBarController:(LMSideBarController *)sideBarController willShowMenuViewController:(UIViewController *)menuViewController
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
}

- (void)sideBarController:(LMSideBarController *)sideBarController didShowMenuViewController:(UIViewController *)menuViewController
{
    
}

- (void)sideBarController:(LMSideBarController *)sideBarController willHideMenuViewController:(UIViewController *)menuViewController
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
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
