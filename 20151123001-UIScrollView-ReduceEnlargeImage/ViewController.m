//
//  ViewController.m
//  20151123001-UIScrollView-ReduceEnlargeImage
//
//  Created by Rainer on 15/11/23.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;
@property (weak, nonatomic) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置内容尺寸
    self.imageScrollView.contentSize = CGSizeMake(892, 632);
    // 设置垂直方向滚动条不可见
    self.imageScrollView.showsHorizontalScrollIndicator = NO;
    // 设置水平方向滚动条不可见
    self.imageScrollView.showsVerticalScrollIndicator = NO;
    // 设置偏移量
    self.imageScrollView.contentOffset = CGPointMake(426, 100);
    // 设置最大缩放比例
    self.imageScrollView.maximumZoomScale = 2.0;
    // 设置最小缩放比例
    self.imageScrollView.minimumZoomScale = 0.5;
    // 设置弹簧效果
    self.imageScrollView.bounces = NO;
    // 设置代理
    self.imageScrollView.delegate = self;
    
    // 创建一个图片试图添加到滚动试图中
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 892, 632)];
    imageView.image = [UIImage imageNamed:@"minion"];
    self.imageView = imageView;
    [self.imageScrollView addSubview:self.imageView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.center = self.view.center;
    [button addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark - 按钮点击事件处理
/**
 *  加号按钮事件处理
 */
- (void)buttonClickAction:(UIButton *)button {
    // 获取当前scrollView的偏移量，更改并重新赋值
    CGPoint point = self.imageScrollView.contentOffset;
    point.x += 20;
    point.y += 20;
    self.imageScrollView.contentOffset = point;
}

#pragma mark - 滚动试图代理方法
/**
 *  实现代理，返回要缩放的试图
 */
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

#pragma mark - 属性懒加载
/**
 *  图像试图懒加载方法
 */
//- (UIImageView *)imageView {
//    if (nil == _imageView) {
//        // 创建一个图像试图
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"minion"]];
//        // 让图像试图根据图片自动调整大小
//        [self.imageView sizeToFit];
//        self.imageView = imageView;
//        // 把图像试图添加到滚动试图上
//        [self.imageScrollView addSubview:self.imageView];
//    }
//    
//    return _imageView;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
