//
//  LView.m
//  fawefafe
//
//  Created by 刘少华 on 2020/10/27.
//

#import "LView.h"


@interface LView ()<UITableViewDelegate,UITableViewDataSource>




@end

@implementation LView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView.frame = self.bounds;
        [self addSubview:self.tableView];
    }
    return self;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cellID"];
        
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    scrollView.alwaysBounceVertical = YES;
    //判断临界点时滚动方向
    static CGFloat lastOffsetY = 0;
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (self.isScroll) {
        self.tableView.isSupportMultyGes = YES;
        if (offsetY <= 0) {
            if (lastOffsetY < offsetY) {//上拉
            }else{//下拉
                [self.tableView setContentOffset:CGPointMake(0, 0)];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"changeScrollState" object:nil userInfo:nil];
            }
        }

        CGFloat contentHeight = self.tableView.contentSize.height;
        
        //子滚动视图滑到底部 若要实现子视图的弹性效果 需要关闭父视图的scrollEnabled.
        //即将滑动到底部时发出通知给父视图 父视图去关闭交互 xx.scrollEnabled = NO;
        //其他的情况需要打开父视图的交互                xx.scrollEnabled = YES;
        if (offsetY >= contentHeight - CGRectGetHeight(self.tableView.frame)) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"scrollToBottom" object:nil userInfo:nil];
        }else{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"scrollToTop" object:nil userInfo:nil];
        }
    }else{
        [self.tableView setContentOffset:CGPointMake(0, 0)];
    }

    lastOffsetY = offsetY;
}

- (LTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[LTableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 40;
        _tableView.backgroundColor = [UIColor greenColor];
        _tableView.alwaysBounceVertical = YES;
        
    }
    return _tableView;
}



@end

