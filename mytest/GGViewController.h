//
//  GGViewController.h
//  mytest
//
//  Created by HalloWorld on 14-1-6.
//  Copyright (c) 2014年 Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGViewController : UIViewController

//self.view已经存在，此函数初始化(alloc)subview，
- (void)loadSubviews;

//仅在此函数中调整各个view在横竖屏中的不同位置，如果只支持一个方向，那么可以省略重写此方法
- (void)willRotateToPortrait:(BOOL)isPortrait;

@end
