//
//  GridViewController.m
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 6/26/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import "GridViewController.h"
#import "JSONKit.h"

#define HomeCellID @"IMG_CELL_ID"


@interface GridViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>


@end

@implementation GridViewController
@synthesize myWebView;
@synthesize dataList;

int phoneType = 0;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Home Banner Web View
    NSURL *myURL = [NSURL URLWithString:@"http://aurumplanet.com/~1artist1week/phonecasefree/topslider/index.html"];
	NSURLRequest *myURLReq = [NSURLRequest requestWithURL:myURL];
    [myWebView loadRequest:myURLReq];
    
    //CollectionView Cell data load
	dataList = [[NSMutableArray alloc] init];
	
	UINib* nib = [UINib nibWithNibName:@"Cell" bundle:nil];
	[self.collectionView registerNib:nib forCellWithReuseIdentifier:HomeCellID];
	
    //Update products to selected phonetype
	[self updateData];
}

//Home Tab Change
- (void)updateData
{
	[self.dataList removeAllObjects];
    
    NSMutableArray *iPhone5List = [[NSMutableArray alloc] init];
    
    NSString *jsonURL = @"http://aurumplanet.com/~1artist1week/phonecasefree/get_productlistsByPhonetype.php";
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:jsonURL]];
    
    JSONDecoder *jsonKitDecoder = [JSONDecoder decoder];
    NSArray *items = [jsonKitDecoder parseJSONData:jsonData];
    
	// CellImage
    switch (phoneType) {
        case 0:
            for (NSDictionary *products in items) {
                NSString *previewURL = (@"http://dm01-ut1950.ktics.co.kr/%@_thumb_iphone5.jpg", [products objectForKey:@"imagename"]);
                NSString *str1 = @"http://dm01-ut1950.ktics.co.kr/";
                NSString *str2 = [products objectForKey:@"imagename"];
                NSString *str3 = @"_thumb_iphone5.jpg";
                NSString *preivewURL = [NSString stringWithFormat:@"%@%@%@",str1,str2,str3];
                NSURL *imageURL  = [NSURL URLWithString:preivewURL];
                NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                UIImage *iPhone5Img = [UIImage imageWithData:imageData];
                [iPhone5List addObject:iPhone5Img];
            }
            [self.dataList addObject:iPhone5List];
            break;
    }
    
	[self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return [self.dataList count];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return [self.dataList[section] count];
}


- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	// 재사용 큐에 셀을 가져온다
	UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:HomeCellID forIndexPath:indexPath];
	
	// 표시할 이미지 설정
	UIImageView* imgView = (UIImageView*)[cell.contentView viewWithTag:100];
	if (imgView) imgView.image = self.dataList[indexPath.section][indexPath.row];
	
	return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize returnValue = CGSizeMake(120, 160);
    return returnValue;
}

- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 30, 10, 30);
}

@end
