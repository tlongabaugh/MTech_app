//
//  CalendarViewController.h
//  MTech_iPadApp
//
//  Created by Tom Longabaugh on 2/11/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFCalendar.h"
#import "MTechCalViewController.h"

@interface CalendarViewController : UIViewController

/* Initializes and sets up the calendar component */
- (void)displayFFCalendar;

/* Creates an array to store calendar events */
- (NSMutableArray *)arrayWithEvents;

@end

