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
    
    // Get the size of the screen
    CGSize viewSize = self.view.frame.size;
    
    /* Create the UIWebViews for the calendars */
    
    // Conference Room
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"conferenceRm" ofType:@"html" inDirectory:@"html"]];
    UIWebView *conferenceRmCal = [self createUIWebViewWithString:url withSize:viewSize];
    [self.view addSubview:conferenceRmCal];
    conferenceRmCal.hidden = NO;
    
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

@end
