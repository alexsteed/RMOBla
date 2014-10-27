//
//  MyCollectionViewController.m
//  RMOBla
//
//  Created by Alexis Bastide on 27/10/14.
//  Copyright (c) 2014 Steed. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "MyCollectionViewController.h"
#import "MyDetailViewController.h"

@interface MyCollectionViewController ()  <UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *imageData;

@end

@implementation MyCollectionViewController

#pragma mark - View events

- (void)viewDidLoad
{
    // Setting cell
    UINib *cellNib = [UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cell"];
    
    RFQuiltLayout* layout = (id)[self.collectionView collectionViewLayout];
    layout.direction = UICollectionViewScrollDirectionVertical;
    
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    layout.blockPixels = CGSizeMake(screenSize.size.width / 3, screenSize.size.width / 3);
    
    [self initData];
    [self.collectionView reloadData];
}

- (void)initData
{
    self.imageData = [[NSMutableArray alloc] init];
    [_imageData addObject:[UIImage imageNamed:@"cat2.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat1.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat2.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat3.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat4.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat5.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat2.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat1.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat2.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat3.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat4.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat5.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat2.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat1.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat2.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat3.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat4.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat5.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat2.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat1.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat2.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat3.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat4.jpg"]];
    [_imageData addObject:[UIImage imageNamed:@"cat5.jpg"]];
}

- (void) viewDidAppear:(BOOL)animated
{
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"did select cell %@", @(indexPath.row));
    
    MyDetailViewController *detailView = [[MyDetailViewController alloc] init];
    detailView.view.bounds = self.view.frame;
    detailView.swipeView.currentItemIndex = indexPath.row;
    detailView.imageData = _imageData;
    [self.navigationController pushViewController:detailView animated:YES];
}

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"cell count %@", @(self.imageData.count));
    return self.imageData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    UICollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    imageView.image = [_imageData objectAtIndex:indexPath.row];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    return cell;
}

#pragma mark – RFQuiltLayoutDelegate

- (CGSize) blockSizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
        return CGSizeMake(2, 2);
    return CGSizeMake(1, 1);
}

- (UIEdgeInsets)insetsForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return UIEdgeInsetsMake(2, 2, 2, 2);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
