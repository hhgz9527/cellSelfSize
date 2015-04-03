//
//  TableViewCell.h
//  TableviewCellHeight
//
//  Created by Yu Gao on 4/3/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *content;

- (void)updateFonts;

@end
