//
//  NewsTableViewCell.h
//  UnitedI
//
//  Created by Peace on 11/3/18.
//  Copyright © 2018 Peace. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *dateLbl;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLbl;
@property (weak, nonatomic) IBOutlet UIImageView *raidImv;

@end

NS_ASSUME_NONNULL_END
