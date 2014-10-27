//
//  MyDetailViewController.h
//  RMOBla
//
//  Created by Alexis Bastide on 27/10/14.
//  Copyright (c) 2014 Steed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwipeView.h"

@interface MyDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet SwipeView *swipeView;
@property (weak, nonatomic) NSArray *imageData;

@end
