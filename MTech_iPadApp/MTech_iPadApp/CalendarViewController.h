//
//  CalendarViewController.h
//  MTech_iPadApp
//
//  Created by Tom Longabaugh on 2/11/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//
//  This class is the view controller for which contains the entire calendar
//  element. It corresponds to the tab bar calendar element.


#import <UIKit/UIKit.h>
#import "FFCalendar.h"
#import "MTechCalViewController.h"

@interface CalendarViewController : UIViewController <UIWebViewDelegate>

/* Initializes and sets up the calendar component */
- (void)displayFFCalendar;

/* Creates an array to store calendar events */
- (NSMutableArray *)arrayWithEvents;

/* Creates a UIWebView to hold a calendar */
- (UIWebView*)createUIWebViewWithString:(NSString*)urlString
                               withSize:(CGSize)size;
@end

