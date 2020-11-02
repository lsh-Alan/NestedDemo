//
//  LView.h
//  fawefafe
//
//  Created by 刘少华 on 2020/10/27.
//

#import <UIKit/UIKit.h>
#import "LTableView.h"
NS_ASSUME_NONNULL_BEGIN

@interface LView : UIView

@property (nonatomic, strong) LTableView *tableView;

@property (nonatomic, assign) BOOL isScroll;

@end

NS_ASSUME_NONNULL_END
