//
//  UpgradeMembershipViewController.m
//  UnitedI
//
//  Created by Peace on 11/1/18.
//  Copyright © 2018 Peace. All rights reserved.
//

#import "UpgradeMembershipViewController.h"

@interface UpgradeMembershipViewController (){
    UpgradeMembershipDefinition selectedMembership;
    
}
@property (weak, nonatomic) IBOutlet UIView *individualView;
@property (weak, nonatomic) IBOutlet UIView *threeView;
@property (weak, nonatomic) IBOutlet UIView *individualYearlyView;
@property (weak, nonatomic) IBOutlet UIView *threeYearlyView;

@end

@implementation UpgradeMembershipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    selectedMembership = -1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- selected style
-(void) selectedStyle:(UIView *) myView{
    myView.layer.shadowRadius  = 1.5f;
    myView.layer.shadowColor   = [UIColor colorWithRed:176.f/255.f green:199.f/255.f blue:226.f/255.f alpha:1.f].CGColor;
    myView.layer.shadowOffset  = CGSizeMake(0.0f, 0.0f);
    myView.layer.shadowOpacity = 0.9f;
    myView.layer.masksToBounds = NO;
    UIEdgeInsets shadowInsets     = UIEdgeInsetsMake(0, 0, -1.5f, 0);
    UIBezierPath *shadowPath      = [UIBezierPath bezierPathWithRect:UIEdgeInsetsInsetRect(myView.bounds, shadowInsets)];
    myView.layer.shadowPath    = shadowPath.CGPath;
    
    myView.layer.borderWidth = 2;
    myView.layer.borderColor = UIColorWithHexString(@"005fa1").CGColor;
    myView.transform = CGAffineTransformMakeScale(1.1f, 1.1f);
    
}
-(void) setAsDefaultSTyle:(UIView *) myView {
    myView.transform = CGAffineTransformMakeScale(1, 1);
    myView.layer.shadowRadius  = 0;
    myView.layer.shadowColor = [UIColor clearColor].CGColor;
    myView.layer.borderWidth = 0;
}
#pragma mark - select action
- (IBAction)individualBtnAction:(id)sender {
    switch (selectedMembership) {
        case IndividualUpgradeMonthlyMembership:
            return;
            break;
        case ThreeUpgradeMonthlyMembership:
            [self setAsDefaultSTyle:self.threeView];
            [self selectedStyle:self.individualView];
            break;
        case IndividualUpgradeYearlyMembership:
            [self setAsDefaultSTyle:self.individualYearlyView];
            [self selectedStyle:self.individualView];
            break;
        case ThreeUpgradeYearlyMembership:
            [self setAsDefaultSTyle:self.threeYearlyView];
            [self selectedStyle:self.individualView];
            break;
        default:
            [self selectedStyle:self.individualView];
            break;
    }
    
    selectedMembership = IndividualUpgradeMonthlyMembership;
    
}
- (IBAction)threeBtnAction:(id)sender {
    
    switch (selectedMembership) {
        case IndividualUpgradeMonthlyMembership:
            [self setAsDefaultSTyle:self.individualView];
            [self selectedStyle:self.threeView];
            break;
        case ThreeUpgradeMonthlyMembership:
            return;
            break;
        case IndividualUpgradeYearlyMembership:
            [self setAsDefaultSTyle:self.individualYearlyView];
            [self selectedStyle:self.threeView];
            break;
        case ThreeUpgradeYearlyMembership:
            [self setAsDefaultSTyle:self.threeYearlyView];
            [self selectedStyle:self.threeView];
            break;
        default:
            [self selectedStyle:self.threeView];
            break;
    }
    
    selectedMembership = ThreeUpgradeMonthlyMembership;
    
}
- (IBAction)individualYearlyBtnAction:(id)sender {
    switch (selectedMembership) {
        case IndividualUpgradeMonthlyMembership:
            [self setAsDefaultSTyle:self.individualView];
            [self selectedStyle:self.individualYearlyView];
            break;
        case ThreeUpgradeMonthlyMembership:
            [self setAsDefaultSTyle:self.threeView];
            [self selectedStyle:self.individualYearlyView];
            break;
        case IndividualUpgradeYearlyMembership:
            return;
            break;
        case ThreeUpgradeYearlyMembership:
            [self setAsDefaultSTyle:self.threeYearlyView];
            [self selectedStyle:self.individualYearlyView];
            break;
        default:
            [self selectedStyle:self.individualYearlyView];
            break;
    }
    
    selectedMembership = IndividualUpgradeYearlyMembership;
}
- (IBAction)threeYearlyBtnAction:(id)sender {
    switch (selectedMembership) {
        case IndividualUpgradeMonthlyMembership:
            [self setAsDefaultSTyle:self.individualView];
            [self selectedStyle:self.threeYearlyView];
            break;
        case ThreeUpgradeMonthlyMembership:
            [self setAsDefaultSTyle:self.threeView];
            [self selectedStyle:self.threeYearlyView];
            break;
        case IndividualUpgradeYearlyMembership:
            [self setAsDefaultSTyle:self.individualYearlyView];
            [self selectedStyle:self.threeYearlyView];
            break;
        case ThreeUpgradeYearlyMembership:
            return;
            break;
        default:
            [self selectedStyle:self.threeYearlyView];
            break;
    }
    selectedMembership = ThreeUpgradeYearlyMembership;
}
#pragma mark - navigation
- (IBAction)gotoDashboard:(id)sender {
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
