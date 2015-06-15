//
//  RootViewController.h
//  MTech_iPadApp
//
//  Created by Tom Longabaugh on 3/5/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITabBarController

-(void)setCalendarEnabled:(BOOL)enabled forCalNum: (int)calNum;

-(BOOL)getCalendarEnabledForCalNum:(int)calNum;
@end
