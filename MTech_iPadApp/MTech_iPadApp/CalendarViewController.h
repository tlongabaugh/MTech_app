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

@interface CalendarViewController : UIViewController <UIWebViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (strong, nonatomic) NSArray *studioNames;
@property (weak, nonatomic) IBOutlet UIPickerView *studioPicker;
@property (weak, nonatomic) IBOutlet UILabel *internetLabel;


/* Creates a UIWebView to hold a calendar */
- (UIWebView*)createUIWebViewWithString:(NSURL*)url
                               withSize:(CGSize)size;

/* Refreshes each calendar UIWebView so that the calendars 
 * update with new events */
-(void)refreshCalendars:(NSTimer *)timer;

/* Check if the internet is on and reachable from the iOS device */
-(BOOL)checkInternetReachibility;

/* Reloads the content when the app is reopened from the home screen*/
- (void)willEnterForeground;


@end

