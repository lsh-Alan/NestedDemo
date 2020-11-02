//
//  LTableView.m
//  fawefafe
//
//  Created by 刘少华 on 2020/10/27.
//

#import "LTableView.h"

@implementation LTableView

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
//{
//    NSLog(@"========😂😂😂😂😂========%@",self);
//    return NO;
//}


//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
//{
//    NSLog(@"========😂😂😂😂😂========%@",self);
//    return NO;
//}
//
//// called before touchesBegan:withEvent: is called on the gesture recognizer for a new touch. return NO to prevent the gesture recognizer from seeing this touch
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
//{
//    NSLog(@"========😂😂😂😂😂========%@",self);
//    return YES;
//}


//// called once before either -gestureRecognizer:shouldReceiveTouch: or -gestureRecognizer:shouldReceivePress:
//// return NO to prevent the gesture recognizer from seeing this event
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveEvent:(UIEvent *)event
//{
//    NSLog(@"========😂😂😂😂😂========%@",self);
//    return YES;
//}
//
//
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
//{
//    NSLog(@"========😂😂😂😂😂========%@",self);
//    return YES;
//}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    
   
   
    return self.isSupportMultyGes;
}


@end
