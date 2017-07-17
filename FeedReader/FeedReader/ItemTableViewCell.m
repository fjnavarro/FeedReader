//
//  ItemTableViewCell.m
//  FeedReader
//
//  Created by Francisco José Navarro García on 17/7/17.
//  Copyright © 2017 fjnavarro.com. All rights reserved.
//

#import "ItemTableViewCell.h"

@implementation ItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    // Soluciona bug con la librería  -- SDWebImage --
    // http://www.wrichards.com/blog/2011/11/sdwebimage-fixed-width-cell-images/
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(5,5,40,32.5);
    float limgW =  self.imageView.image.size.width;
    if(limgW > 0) {
        self.textLabel.frame = CGRectMake(55,self.textLabel.frame.origin.y,self.textLabel.frame.size.width,self.textLabel.frame.size.height);
        self.detailTextLabel.frame = CGRectMake(55,self.detailTextLabel.frame.origin.y,self.detailTextLabel.frame.size.width,self.detailTextLabel.frame.size.height);
    }
}

@end
