//
//  UIControl+ButtonLimit.m
//  DGButtonLimit
//
//  Created by 张一力 on 2016/11/22.
//  Copyright © 2016年 张一力DGCompany. All rights reserved.
//

#import "UIControl+ButtonLimit.h"
#import <objc/runtime.h>

@implementation UIControl (ButtonLimit)

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";
static const char *UIControl_ignoreEvent         = "UIControl_ignoreEvent";

- (NSTimeInterval)acceptEventInterval{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

- (void)setAcceptEventInterval:(NSTimeInterval)acceptEventInterval{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)ignoreEvent{
    return [objc_getAssociatedObject(self, UIControl_ignoreEvent) boolValue];
}

- (void)setIgnoreEvent:(BOOL)ignoreEvent{
    objc_setAssociatedObject(self, UIControl_ignoreEvent, @(ignoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)accept_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    if (self.ignoreEvent)return;
    
    if (self.acceptEventInterval > 0) {
        self.ignoreEvent         = YES;
        [self performSelector:@selector(setIgnoreEvent:) withObject:@(NO) afterDelay:self.acceptEventInterval];
    }
    [self accept_sendAction:action to:target forEvent:event];
}

+ (void)load{
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(accept_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}

@end
