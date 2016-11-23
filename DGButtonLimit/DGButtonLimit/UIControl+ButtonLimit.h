//
//  UIControl+ButtonLimit.h
//  DGButtonLimit
//
//  Created by 张一力 on 2016/11/22.
//  Copyright © 2016年 张一力DGCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (ButtonLimit)
//button按钮点击时间间隔
@property(nonatomic,assign)NSTimeInterval acceptEventInterval;
@property(nonatomic,assign)BOOL           ignoreEvent;

@end

