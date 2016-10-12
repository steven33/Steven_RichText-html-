//
//  RootViewController.m
//  Steven_RichText
//
//  Created by qugo on 16/10/10.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"

@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"富文本编辑器";
    UITableView *table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    table.tableFooterView = [[UIView alloc]init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idenstr = @"sss";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idenstr];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:idenstr];
    }
    cell.textLabel.text = @[@"新增",@"编辑"][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ViewController *view = [[ViewController alloc]init];
    NSString *str = @"哈哈哈啊啊啊啊 <img src=\"http://pic.baikemy.net/apps/kanghubang/486/3486/iOS1475026895.jpg\"><div>哈哈哈啊啊啊啊奥等级看哈接口b</div>";
    view.inHtmlString = indexPath.row == 0?@"":str;
    [self.navigationController pushViewController:view animated:YES];
}



@end
