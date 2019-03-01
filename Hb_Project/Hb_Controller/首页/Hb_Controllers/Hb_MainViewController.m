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
    for(int i=0;i<100;i++)
    {
        NSString * name = [NSString stringWithFormat:@"%d",i];
        [dataSource addObject:name];
    }
    [self.mainTableVeiw registerNib:[UINib nibWithNibName:@"Hb_MainCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataSource count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Hb_MainCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[Hb_MainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSString * str = [dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = str;

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
