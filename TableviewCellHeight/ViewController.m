//
//  ViewController.m
//  TableviewCellHeight
//
//  Created by Yu Gao on 4/3/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>{
    NSArray *array;
}

@property (nonatomic, strong) TableViewCell *tableviewCell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createTableView];
    array = [NSArray arrayWithObjects:@"2131231213123121312312131231213123121312312131231213123121312312131231213123121312312131231213123121312312131231213123121312312131231213123121312312131231213123121312312131231213123121312312131231213123121312312", @"1321ddsddasda", @"12321321321321123213213213211232132132132112321321321321", nil];
}

- (void)createTableView {
    UITableView *tableview = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Identifier"];
    [cell updateFonts];
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Identifier"];
    }
    cell.title.text = @"1312312";
    cell.content.text = array[indexPath.row];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!_tableviewCell) {
        _tableviewCell = [[TableViewCell alloc] init];
    }
    [_tableviewCell updateFonts];
    _tableviewCell.title.text = @"1312312";
    
    NSString *bodyText = array[indexPath.row];
    NSMutableAttributedString *bodyAttributedText = [[NSMutableAttributedString alloc] initWithString:bodyText];
    NSMutableParagraphStyle *bodyParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    [bodyParagraphStyle setLineSpacing:10];
    [bodyAttributedText addAttribute:NSParagraphStyleAttributeName value:bodyParagraphStyle range:NSMakeRange(0, bodyText.length)];
    
    _tableviewCell.content.attributedText = bodyAttributedText;
    [_tableviewCell setNeedsUpdateConstraints];
    [_tableviewCell updateConstraintsIfNeeded];
    
    _tableviewCell.bounds = CGRectMake(0, 0, CGRectGetWidth(tableView.bounds), CGRectGetHeight(_tableviewCell.bounds));
    [_tableviewCell setNeedsLayout];
    [_tableviewCell layoutIfNeeded];

    CGFloat height = [_tableviewCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    return height + 1;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self tableView:tableView heightForRowAtIndexPath:indexPath];
}

@end
