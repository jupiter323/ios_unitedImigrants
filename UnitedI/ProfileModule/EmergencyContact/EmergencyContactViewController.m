//
//  EmergencyContactViewController.m
//  UnitedI
//
//  Created by Peace on 10/29/18.
//  Copyright © 2018 Peace. All rights reserved.
//

#import "EmergencyContactViewController.h"

@interface EmergencyContactViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstnameTxt;

@property (weak, nonatomic) IBOutlet UITextField *lastnameTxt;
@property (weak, nonatomic) IBOutlet UITextField *emailTxt;

@end

@implementation EmergencyContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated{
    // style text fields
    [self SetTextFieldPlaceholder:self.firstnameTxt];
    
    [self SetTextFieldPlaceholder:self.lastnameTxt];
    
    [self SetTextFieldPlaceholder:self.emailTxt];
    
    [self SetTextFieldBorder:self.firstnameTxt];
    [self SetTextFieldBorder:self.lastnameTxt];
    [self SetTextFieldBorder:self.emailTxt];
}
#pragma mark - keyboard & dropdown dismiss
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.firstnameTxt resignFirstResponder];
    [self.lastnameTxt resignFirstResponder];
    [self.emailTxt resignFirstResponder];
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
