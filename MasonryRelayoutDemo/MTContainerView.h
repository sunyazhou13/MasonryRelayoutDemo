//
//  MTContainerView.h
//  MasonryRelayoutDemo
//
//  Created by sunyazhou on 2024/3/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, MTContainerViewPriority) {
    MTContainerViewPriorityL1 = 101,
    MTContainerViewPriorityL2 = 102,
    MTContainerViewPriorityL3 = 103,
    //more ...
};

@interface MTContainerView : UIView

- (void)showView1;
- (void)dismissView1;

- (void)showView2;
- (void)dimissView2;

- (void)showView3;
- (void)dismissView3;

@end

NS_ASSUME_NONNULL_END
