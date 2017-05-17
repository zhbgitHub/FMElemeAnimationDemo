//
//  FMEleMainSmallImgView.m
//  FMElemeAnimationDemo
//
//  Created by fm on 2017/5/16.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "FMEleMainSmallImgView.h"

@interface FMEleMainSmallImgView()

//@property (nonatomic ,strong) UILabel *desLabel;
@property (nonatomic, strong, readwrite) UIControl *contentImgView;
@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *desTextLabel;
@property (nonatomic, strong) UIButton *addBtn;

@end

@implementation FMEleMainSmallImgView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
//        [self addSubview:self.desLabel];
        [self addSubview:self.contentImgView];
        self.layer.cornerRadius = 10.f;
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)updateConstraints
{
    WS(weakSelf);
    CGFloat H = self.frame.size.height;
//    [self.desLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.and.top.and.right.equalTo(weakSelf);
//        make.height.mas_equalTo(H*0.1);
//    }];
    [self.contentImgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.equalTo(weakSelf);
//        make.top.equalTo(weakSelf.desLabel.mas_bottom);
        make.height.mas_equalTo(H*0.7);
    }];
    
    [super updateConstraints];
}

#pragma mark - Private methods
- (void)updateBottomViewConstraints
{
    WS(weakSelf);
    CGFloat H = self.frame.size.height;
    [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(weakSelf.contentImgView);
        make.top.equalTo(weakSelf.contentImgView.mas_bottom);
        make.height.mas_equalTo(H*0.3);
    }];
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bottomView).offset(10.f);
        make.top.equalTo(weakSelf.bottomView).offset(10.f);
    }];
    [self.desTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bottomView).offset(10.f);
        make.top.equalTo(weakSelf.titleLabel.mas_bottom).offset(10.f);
    }];
    
    [self.addBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.bottomView).offset(-10.f);
        make.bottom.equalTo(weakSelf.bottomView).offset(-10.f);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
}

- (void)drawCorner:(UIView *)view cornerDirection:(UIRectCorner)rectCorner
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:view.frame byRoundingCorners:rectCorner cornerRadii:CGSizeMake(10.0f, 10.0f)];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.bounds = view.frame;
    layer.position = view.center;
    layer.path = path.CGPath;
    view.layer.mask = layer;
}

#pragma mark - Public methods
- (void)setContentImage:(UIView *)image
{
    WS(weakSelf);
    [self.contentImgView addSubview:image];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.contentImgView);
    }];
}

//- (void)setDesTitle:(NSString *)des
//{
//    self.desLabel.text = des;
//}

//- (void)setDesAlpha:(CGFloat)alpha
//{
//    if (alpha > 1) {
//        alpha = 1;
//    }
//    self.desLabel.alpha = alpha;
//}

- (void)setBottomContent
{
    [self addSubview:self.bottomView];
    [self.bottomView addSubview:self.titleLabel];
    [self.bottomView addSubview:self.desTextLabel];
    [self.bottomView addSubview:self.addBtn];
    
    [self updateBottomViewConstraints];
    
    self.titleLabel.text = @"香辣鸡腿堡";
    self.desTextLabel.text = @"劲辣、香脆可口，略略略";
    
    [self updateBottomViewConstraints];
}

#pragma mark - Evevnts
- (void)addChartAction:(UIButton *)sender
{
    NSLog(@"add chart");
}

#pragma mark - getter & setter
//- (UILabel *)desLabel
//{
//    if (!_desLabel) {
//        _desLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        _desLabel.backgroundColor = [UIColor clearColor];
//        _desLabel.textColor = [UIColor whiteColor];
//        _desLabel.textAlignment = NSTextAlignmentCenter;
//        _desLabel.font = [UIFont systemFontOfSize:14.f];
//        _desLabel.numberOfLines = 1;
//    }
//    return _desLabel;
//}

- (UIControl *)contentImgView
{
    if (!_contentImgView) {
        _contentImgView = [[UIControl alloc] initWithFrame:CGRectZero];
        _contentImgView.backgroundColor = [UIColor clearColor];
    }
    return _contentImgView;
}

- (UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectZero];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:16.f];
    }
    return _titleLabel;
}

- (UILabel *)desTextLabel
{
    if (!_desTextLabel) {
        _desTextLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _desTextLabel.textColor = [UIColor grayColor];
        _desTextLabel.font = [UIFont systemFontOfSize:14.f];
    }
    return _desTextLabel;
}

- (UIButton *)addBtn
{
    if (!_addBtn) {
        _addBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        _addBtn.backgroundColor = [UIColor blueColor];
        _addBtn.layer.cornerRadius = 15.f;
        _addBtn.clipsToBounds = YES;
        [_addBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
        _addBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _addBtn.titleLabel.font = [UIFont systemFontOfSize:15.f];
        [_addBtn addTarget:self action:@selector(addChartAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addBtn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
