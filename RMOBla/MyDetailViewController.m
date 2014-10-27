//
//  MyDetailViewController.m
//  RMOBla
//
//  Created by Alexis Bastide on 27/10/14.
//  Copyright (c) 2014 Steed. All rights reserved.
//

#import "MyDetailViewController.h"

@interface MyDetailViewController () <SwipeViewDataSource, SwipeViewDelegate>

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation MyDetailViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view from its nib.
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

- (void)awakeFromNib
{
    //set up data
    //your swipeView should always be driven by an array of
    //data of some kind - don't store data in your item views
    //or the recycling mechanism will destroy your data once
    //your item views move off-screen
    self.items = [NSMutableArray array];
    for (int i = 0; i < 100; i++)
    {
        [_items addObject:@(i)];
    }
}

- (void)dealloc
{
    //it's a good idea to set these to nil here to avoid
    //sending messages to a deallocated viewcontroller
    //this is true even if your project is using ARC, unless
    //you are targeting iOS 5 as a minimum deployment target
    _swipeView.delegate = nil;
    _swipeView.dataSource = nil;
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //configure swipeView
    _swipeView.pagingEnabled = YES;
    
    
    self.items = [NSMutableArray array];
    for (int i = 0; i < 100; i++)
    {
        [_items addObject:@(i)];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView
{
    //return the total number of items in the carousel
    return _imageData.count;
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    NSLog(@"viewForItemAtIndex %@", @(index));
    
    UIImageView *imageView = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        //don't do anything specific to the index within
        //this `if (view == nil) {...}` statement because the view will be
        //recycled and used with other index values later
        view = [[UIView alloc] initWithFrame:self.swipeView.bounds];
        view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        imageView = [[UIImageView alloc] initWithFrame:self.swipeView.bounds];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.backgroundColor = [UIColor greenColor];
        imageView.tag = 1;
        imageView.image = [_imageData objectAtIndex:index];
        
        [view addSubview:imageView];
    }
    else
    {
        //get a reference to the label in the recycled view
        imageView = (UIImageView *)[view viewWithTag:1];
        imageView.image = [_imageData objectAtIndex:index];
    }
    
    return view;
}

- (CGSize)swipeViewItemSize:(SwipeView *)swipeView
{
    NSLog(@"swipe w %@ h %@", @(self.swipeView.bounds.size.width), @(self.swipeView.bounds.size.height));
    NSLog(@"swipe center x %@ y %@", @(self.swipeView.center.x), @(self.swipeView.center.y));
    return self.swipeView.bounds.size;
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
