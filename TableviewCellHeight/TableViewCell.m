//
//  TableViewCell.m
//  TableviewCellHeight
//
//  Created by Yu Gao on 4/3/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "TableViewCell.h"
#import <Masonry.h>

@interface TableViewCell ()

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createTitle];
        [self createContent];
        [self updateFonts];
    }
    return self;
}

- (void)createTitle {
    _title = [[UILabel alloc] init];
    [self.contentView addSubview:_title];
}

- (void)createContent {
    _content = [[UILabel alloc] init];
    _content.numberOfLines = 0;
    [self.contentView addSubview:_content];
}

- (void)updateConstraints {
    [super updateConstraints];
    
    if (_didSetupConstraints) return;
    
    
    
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.contentView.mas_left).offset(0);
        make.right.equalTo(self.contentView.mas_right).offset(0);
        make.height.equalTo(@20);
    }];
    [_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_title.mas_bottom).offset(0);
        make.left.equalTo(self.contentView.mas_left).offset(0);
        make.right.equalTo(self.contentView.mas_right).offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
    }];
    _didSetupConstraints = YES;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.contentView layoutSubviews];
    _content.preferredMaxLayoutWidth = CGRectGetWidth(_content.frame);
}

- (void)updateFonts {
    _title.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    _content.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
}

@end
