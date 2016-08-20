//
//  HMTableViewCell.m
//  downLoadPicture01
//
//  Created by mac on 16/8/20.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "HMTableViewCell.h"
#import "HMPictureModel.h"
#import "UIImageView+WebCache.h"
@interface HMTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *downloadLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@end
@implementation HMTableViewCell

-(void)setModel:(HMPictureModel *)model
{
    _model = model;
    _nameLabel.text = model.name;
    _downloadLabel.text = model.download;
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"user_default"]];
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
