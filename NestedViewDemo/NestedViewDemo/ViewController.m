//
//  ViewController.m
//  NestedViewDemo
//
//  Created by Alan on 2020/11/2.
//

#import "ViewController.h"
#import "LTableView.h"
#import "LView.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) LTableView *tableView;

@property (nonatomic, strong) LView *lview;

@property (nonatomic, assign) BOOL isScroll;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.view.backgroundColor = [UIColor grayColor];
    self.isScroll = YES;
    
    self.lview = [[LView alloc] initWithFrame:CGRectMake(0, 0, 375, 667 - 40)];
    self.lview.backgroundColor = [UIColor blackColor];
    
    self.lview.isScroll = NO;
    self.lview.tableView.isSupportMultyGes = NO;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 50)];
    view.backgroundColor = [UIColor yellowColor];
    self.tableView.tableHeaderView = view;
       
    [self.view addSubview:self.tableView];
    
    //监听顶部滑动视图
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeScrollState) name:@"changeScrollState" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollToBottom) name:@"scrollToBottom" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollToTop) name:@"scrollToTop" object:nil];
    
}

- (void)changeScrollState
{
    self.isScroll = YES;
    self.tableView.scrollEnabled = YES;
    self.lview.isScroll = NO;
    self.lview.tableView.isSupportMultyGes = NO;
}

//顶部滑动视图滑动底部时，关闭可滑动
- (void)scrollToBottom
{
    self.tableView.scrollEnabled = NO;
}

- (void)scrollToTop
{
    self.tableView.scrollEnabled = YES;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cellID"];
    }
    
    
    [cell.contentView addSubview:self.lview.tableView];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 40.f)];
    view.backgroundColor = [UIColor grayColor];
    return view;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    static CGFloat lastOffsetY = 0;
    
    //判断临界点时滚动方向
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (self.isScroll) {
       
        if (offsetY < 50) {
            self.lview.isScroll = NO;
            self.lview.tableView.isSupportMultyGes = NO;
            [self.lview.tableView setContentOffset:CGPointZero];
            
        }else if (offsetY == 50) {//处理临界点
            if (lastOffsetY < offsetY) {//上拉
                self.lview.isScroll = NO;
                self.lview.tableView.isSupportMultyGes = NO;
                [self.lview.tableView setContentOffset:CGPointZero];
            }else{//下拉
                self.lview.isScroll = NO;
                self.lview.tableView.isSupportMultyGes = NO;
                [self.lview.tableView setContentOffset:CGPointZero];
            }
        }else{
            self.isScroll = NO;
            [self.tableView setContentOffset:CGPointMake(0, 50)];
            
            self.lview.isScroll = YES;
            self.lview.tableView.isSupportMultyGes = YES;
        }
    }else{
        self.tableView.contentOffset =  CGPointMake(0, 50);
    }
    
    lastOffsetY = offsetY;
}


- (LTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[LTableView alloc] initWithFrame:CGRectMake(0, 100, 375, 667) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor redColor];
    
        _tableView.rowHeight = 667 - 40;
        _tableView.isSupportMultyGes = YES;
        
    }
    return _tableView;
}



@end
