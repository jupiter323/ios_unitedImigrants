//
//  RootViewController.m
//  UnitedI
//
//  Created by Peace on 10/29/18.
//  Copyright © 2018 Peace. All rights reserved.
//

#import "RootViewController.h"
#import "UIViewController+LMSideBarController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - textfield style
-(void)SetTextFieldPlaceholder:(UITextField *)textField{
    [textField setValue:UIColorWithHexString(@"005fa1")
             forKeyPath:@"_placeholderLabel.textColor"];
}

-(void)SetTextFieldBorder :(UIView *)textField{
    
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 2;
    border.borderColor = UIColorWithHexString(@"005fa1").CGColor;
    border.frame = CGRectMake(0, textField.frame.size.height - borderWidth, textField.frame.size.width, textField.frame.size.height);
    border.borderWidth = borderWidth;
    [textField.layer addSublayer:border];
    textField.layer.masksToBounds = YES;
    
}
#pragma mark - country array
-(NSMutableArray *)getCountries{
    NSLocale *locale = [NSLocale currentLocale];
    NSArray *countryArray = [NSLocale ISOCountryCodes];
    
    NSMutableArray *sortedCountryArray = [[NSMutableArray alloc] init];
    
    for (NSString *countryCode in countryArray) {
        
        NSString *displayNameString = [locale displayNameForKey:NSLocaleCountryCode value:countryCode];
        [sortedCountryArray addObject:displayNameString];
    }
    return sortedCountryArray;
    
}
#pragma mark - navigating
-(void)returnFun{
    
    //    animating
    [self navAnimating:kCATransitionReveal subtype:kCATransitionFromBottom];
    
    //    navigating
    [self.navigationController popViewControllerAnimated:NO];
}
-(void) navAnimating:(NSString *) type subtype:(NSString *) subtype{
    //    for animation navigating
    CATransition* transition = [CATransition animation];
    transition.duration = 0.7;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = type; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    transition.subtype = subtype; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    
}

-(void)toDashboard {
    [self navAnimating:kCATransitionMoveIn subtype:kCATransitionFromTop];

    UIViewController *dashboard = (UIViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"DashBoardRootViewController"];
    
    [self.navigationController pushViewController:dashboard animated:NO];
}
-(void)toEligibility {
    [self navAnimating:kCATransitionMoveIn subtype:kCATransitionFromTop];
    
    UIViewController *eligibility = (UIViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"EligibilityViewController"];
    
    [self.navigationController pushViewController:eligibility animated:NO];
}
-(void)toMenu {
    [self.sideBarController showMenuViewControllerInDirection:LMSideBarControllerDirectionRight];
}
-(void)toReportSent{
    [self navAnimating:kCATransitionMoveIn subtype:kCATransitionFromTop];
    
    UIViewController *ReportSent = (UIViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"ReportSentViewController"];
    
    [self.navigationController pushViewController:ReportSent animated:NO];
}
-(void)toRecordingIn{
    [self navAnimating:kCATransitionMoveIn subtype:kCATransitionFromTop];
    
    UIViewController *RecordingInViewController = (UIViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"RecordingInViewController"];
    
    [self.navigationController pushViewController:RecordingInViewController animated:NO];
}

-(void)toVideoSent{
    [self navAnimating:kCATransitionMoveIn subtype:kCATransitionFromTop];
    
    UIViewController *VideoSentViewController = (UIViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"VideoSentViewController"];
    
    [self.navigationController pushViewController:VideoSentViewController animated:NO];
    
}
-(void)toTutorial{
    [self navAnimating:kCATransitionMoveIn subtype:kCATransitionFromTop];    
    UIViewController *VideoSentViewController = (UIViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"TutorialsViewController"];
    [self.navigationController pushViewController:VideoSentViewController animated:NO];
}
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
