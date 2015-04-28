//
//  CalendarViewController.m
//  MTech_iPadApp
//
//  Created by Tom Longabaugh on 2/11/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import "CalendarViewController.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Get the size of the screen
    CGSize viewSize = self.view.frame.size;
    
    // Display the FFCalendar (this is no longer use
    //[self displayFFCalendar];
    
    
    /* Create the UIWebViews for the calendars */
    
    // Conference Room
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"conferenceRm" ofType:@"html" inDirectory:@"html"]];
    UIWebView *conferenceRmCal = [self createUIWebViewWithString:url withSize:viewSize];
    [self.view addSubview:conferenceRmCal];
    
    // Dolan
    url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"dolan" ofType:@"html" inDirectory:@"html"]];
    UIWebView *dolanCal = [self createUIWebViewWithString:url withSize:viewSize];
    [self.view addSubview:dolanCal];
    dolanCal.hidden = YES;
    
    // Research Lab
    url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"researchLab" ofType:@"html" inDirectory:@"html"]];
    UIWebView *researchLabCal = [self createUIWebViewWithString:url withSize:viewSize];
    [self.view addSubview:researchLabCal];
    researchLabCal.hidden = YES;
    
    // Buchla
    url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"buchla" ofType:@"html" inDirectory:@"html"]];
    UIWebView *buchlaCal = [self createUIWebViewWithString:url withSize:viewSize];
    [self.view addSubview:buchlaCal];
    buchlaCal.hidden = YES;
    
    // Study/Pantry
    url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"studyPantry" ofType:@"html" inDirectory:@"html"]];
    UIWebView *studyPantryCal = [self createUIWebViewWithString:url withSize:viewSize];
    [self.view addSubview:studyPantryCal];
    studyPantryCal.hidden = YES;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIWebView*)createUIWebViewWithString:(NSURL*)url
                               withSize:(CGSize)size
{
    // Get the size of the screen (CalendarViewController), alter it to size our UIWebView
    CGRect webSize = CGRectMake(0, 0, size.width-80, size.height-320);
    
    // Make the UIWebView, center it, turn off scroll bounce
    UIWebView *webView = [[UIWebView alloc] initWithFrame:webSize];
    [webView setCenter:CGPointMake(size.width/2, size.height/2 - 80)];
    webView.scrollView.bounces = NO;
    [webView loadRequest:[NSURLRequest requestWithURL:url]];

    return webView;
}

















/*
- (void)displayFFCalendar {
    
    MTechCalViewController *calendarVc = [MTechCalViewController new];
    [calendarVc setProtocol:self];
    [calendarVc setArrayWithEvents:[self arrayWithEvents]];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:calendarVc];
    navigationController.view.frame = CGRectMake(0., 0., self.view.frame.size.width, self.view.frame.size.height);
    
    [self addChildViewController:navigationController];
    [self.view addSubview:navigationController.view];
    [navigationController didMoveToParentViewController:self];
}

- (NSMutableArray *)arrayWithEvents {
    
    FFEvent *event1 = [FFEvent new];
    [event1 setStringCustomerName: @"Customer A"];
    [event1 setNumCustomerID:@1];
    [event1 setDateDay:[NSDate dateWithYear:[NSDate componentsOfCurrentDate].year month:[NSDate componentsOfCurrentDate].month day:[NSDate componentsOfCurrentDate].day]];
    [event1 setDateTimeBegin:[NSDate dateWithHour:10 min:00]];
    [event1 setDateTimeEnd:[NSDate dateWithHour:15 min:13]];
    [event1 setArrayWithGuests:[NSMutableArray arrayWithArray:@[@[@111, @"Guest 2", @"email2@email.com"], @[@111, @"Guest 4", @"email4@email.com"], @[@111, @"Guest 5", @"email5@email.com"], @[@111, @"Guest 7", @"email7@email.com"]]]];
    
    return [NSMutableArray arrayWithArray:@[event1]];
}*/

@end
