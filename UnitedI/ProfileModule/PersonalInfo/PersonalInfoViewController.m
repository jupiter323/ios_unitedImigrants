//
//  PersonalInfoViewController.m
//  UnitedI
//
//  Created by Peace on 10/29/18.
//  Copyright © 2018 Peace. All rights reserved.
//

#import "PersonalInfoViewController.h"

@interface PersonalInfoViewController (){
    int countryIndex;
    MKDropdownMenu * countryDropdown;
    NSMutableArray *sortedCountryArray;
}
@property (weak, nonatomic) IBOutlet UITextField *firstnameTxt;
@property (weak, nonatomic) IBOutlet UITextField *lastnameTxt;
@property (weak, nonatomic) IBOutlet UITextField *emailTxt;
@property (weak, nonatomic) IBOutlet UITextField *birthTxt;
@property (weak, nonatomic) IBOutlet UITextField *mobileTxt;
@property (weak, nonatomic) IBOutlet UIView *dropdownContainView;

@end

@implementation PersonalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    countryIndex = -1;
    sortedCountryArray = [self getCountries];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated{
    //style of txts
    [self SetTextFieldBorder:self.firstnameTxt];
    [self SetTextFieldBorder:self.lastnameTxt];
    [self SetTextFieldBorder:self.emailTxt];
    [self SetTextFieldBorder:self.birthTxt];
    [self SetTextFieldBorder:self.mobileTxt];
    [self SetTextFieldBorder:self.dropdownContainView];
   
    [self SetTextFieldPlaceholder:self.firstnameTxt];
    [self SetTextFieldPlaceholder:self.lastnameTxt];
    [self SetTextFieldPlaceholder:self.emailTxt];
    [self SetTextFieldPlaceholder:self.birthTxt];
    [self SetTextFieldPlaceholder:self.mobileTxt];
    
    // dropdown init
    countryDropdown = [[MKDropdownMenu alloc] initWithFrame:CGRectMake(0, 0, self.dropdownContainView.bounds.size.width,self.dropdownContainView.bounds.size.height )];
    [countryDropdown setComponentTextAlignment:NSTextAlignmentLeft];
    countryDropdown.dataSource = self;
    countryDropdown.delegate = self;
    countryDropdown.layer.borderWidth = 0;
    countryDropdown.disclosureIndicatorImage = [UIImage imageNamed:@"indicateForDropdown"] ;
    countryDropdown.backgroundDimmingOpacity = 0;
    countryDropdown.disclosureIndicatorSelectionRotation = M_PI;
    [self.dropdownContainView addSubview:countryDropdown];
    
}
#pragma mark - keyboard & dropdown dismiss

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.firstnameTxt resignFirstResponder];
    [self.lastnameTxt resignFirstResponder];
    [self.emailTxt resignFirstResponder];
    [self.birthTxt resignFirstResponder];
    [self.mobileTxt resignFirstResponder];
    delay(0.15, ^{
        [self->countryDropdown closeAllComponentsAnimated:YES];
    });
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}



#pragma mark - MKDropdownMenuDataSource

- (NSInteger)numberOfComponentsInDropdownMenu:(MKDropdownMenu *)dropdownMenu {
    return 1;

}

- (NSInteger)dropdownMenu:(MKDropdownMenu *)dropdownMenu numberOfRowsInComponent:(NSInteger)component {
    if(dropdownMenu == countryDropdown)
    return [sortedCountryArray count];
    return [sortedCountryArray count];
}
#pragma mark - MKDropdownMenuDelegate

- (CGFloat)dropdownMenu:(MKDropdownMenu *)dropdownMenu rowHeightForComponent:(NSInteger)component {
    return self.dropdownContainView.frame.size.height;
}



- (NSAttributedString *)dropdownMenu:(MKDropdownMenu *)dropdownMenu attributedTitleForComponent:(NSInteger)component {
    if(dropdownMenu == countryDropdown)
    return [[NSAttributedString alloc] initWithString:countryIndex==-1?@"Country of origin":sortedCountryArray[countryIndex]
                                           attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14],
                                                        NSForegroundColorAttributeName: UIColorWithHexString(@"005fa1")}];
    return 0;
}

- (NSAttributedString *)dropdownMenu:(MKDropdownMenu *)dropdownMenu attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSMutableAttributedString *string;
    if(dropdownMenu == countryDropdown)
    string =
    [[NSMutableAttributedString alloc] initWithString: [NSString stringWithFormat:@"%@", sortedCountryArray[row]]
                                           attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14],
                                                        NSForegroundColorAttributeName: UIColorWithHexString(@"005fa1")}];
    return string;
}

//
- (UIColor *)dropdownMenu:(MKDropdownMenu *)dropdownMenu backgroundColorForHighlightedRowsInComponent:(NSInteger)component {
    return [UIColor colorWithWhite:0.0 alpha:0.5];
}


- (void)dropdownMenu:(MKDropdownMenu *)dropdownMenu didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if(dropdownMenu == countryDropdown){
        // save index of dropdown
        countryIndex = (int)row;
    }

    delay(0.15, ^{
        [dropdownMenu closeAllComponentsAnimated:YES];
        [dropdownMenu reloadAllComponents];
    });
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
