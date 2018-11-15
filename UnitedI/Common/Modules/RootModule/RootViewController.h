//
//  RootViewController.h
//  UnitedI
//
//  Created by Peace on 10/29/18.
//  Copyright © 2018 Peace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utilities.h"
@interface RootViewController : UIViewController
-(void)SetTextFieldBorder :(UIView *)textField;
-(void)SetTextFieldPlaceholder:(UITextField *)textField;
-(NSMutableArray *)getCountries;
-(void)returnFun;
-(void)toDashboard;
-(void)toEligibility;
-(void)toMenu;
-(void)toReportSent;
-(void)toRecordingIn;
-(void)toVideoSent;
-(void)toTutorial;
@end
