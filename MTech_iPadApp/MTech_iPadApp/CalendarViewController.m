//
//  CalendarViewController.m
//  MTech_iPadApp
//
//  Created by Tom Longabaugh on 2/11/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import "CalendarViewController.h"
#import "Reachability.h"
#import "RootViewController.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController
{
    Reachability *internetReachable;
    UIWebView *conferenceRmCal;
    UIWebView *dolanCal;
    UIWebView *researchLabCal;
    UIWebView *buchlaCal;
    UIWebView *studyPantryCal;
    RootViewController *rootView;
}
@synthesize internetLabel;


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // Get the size of the screen
    CGSize viewSize = self.view.frame.size;
    
    // root view controller reference
    rootView = (RootViewController*) [self tabBarController];

    
    // Initialize the array to hold studio names for the picker, then only add ones that user has selected
    // in their settings page
    self.studioNames = @[@"Conference Room", @"Dolan",
                      @"Research Lab", @"Buchla", @"Study/Pantry"];
    self.studioNamesMutable = [self.studioNames mutableCopy];
    
    // Delete the calendar names that aren't needed
    NSMutableIndexSet *indexesToDelete = [NSMutableIndexSet indexSet];
    for (int i = 0; i<self.studioNames.count; i++) {
        if (![rootView getCalendarEnabledForCalNum:i]) {
            [indexesToDelete addIndex:i];
        }
    }
    [self.studioNamesMutable removeObjectsAtIndexes:indexesToDelete];
    
    // Update the picker, center and resize it
    [self.studioPicker reloadAllComponents];
    [self.studioPicker setFrame:CGRectMake(0.0, viewSize.height-162, 300.0, 162.0)];
    self.studioPicker.center = CGPointMake(viewSize.width/2, viewSize.height-162.0);
    self.studioPicker.hidden = NO;
    self.studioPicker.userInteractionEnabled = YES;
    
    // Format and place internet connection check label
    internetLabel.center = CGPointMake(viewSize.width/2, viewSize.height/2);
    internetLabel.hidden = YES;
    internetLabel.text = @"No Internet Connection";
    [self.view addSubview:internetLabel];

    /* Create the UIWebViews for the calendars */
    
    // Conference Room
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"conferenceRm" ofType:@"html" inDirectory:@"html"]];
    conferenceRmCal = [self createUIWebViewWithString:url withSize:viewSize];
    [self.view addSubview:conferenceRmCal];
    conferenceRmCal.hidden = NO;
    
    // Dolan
    url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"dolan" ofType:@"html" inDirectory:@"html"]];
    dolanCal = [self createUIWebViewWithString:url withSize:viewSize];
    [self.view addSubview:dolanCal];
    dolanCal.hidden = YES;
    
    // Research Lab
    url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"researchLab" ofType:@"html" inDirectory:@"html"]];
    researchLabCal = [self createUIWebViewWithString:url withSize:viewSize];
    [self.view addSubview:researchLabCal];
    researchLabCal.hidden = YES;
    
    // Buchla
    url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"buchla" ofType:@"html" inDirectory:@"html"]];
    buchlaCal = [self createUIWebViewWithString:url withSize:viewSize];
    [self.view addSubview:buchlaCal];
    buchlaCal.hidden = YES;
    
    // Study/Pantry
    url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"studyPantry" ofType:@"html" inDirectory:@"html"]];
    studyPantryCal = [self createUIWebViewWithString:url withSize:viewSize];
    [self.view addSubview:studyPantryCal];
    studyPantryCal.hidden = YES;
    
    // Make sure the internet is on. If it isn't display error message
    [self checkInternetReachibility];
    
    // Create a timer so that the iframes refresh every 5 minutes
    [NSTimer scheduledTimerWithTimeInterval:5*60.0 target:self selector:@selector(refreshCalendars:) userInfo:nil repeats:YES];
    
    // Register for foreground events so that calendars refresh when app is reopened
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willEnterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];

    [self.studioPicker selectRow:0 inComponent:0 animated:YES];
    
    // Configure the picker based on how many calendars are selected
    if ([self.studioNamesMutable count] == 1) {
        self.studioPicker.userInteractionEnabled = NO;
        [self changeTOCalendarWithName:self.studioNamesMutable[0]];
    }
    else if ([self.studioNamesMutable count] == 0) {
        self.studioPicker.hidden = YES;
        conferenceRmCal.hidden = YES;
        dolanCal.hidden = YES;
        researchLabCal.hidden = YES;
        buchlaCal.hidden = YES;
        studyPantryCal.hidden = YES;
    }
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
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

#pragma mark -
#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    // One component in our picker
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    // Get the number of rows
    return _studioNamesMutable.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    // Return the text string for the row
    return _studioNamesMutable[row];
}

#pragma mark -
#pragma mark PickerView Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    // Change the views according to user selection
    [self changeTOCalendarWithName:_studioNamesMutable[row]];
    
}

-(void)changeTOCalendarWithName:(NSString*)calName
{
    // Change the views according to user selection
    // Conference room selected
    if ([calName isEqualToString:@"Conference Room"]) {
        conferenceRmCal.hidden = NO;
        dolanCal.hidden = YES;
        researchLabCal.hidden = YES;
        buchlaCal.hidden = YES;
        studyPantryCal.hidden = YES;
    }
    // Dolan selected
    else if ([calName isEqualToString:@"Dolan"]) {
        conferenceRmCal.hidden = YES;
        dolanCal.hidden = NO;
        researchLabCal.hidden = YES;
        buchlaCal.hidden = YES;
        studyPantryCal.hidden = YES;
    }
    // Research Lab selected
    else if ([calName isEqualToString:@"Research Lab"]) {
        conferenceRmCal.hidden = YES;
        dolanCal.hidden = YES;
        researchLabCal.hidden = NO;
        buchlaCal.hidden = YES;
        studyPantryCal.hidden = YES;
    }
    // Buchla selected
    else if ([calName isEqualToString:@"Buchla"]) {
        conferenceRmCal.hidden = YES;
        dolanCal.hidden = YES;
        researchLabCal.hidden = YES;
        buchlaCal.hidden = NO;
        studyPantryCal.hidden = YES;
    }
    // Study/Pantry selected
    else if ([calName isEqualToString:@"Study/Pantry"]){
        conferenceRmCal.hidden = YES;
        dolanCal.hidden = YES;
        researchLabCal.hidden = YES;
        buchlaCal.hidden = YES;
        studyPantryCal.hidden = NO;
    }
}

-(void)refreshCalendars:(NSTimer *)timer
{
    // Check internet capability
    [self checkInternetReachibility];
    
    // Refresh the calendars
    [conferenceRmCal reload];
    [dolanCal reload];
    [researchLabCal reload];
    [buchlaCal reload];
    [studyPantryCal reload];
}


-(BOOL)checkInternetReachibility
{
    // see if we can reach internet
    internetReachable = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [internetReachable currentReachabilityStatus];
    
    if (networkStatus == NotReachable) {
        // Bring the label to the front, make it visible
        [self.view bringSubviewToFront:self.internetLabel];
        self.internetLabel.hidden = NO;
        return false;
    }
    else {
        // Make the label not visible
        self.internetLabel.hidden = YES;
        return true;
    }
}

- (void)willEnterForeground
{
    // Check internet capability
    [self checkInternetReachibility];
    
    // Refresh the calendars
    [conferenceRmCal reload];
    [dolanCal reload];
    [researchLabCal reload];
    [buchlaCal reload];
    [studyPantryCal reload];
}





@end
