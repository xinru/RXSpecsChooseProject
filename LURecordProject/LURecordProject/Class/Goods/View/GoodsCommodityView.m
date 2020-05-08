//
//  MemberCenterCommodityView.m
//  DookayProject
//
//  Created by 褚平欧 on 2018/11/12.
//  Copyright © 2018 Dookay. All rights reserved.
//

#import "GoodsCommodityView.h"

#import "CommodityCell.h"


@interface GoodsCommodityView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic , strong) UICollectionView * collection;

//@property (nonatomic , strong) NSString * title;
@property (nonatomic , assign) BOOL showLimit;
@property (nonatomic ,   copy) CenterCommodityHeightBlock heightBlock;
@property (nonatomic ,   copy) CenterCommodityLoadMoreBlock loadMore;
@property (nonatomic , strong) UILabel * bottomL;

@end

@implementation GoodsCommodityView

-(UICollectionView *)collection
{
    if (_collection == nil) {
        WS(weakSelf);
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        if (_showLimit) {
            layout.sectionInset = UIEdgeInsetsMake(15*ScaleX, 20*ScaleX, 15*ScaleX, 20*ScaleX);
            layout.itemSize = CGSizeMake(100*ScaleX, 180*ScaleX);
            layout.minimumLineSpacing = 10*ScaleX;
            layout.minimumInteritemSpacing = 4*ScaleX;
        }else{
            layout.sectionInset = UIEdgeInsetsMake(15*ScaleX, 5*ScaleX, 15*ScaleX, 5*ScaleX);
            layout.itemSize = CGSizeMake(180*ScaleX, 265*ScaleX);
            layout.minimumLineSpacing = 10*ScaleX;
            layout.minimumInteritemSpacing = 4*ScaleX;
        }
        
        _collection = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collection.delegate = self;
        _collection.dataSource = self;
//        _collection.scrollEnabled = NO;
        _collection.bounces = NO;
        _collection.backgroundColor = [UIColor whiteColor];
        [_collection registerClass:[CommodityCell class]
        forCellWithReuseIdentifier:@"MemberCenterGoodCell"];

        _collection.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
            weakSelf.loadMore();
        }];
    }
    return _collection;
}

-(instancetype)initWithShowLimit:(BOOL)show heightBlock:(CenterCommodityHeightBlock)height loadMore:(CenterCommodityLoadMoreBlock)more
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
//        self.title = title;
        self.showLimit = show;
        self.heightBlock = height;
        self.loadMore = more;
        [self createSubView];
    }
    return self;
}

-(void)setData:(NSArray *)data
{
    _data = data;
    
    NSInteger lineCount = (data.count/3+data.count%3);
    CGFloat height = lineCount*180*ScaleX+lineCount*20*ScaleX;
    self.frame = CGRectMake(0, 0, mainWidth, height);
    NSLog(@"self:%@",self);
    self.collection.frame = CGRectMake(0, 0, mainWidth, height);
    [self addSubview:self.collection];
    [self.collection reloadData];
    
    
    [self layoutIfNeeded];
    
    self.heightBlock(height);
}

- (void)createSubView
{
//    UILabel * titleL = [MyTool labelWithFont:[MyTool semiboldFontWithSize:14*ScaleX] text:_title textColor:kBlackColor];
//    titleL.frame = CGRectMake(20*ScaleX, 20*ScaleX, mainWidth-40*ScaleX, 20*ScaleX);
//    [self addSubview:titleL];
    _data = [NSArray array];
    self.collection.frame = CGRectMake(0, 0, mainWidth, 0);
    
    _bottomL = [MyTool labelWithFont:[MyTool regularFontWithSize:14*ScaleX] text:@"没有更多了~" textColor:[UIColor grayColor]];
    _bottomL.textAlignment = NSTextAlignmentCenter;
    _bottomL.backgroundColor = [UIColor whiteColor];
}

-(void)removeLoadMore
{
    self.collection.mj_footer = nil;
    
    _bottomL.frame = CGRectMake(0, self.collection.height -30*ScaleX, mainWidth, 20*ScaleX);
    [self.collection addSubview:_bottomL];
}

#pragma mark -- UICollectionViewDelegate,UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"_data:%@",_data);
    return _data.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CommodityCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MemberCenterGoodCell" forIndexPath:indexPath];
  
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [DKJumpManager pushToGoodsDetailVCWithNavgationVC:nil
                                              goodsID:@""];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
