//
//  BasicInfoViewController.m
//  UnitedI
//
//  Created by Peace on 10/29/18.
//  Copyright © 2018 Peace. All rights reserved.
//

#import "BasicInfoViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface BasicInfoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTxt;
@property (weak, nonatomic) IBOutlet UITextField *passcodeTxt;

@end

@implementation BasicInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.   
  
   
}
- (void)viewDidAppear:(BOOL)animated{
    //style of txts
    [self SetTextFieldBorder:self.phoneTxt];
    [self SetTextFieldBorder:self.passcodeTxt];
    [self SetTextFieldPlaceholder:self.phoneTxt];
    [self SetTextFieldPlaceholder:self.passcodeTxt];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - keyboard dismiss
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.passcodeTxt resignFirstResponder];
    [self.phoneTxt resignFirstResponder];
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
