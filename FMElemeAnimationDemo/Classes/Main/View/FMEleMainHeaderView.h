//
//  FMEleMainHeaderView.h
//  FMElemeAnimationDemo
//
//  Created by fm on 2017/5/8.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMEleMainHeaderInfoView.h"

#define H_header_view 150.f

@interface FMEleMainHeaderView : UIView

@property (nonatomic, strong) FMEleMainHeaderInfoView *infoView;

- (void)updateHeaderView;

@end
