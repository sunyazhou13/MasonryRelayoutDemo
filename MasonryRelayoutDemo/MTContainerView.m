//
//  MTContainerView.m
//  MasonryRelayoutDemo
//
//  Created by sunyazhou on 2024/3/24.
//

#import "MTContainerView.h"
#import <Masonry/Masonry.h>

const CGSize MTContainerSize = { 40 , 40};

@interface MTContainerView ()

@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;

@end

@implementation MTContainerView

#pragma mark -
#pragma mark - private methods 私有方法
- (void)layoutAllEntryViewsIfNeeded
{
    NSSortDescriptor *ascendingSort = [[NSSortDescriptor alloc] initWithKey:@"tag" ascending:YES];
    NSArray <UIView *> *allEntries = [[self subviews] sortedArrayUsingDescriptors:[NSArray arrayWithObject:ascendingSort]];
    if (allEntries.count == 0) { return; }
    if (allEntries.count == 1) {
        UIView *entryView = [allEntries objectAtIndex:0];
        [entryView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(MTContainerSize);
            make.right.equalTo(self.mas_right).offset(-10);
            make.centerY.equalTo(self.mas_centerY);
        }];
    } else {
        // 使用 mas_distributeViewsAlongAxis 方法对三个视图进行水平右对齐并一次排开
        [allEntries mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(MTContainerSize);
            make.centerY.equalTo(self.mas_centerY);
        }];
        //必须 allEntries.count >= 2 才能用下述方法, 下面间距算法 容器宽度-所用容量宽度(包含右侧间隙+每个item大小+每个item之间的间隙)
        CGFloat leadSpace = CGRectGetWidth(self.frame) - allEntries.count * MTContainerSize.width - 10 - (allEntries.count - 1) * 10;
        [allEntries mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:leadSpace tailSpacing:10];
    }
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
    }];
}

- (UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}

#pragma mark -
#pragma mark - public methods 公有方法
- (void)showView1
{
    if (self.view1 == nil) {
        self.view1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(UIScreen.mainScreen.bounds), 20, MTContainerSize.width, MTContainerSize.height)];
        self.view1.backgroundColor = [self randomColor];
        self.view1.tag = MTContainerViewPriorityL1;
    }
    if (self.view1.superview == nil) {
        [self addSubview:self.view1];
    }
    [self layoutAllEntryViewsIfNeeded];
}

- (void)dismissView1
{
    if (self.view1.superview) {
        [self.view1 removeFromSuperview];
    }
    self.view1 = nil;
    [self layoutAllEntryViewsIfNeeded];
}

- (void)showView2
{
    if (self.view2 == nil) {
        self.view2 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(UIScreen.mainScreen.bounds), 20, MTContainerSize.width, MTContainerSize.height)];
        self.view2.backgroundColor = [self randomColor];
        self.view2.tag = MTContainerViewPriorityL2;
    }
    if (self.view2.superview == nil) {
        [self addSubview:self.view2];
    }
    [self layoutAllEntryViewsIfNeeded];
}

- (void)dimissView2
{
    if (self.view2.superview) {
        [self.view2 removeFromSuperview];
    }
    self.view2 = nil;
    [self layoutAllEntryViewsIfNeeded];
}

- (void)showView3
{
    if (self.view3 == nil) {
        self.view3 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(UIScreen.mainScreen.bounds), 20, MTContainerSize.width, MTContainerSize.height)];
        self.view3.backgroundColor = [self randomColor];
        self.view3.tag = MTContainerViewPriorityL3;
    }
    if (self.view3.superview == nil) {
        [self addSubview:self.view3];
    }
    [self layoutAllEntryViewsIfNeeded];
}

- (void)dismissView3
{
    if (self.view3.superview) {
        [self.view3 removeFromSuperview];
    }
    self.view3 = nil;
    [self layoutAllEntryViewsIfNeeded];
}
 
@end
