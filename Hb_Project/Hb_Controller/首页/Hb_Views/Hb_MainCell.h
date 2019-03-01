//
//  Hb_MainCell.h
//  Hb_Project
//
//  Created by 毛蛋 on 2019/3/1.
//  Copyright © 2019 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Hb_MainCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *Hb_Image;
@property (weak, nonatomic) IBOutlet UILabel *Hb_titleLb;

@property (weak, nonatomic) IBOutlet UILabel *Hb_contentLb;
@end

NS_ASSUME_NONNULL_END
