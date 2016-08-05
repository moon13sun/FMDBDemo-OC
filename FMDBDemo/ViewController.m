//
//  ViewController.m
//  FMDBDemo
//
//  Created by leergou on 16/7/1.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

#import "ViewController.h"
#import "STProductModel.h"
#import "STProductTools.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

/**
 *  seartchBar
 */
@property (weak, nonatomic) IBOutlet UITableView *searchBar;

/**
 *  tableView
 */
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/**
 *  数据源
 */
@property (nonatomic,strong) NSArray<STProductModel *> *modelArray;

@end

@implementation ViewController

#pragma mark - 0.控制器入口
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

#pragma mark - 1.按钮逻辑
// createModel
- (IBAction)createModel:(id)sender {
    
    STProductModel *model = [[STProductModel alloc] init];
    
    model.proName = @"Andriod";
    
    model.proPrice = arc4random_uniform(1000);
    
    [STProductTools createModel:model];
}


// deleteModel
- (IBAction)deleteModel:(id)sender {
    
    [STProductTools deleteModel:15];
}

// update
- (IBAction)updateDB:(id)sender {
    
    STProductModel *model = [[STProductModel alloc] init];

    model.proName = @"book";
    
    model.proPrice = 5;
    
    [STProductTools updateModel:model withProNo:26];
    
}

// retrieve
- (IBAction)retrieveAllData:(id)sender {
    
    [STProductTools retrieveAllProduct];
    
}

#pragma mark - 2.tableView dataSource
// section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

// row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}

// cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    STProductModel *model = self.modelArray[indexPath.row];
    
    cell.textLabel.text = model.proName;
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",model.proPrice];
    
    return cell;
}

#pragma mark - 3.searchBar delegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    self.modelArray = [STProductTools retrieveAllProductWithKeyword:searchText];
    
    [self.tableView reloadData];
}


@end















