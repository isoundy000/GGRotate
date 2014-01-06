//
//  GGViewController.m
//  mytest
//
//  Created by HalloWorld on 14-1-6.
//  Copyright (c) 2014年 Jackson. All rights reserved.
//

#import "GGViewController.h"
#import "UIView+Orientation.h"

@interface GGViewController ()

@end

@implementation GGViewController

//* 此函数不能和init 和 loadView共用，只能选择其中一种方式
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self loadSubviews];
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        self.view = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height)] autorelease];
        [self loadSubviews];
        
    }
    return self;
}

- (void)layoutOrientation
{
    UIDeviceOrientation vOri = [[UIDevice currentDevice] orientation];
    if (vOri != UIDeviceOrientationUnknown) {
        [self willRotateToPortrait:UIInterfaceOrientationIsPortrait(vOri)];
    }
}

- (void)loadView
{
    [super loadView];
    self.view = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height)] autorelease];
    [self loadSubviews];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadSubviews {
    UIView * vView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 100, 200)];
    vView.backgroundColor = [UIColor blueColor];
    [vView setLFrame:CGRectMake(5, 5, 200, 100)];
    [vView setPFrame:CGRectMake(5, 5, 100, 200)];
    [self.view addSubview:vView];
    [vView release];
}


#pragma mark - 旋转  －－  低于IOS6.0版本

// 是否允许横竖屏切换
- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    //支持所有的横竖屏幕
    return YES;
}


#pragma mark - 旋转 －－ 不低于IOS6.0版本

- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

#pragma mark - 屏幕真被旋转的时候调用

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    // 这里的时候需要设置一下当前的终端的横竖屏状态
    [self willRotateToPortrait:UIInterfaceOrientationIsPortrait(toInterfaceOrientation)];
}

//此函数调整各个view在横竖屏中的不同位置
- (void)willRotateToPortrait:(BOOL)isPortrait {
    for (id subview in [self.view subviews]) {
        if ([subview respondsToSelector:@selector(resetOrientation:)]) {
            [subview resetOrientation:isPortrait];
        }
    }
}

- (void)dealloc {
    [super dealloc];
}

@end
