//
//  SlidePagesViewController.m
//  UnitedI
//
//  Created by Peace on 10/29/18.
//  Copyright © 2018 Peace. All rights reserved.
//

#import "SlidePagesViewController.h"
@interface SlidePagesViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (strong, nonatomic) UIImageView *slide1Image;
@property (strong, nonatomic) UIImageView *slide2Image;
@property (strong, nonatomic) UIImageView *slide3Image;

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIButton *signupButton;
@end

@implementation SlidePagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pageControl.numberOfPages = 3;
    [self.pageControl addTarget:self action:@selector(didChangePage:) forControlEvents: UIControlEventValueChanged];
    self.pageControl.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    
    self.scrollView.delegate = self;
    
    //signup button style
    self.signupButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
    
   
}
- (void)viewDidAppear:(BOOL)animated{
    CGSize screenSize = self.view.bounds.size;
    self.scrollView.frame =CGRectMake(0, 0, screenSize.width, screenSize.height);
    self.scrollView.contentSize = CGSizeMake(screenSize.width * self.pageControl.numberOfPages, screenSize.height);
    
    self.slide1Image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,  screenSize.width,  screenSize.height)];
    [self.slide1Image setImage:[UIImage imageNamed:@"register1"]];
    self.slide1Image.contentMode = UIViewContentModeScaleAspectFill;
    self.slide1Image.clipsToBounds = YES;
    [self.scrollView addSubview:self.slide1Image];
    
    self.slide2Image = [[UIImageView alloc] initWithFrame:CGRectMake(screenSize.width, 0,  screenSize.width,  screenSize.height)];
    [self.slide2Image setImage:[UIImage imageNamed:@"register2"]];
    self.slide2Image.contentMode =  UIViewContentModeScaleAspectFill;
    self.slide2Image.clipsToBounds = YES;
    [self.scrollView addSubview:self.slide2Image];
    
    self.slide3Image = [[UIImageView alloc] initWithFrame:CGRectMake(screenSize.width *2, 0,  screenSize.width,  screenSize.height)];
    [self.slide3Image setImage:[UIImage imageNamed:@"register3"]];
    self.slide3Image.contentMode =  UIViewContentModeScaleAspectFill;
    self.slide3Image.clipsToBounds = YES;
    [self.scrollView addSubview:self.slide3Image];
  
}

-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
   
    // Test the offset and calculate the current page after scrolling ends
    CGFloat pageWidth = scrollView.frame.size.width;
    int currentPage = (int)floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1;
    // Change the indicator
    self.pageControl.currentPage = currentPage;
    [self didChangePage:self.pageControl];
    
}
- (void)didChangePage:(UIPageControl*)sender {
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = (CGFloat)sender.currentPage * self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:offset animated: true];
    
    
    [self changeTitleADescription];
}
-(void)changeTitleADescription{
    switch(self.pageControl.currentPage){
            case 0:
            self.titleLabel.text = @"HOW IT WORKS";
            self.descriptionLabel.text = @"Through our legal membership program, we provide pre-paid legal services that allow our team to work diligently to reunify you with your family upon detention. Lawyers will be readily available to come to you defense while your deportation case is in process.";
            break;
            case 1:
            self.titleLabel.text = @"ABOUT US";
            self.descriptionLabel.text = @"Our diverse team of passionate, driven and dedicated professionals founded United Immigrants (UI) in 2018. We were birthed out of a call to action to provide comprehensivec products and services to families in distress.";
            break;
            case 2:
            self.titleLabel.text = @"WHY US";
            self.descriptionLabel.text = @"We are committed to be at the forefront of providing disruptive and innovative services that will help build and strengthen communities.";
            break;
    }
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
