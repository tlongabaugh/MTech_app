//
//  MTechCalViewController.h
//  MTech_iPadApp
//
//  Created by Tom Longabaugh on 3/23/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//
//  Modified from http://fernandasportfolio.tumblr.com

#import <UIKit/UIKit.h>

@protocol MTechCalViewControllerProtocol <NSObject>
@required
- (void)arrayUpdatedWithAllEvents:(NSMutableArray *)arrayUpdated;
@end

@interface MTechCalViewController : UIViewController

@property (nonatomic, strong) id <MTechCalViewControllerProtocol> protocol;
@property (nonatomic, strong) NSMutableArray *arrayWithEvents;

@end
