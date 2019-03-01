//
//  Hb_MainViewController.m
//  Hb_Project
//
//  Created by 毛蛋 on 2019/3/1.
//  Copyright © 2019 zhb. All rights reserved.
//

#import "Hb_MainViewController.h"
#import "Hb_MainCell.h"

@interface Hb_MainViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>{
    NSMutableArray * dataSource;    //数据源
    CGFloat beginContentY;          //开始滑动的位置
    CGFloat endContentY;            //结束滑动的位置
    CGFloat sectionHeaderHeight;    //section的header高度
}
@property (weak, nonatomic) IBOutlet UITableView *mainTableVeiw;

@end

@implementation Hb_MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    sectionHeaderHeight = 40;
    dataSource = [[NSMutableArray alloc] init];

    [dataSource addObject:@{@"title":@"记你的你的哪等你",@"content":@"记你的你的哪等你记你的你的哪等你记你的你的哪等你记你的你的哪等你记你的你的哪等你记你的你的哪等你记你的你的哪等你记你的你的哪等你记你的你的哪等你"}];
        [dataSource addObject:@{@"title":@"为你的你的内地嫩爹",@"content":@"记你的你的哪等你跌得爹妈跌跌跌买碟买碟碟碟鸡"}];
        [dataSource addObject:@{@"title":@"哈哈哈哈哈哈哈哈",@"content":@"得多么都饿，都饿哦的哦没得多么恶魔的的几得叫叠加叠加地诶基地将诶大结局爹间谍"}];
        [dataSource addObject:@{@"title":@"米的好肚饿股的吧唧的间谍",@"content":@"的对口饿哭都饿哭都饿空的课哦大口饿哭都饿哭都饿哭都饿哭都饿哭都饿哭的"}];
        [dataSource addObject:@{@"title":@"哈哈哈哈哈啊哈哈哈哈哈你呢",@"content":@"v 有反弹的毒蒽的ID金额 u 好肚饿肚饿肚饿吧胡的互动和 u 好肚饿大河"}];
        [dataSource addObject:@{@"title":@"特别的毒液好肚饿好肚饿好肚饿好肚饿",@"content":@"魔都诶扽和 uu 卡联赛岁的呢大家额度很低恶魔的空妈妈和没联系啦什么可伤心"}];
        [dataSource addObject:@{@"title":@"的牛护肤润肤乳后放入繁华如风",@"content":@"得叫都饿空对你的 u 好肚饿好肚饿互动和 u 的和 u 的护额大户饿好肚饿大户恶化"}];
        [dataSource addObject:@{@"title":@"特价的呢 u 肚饿",@"content":@"最难得的夜光运动和 u 的黑蝶蝴蝶蝴蝶蝴蝶蝴蝶蝴蝶蝴蝶"}];
        [dataSource addObject:@{@"title":@"不懂夜的被大本营大本营的背影",@"content":@"的嫉妒诶间谍局递交诶到家诶大结局爹的低价额"}];
        [dataSource addObject:@{@"title":@"记你的你的哪等你",@"content":@"记你的你的哪等你记你的你的哪等你记你的你的哪等你记你的你的哪等你记你的你的哪等你记你的你的哪等你记你的你的哪等你记你的你的哪等你记你的你的哪等你"}];
        [dataSource addObject:@{@"title":@"为你的你的内地嫩爹",@"content":@"记你的你的哪等你跌得爹妈跌跌跌买碟买碟碟碟鸡"}];
        [dataSource addObject:@{@"title":@"哈哈哈哈哈哈哈哈",@"content":@"得多么都饿，都饿哦的哦没得多么恶魔的的几得叫叠加叠加地诶基地将诶大结局爹间谍"}];
        [dataSource addObject:@{@"title":@"米的好肚饿股的吧唧的间谍",@"content":@"的对口饿哭都饿哭都饿空的课哦大口饿哭都饿哭都饿哭都饿哭都饿哭都饿哭的"}];
        [dataSource addObject:@{@"title":@"哈哈哈哈哈啊哈哈哈哈哈你呢",@"content":@"v 有反弹的毒蒽的ID金额 u 好肚饿肚饿肚饿吧胡的互动和 u 好肚饿大河"}];
        [dataSource addObject:@{@"title":@"特别的毒液好肚饿好肚饿好肚饿好肚饿",@"content":@"魔都诶扽和 uu 卡联赛岁的呢大家额度很低恶魔的空妈妈和没联系啦什么可伤心"}];
        [dataSource addObject:@{@"title":@"的牛护肤润肤乳后放入繁华如风",@"content":@"得叫都饿空对你的 u 好肚饿好肚饿互动和 u 的和 u 的护额大户饿好肚饿大户恶化"}];
        [dataSource addObject:@{@"title":@"特价的呢 u 肚饿",@"content":@"最难得的夜光运动和 u 的黑蝶蝴蝶蝴蝶蝴蝶蝴蝶蝴蝶蝴蝶"}];
        [dataSource addObject:@{@"title":@"不懂夜的被大本营大本营的背影",@"content":@"的嫉妒诶间谍局递交诶到家诶大结局爹的低价额"}];

    [self.mainTableVeiw registerNib:[UINib nibWithNibName:@"Hb_MainCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataSource count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * iden = @"cell";
    Hb_MainCell * cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[Hb_MainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    
    NSString * str = [dataSource objectAtIndex:indexPath.row][@"title"];
    NSString * str1 = [dataSource objectAtIndex:indexPath.row][@"content"];
    cell.Hb_titleLb.text = str;
    cell.Hb_contentLb.text = str1;
    cell.Hb_Image.backgroundColor=randomColor;
    
    return cell;
}

// 当开始滚动视图时，执行该方法。一次有效滑动（开始滑动，滑动一小段距离，只要手指不松开，只算一次滑动），只执行一次。
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //获取开始位置
    beginContentY = scrollView.contentOffset.y;
}

// 滑动scrollView，并且手指离开时执行。一次有效滑动，只执行一次。
// 当pagingEnabled属性为YES时，不调用，该方法
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    //获取结束位置
    endContentY = scrollView.contentOffset.y;
    if(endContentY-beginContentY > 100)
    {
        [UIView animateWithDuration:0.25 animations:^{
            CGRect rect = self.navigationController.navigationBar.frame;
            rect.origin.y = -44;
            self.navigationController.navigationBar.frame = rect;
            self.mainTableVeiw.frame = CGRectMake(0, -44, self.view.frame.size.width, self.view.frame.size.height+44);
        }];
        sectionHeaderHeight = 0;
        [self.mainTableVeiw reloadData];
    } else if(endContentY-beginContentY < -100)  {
        [UIView animateWithDuration:0.25 animations:^{
            CGRect rect = self.navigationController.navigationBar.frame;
            rect.origin.y = 20;
            self.navigationController.navigationBar.frame = rect;
            self.mainTableVeiw.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        } completion:^(BOOL finished) {
            sectionHeaderHeight = 40;
            [self.mainTableVeiw reloadData];
        }];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
