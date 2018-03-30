//  您好，谢谢您参考我的项目，如果有问题请移步
//  https://github.com/manofit/BabyPigAnimation
//
//  ViewController.m
//  BabyPigAnimation
//
//  Created by 高军 on 2018/3/27.
//  Copyright © 2018年 Jun Gao. All rights reserved.
//

#import "ViewController.h"
#import "BaseAnimationViewController.h"
#import "KeyFrameAnimationViewController.h"
#import "GroupAnimationViewController.h"
#import "TransitionAnimationViewController.h"
#import "CombinationAniViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSArray *_dataArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"iOS动画";
    
    [self createUI];
    [self configData];
    
}

-(void)createUI{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

-(void)configData{
    NSArray *array_1 = [NSArray arrayWithObjects:@"位移",@"透明度",@"缩放",@"旋转",@"背景色", nil];
    NSMutableDictionary *dic_1 = [NSMutableDictionary dictionaryWithObject:array_1 forKey:@"value"];
    [dic_1 setValue:@"基础动画" forKey:@"title"];
    
    NSArray *array_2 = [NSArray arrayWithObjects:@"关键帧",@"路径",@"抖动", nil];
    NSMutableDictionary *dic_2 = [NSMutableDictionary dictionaryWithObject:array_2 forKey:@"value"];
    [dic_2 setValue:@"关键帧动画" forKey:@"title"];
    
    NSArray *array_3 = [NSArray arrayWithObjects:@"同时",@"连续", nil];
    NSMutableDictionary *dic_3 = [NSMutableDictionary dictionaryWithObject:array_3 forKey:@"value"];
    [dic_3 setValue:@"组动画" forKey:@"title"];
    
    NSArray *array_4 = [NSArray arrayWithObjects:@"fade",@"moveIn",@"push",@"reveal",@"cube",@"suck",@"oglFile",@"ripple",@"curl",@"unCurl",@"caOpen",@"caClose", nil];
    NSMutableDictionary *dic_4 = [NSMutableDictionary dictionaryWithObject:array_4 forKey:@"value"];
    [dic_4 setValue:@"过渡动画" forKey:@"title"];
    
    NSArray *array_5 = [NSArray arrayWithObjects:@"path",@"钉钉",@"点赞",@"贝塞尔曲线", nil];
    NSMutableDictionary *dic_5 = [NSMutableDictionary dictionaryWithObject:array_5 forKey:@"value"];
    [dic_5 setValue:@"组合案例" forKey:@"title"];
    
    _dataArray = @[dic_1,dic_2,dic_3,dic_4,dic_5];
    
    [_tableView reloadData];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSDictionary *dic = _dataArray[section];
    NSArray *array = dic[@"value"];
    return array.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSDictionary *dic = _dataArray[section];
    return dic[@"title"];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (nil == cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.textLabel.text = _dataArray[indexPath.section][@"value"][indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0){
        BaseAnimationViewController *vc = [[BaseAnimationViewController alloc] initWithType:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 1){
        KeyFrameAnimationViewController *vc = [[KeyFrameAnimationViewController alloc] initWithType:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 2){
        GroupAnimationViewController *vc = [[GroupAnimationViewController alloc] initWithType:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 3){
        TransitionAnimationViewController *vc = [[TransitionAnimationViewController alloc] initWithType:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 4){
        CombinationAniViewController *vc = [[CombinationAniViewController alloc] initWithType:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
