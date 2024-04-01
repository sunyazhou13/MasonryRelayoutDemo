//
//  ViewController.m
//  MasonryRelayoutDemo
//
//  Created by sunyazhou on 2024/3/24.
//

#import "ViewController.h"
#import "MTContainerView.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@property (nonatomic, strong) MTContainerView *continerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.continerView = [[MTContainerView alloc] initWithFrame:CGRectZero];
    self.continerView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.continerView];
    
    [self.continerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.mas_equalTo(self.mas_topLayoutGuideBottom);
        make.height.equalTo(@60);
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.continerView showView3];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.continerView showView1];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.continerView showView2];
    });
}


@end
