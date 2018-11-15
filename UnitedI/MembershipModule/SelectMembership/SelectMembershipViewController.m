//
//  SelectMembershipViewController.m
//  UnitedI
//
//  Created by Peace on 10/29/18.
//  Copyright © 2018 Peace. All rights reserved.
//

#import "SelectMembershipViewController.h"

@interface SelectMembershipViewController (){
    BOOL isPaid;
    BOOL isAnySelected;
}
@property (weak, nonatomic) IBOutlet UIView *paidDesView;
@property (weak, nonatomic) IBOutlet UIView *freeDesView;
@property (weak, nonatomic) IBOutlet UILabel *paidTitle;
@property (weak, nonatomic) IBOutlet UILabel *freeTitle;

@end

@implementation SelectMembershipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    isPaid = NO;
    isAnySelected = NO;
    [self showingDes];
    
}
- (void)viewDidAppear:(BOOL)animated{
    // style of des
    self.paidDesView.layer.borderWidth = 8;
    self.paidDesView.layer.cornerRadius = 4;
    self.paidDesView.layer.borderColor = UIColorWithHexString(@"005fa1").CGColor;
    
    self.freeDesView.layer.borderWidth = 8;
    self.freeDesView.layer.cornerRadius = 4;
    self.freeDesView.layer.borderColor = UIColorWithHexString(@"005fa1").CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Plans action
- (IBAction)paidAction:(id)sender {
    isAnySelected = YES;
    isPaid = YES;
    [self showingDes];
}
- (IBAction)freeAction:(id)sender {
    isAnySelected = YES;
    isPaid = NO;
    [self showingDes];
    
}
#pragma mark - Showing des fun
-(void)showingDes{
    if(isAnySelected){
        if(isPaid){
            self.paidTitle.hidden = YES;
            self.freeTitle.hidden = NO;
            
            self.paidDesView.hidden = NO;
            self.freeDesView.hidden = YES;
        } else {
            self.paidTitle.hidden = NO;
            self.freeTitle.hidden = YES;
            
            self.paidDesView.hidden = YES;
            self.freeDesView.hidden = NO;
        }
    } else {
        self.paidDesView.hidden = YES;
        self.freeDesView.hidden = YES;
        
        self.paidTitle.hidden = NO;
        self.freeTitle.hidden = NO;
    }
}

#pragma mark - Navigation

- (IBAction)nextFun:(id)sender {
    if(isAnySelected){
        if(isPaid)
            [self toEligibility];
        else
            [self toDashboard];
    } else
        alertCustom(SCLAlertViewStyleNotice, @"Please select your membership method");
}
// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//
//}


@end
