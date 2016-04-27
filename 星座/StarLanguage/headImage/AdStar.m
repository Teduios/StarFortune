//
//  AdStar.m
//  星座
//
//  Created by tarena030 on 16/3/19.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "AdStar.h"
#import "AdStarImageView.h"

typedef enum
{
    RIGHT,
    LEFT
}NEXT_TYPE;



@interface AdStar()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)AdStarImageView *leftImageView;
@property(nonatomic,strong)AdStarImageView *centerImageView;
@property(nonatomic,strong)AdStarImageView *rightImageView;
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,strong)NSArray *allImages;
@property(nonatomic,assign)NSInteger imageCount;
@property(nonatomic,assign)NSInteger currentImageIndex;

@end

@implementation AdStar

#pragma mark --初始化
-(id)initWithFrame:(CGRect)frame Images:(NSArray *)images Title:(NSArray *)titles
{
    if(self = [super initWithFrame:frame])
    {
        self.allImages = images;
        self.imageCount = self.allImages.count;
        self.currentImageIndex = 0;
        
        [self setupScrollView];
        [self setupImageViews];
        [self setupPageControl];
        [self setupDefaultImage];
        
    }
    return self;
}

#pragma mark -- 设置scrollView
-(void)setupScrollView
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    [self addSubview:_scrollView];
    
    //设置代理
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(kWinW*3, self.bounds.size.height);
    //设置当前显示的位置在中间图片
    self.scrollView.contentOffset = CGPointMake(kWinW, 0);
    
    //设置分页
    self.scrollView.pagingEnabled = YES;
    //去掉水平滚动
    self.scrollView.showsHorizontalScrollIndicator = NO;
    //边缘不弹跳
    self.scrollView.bounces = NO;
    
}

#pragma mark -- 设置左中右imageView
-(void)setupImageViews
{
    self.leftImageView = [[AdStarImageView alloc]initWithFrame:CGRectMake(0, 0, kWinW, kWinH)];
    [self.scrollView addSubview:self.leftImageView];
    
    self.centerImageView = [[AdStarImageView alloc]initWithFrame:CGRectMake(kWinW, 0, kWinW, kWinH)];
    
    //给图片添加点中事件
    __weak id safeSelf = self;
    // 实现block
    [self.centerImageView addTapListenter:^{
         //点中事件的方法
        [safeSelf tapImage];
        
    }];
    [self.scrollView addSubview:self.centerImageView];
    
    self.rightImageView = [[AdStarImageView alloc]initWithFrame:CGRectMake(kWinW*2, 0, kWinW, kWinH)];
    [self.scrollView addSubview:self.rightImageView];
}

#pragma mark -- 设置PageControl
-(void)setupPageControl
{
    self.pageControl = [[UIPageControl alloc]init];
    CGSize size = [self.pageControl sizeForNumberOfPages:self.imageCount];
    self.pageControl.frame = CGRectMake(0, 0, size.width, size.height);
    self.pageControl.center = CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height - 20);
    
    //设置颜色
    self.pageControl.pageIndicatorTintColor = [UIColor colorWithRed:193/255.0 green:219/255.0 blue:249/255.0 alpha:1];
    //设置总页数
    self.pageControl.numberOfPages = self.imageCount;
    [self addSubview:self.pageControl];
}

#pragma mark -- 给左中右imageView赋值图片
-(void)setupDefaultImage
{
    self.leftImageView.image = [UIImage imageNamed:self.allImages[self.imageCount-1]];
    self.centerImageView.image = [UIImage imageNamed:self.allImages[0]];
    self.rightImageView.image = [UIImage imageNamed:self.allImages[1]];
    //记录当前页面
    self.currentImageIndex = 0;
    self.pageControl.currentPage = self.currentImageIndex;
}

//点中图片
#pragma mark -- 给代理方发生消息
-(void)tapImage
{
    if(self.delegate != nil)
    {
        [self.delegate AdStar:self didSeletorAtIndex:self.currentImageIndex];
    }
}

//滚动已经停止
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //根据滑动处理左右图片
    [self reloadImage];
    //位置移动回到中间
    self.scrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
    //修改分页控制上的小圆点
    self.pageControl.currentPage = self.currentImageIndex;
}
#pragma mark -- 根据下标更新图片
-(void)reloadImage
{
    CGPoint offset = self.scrollView.contentOffset;
    if(offset.x > self.bounds.size.width)
    {
        self.currentImageIndex = [self computerNextIndex:self.currentImageIndex nextType:RIGHT];
    }
    else if(offset.x <self.bounds.size.width)
    {
       self.currentImageIndex = [self computerNextIndex:self.currentImageIndex nextType:LEFT];
    }
    self.centerImageView.image = [UIImage imageNamed:self.allImages[self.currentImageIndex]];
    self.rightImageView.image = [UIImage imageNamed:self.allImages[[self computerNextIndex:self.currentImageIndex nextType:RIGHT]]];
    self.leftImageView.image = [UIImage imageNamed:self.allImages[[self computerNextIndex:self.currentImageIndex nextType:LEFT]]];
    
}


-(NSInteger)computerNextIndex:(NSInteger)currentIndex nextType:(NEXT_TYPE)type
{
    switch (type) {
        case RIGHT:
            return ++currentIndex > self.imageCount -1?0:currentIndex;
            case LEFT:
            return --currentIndex <0 ?self.imageCount-1:currentIndex;
    }
}







@end
