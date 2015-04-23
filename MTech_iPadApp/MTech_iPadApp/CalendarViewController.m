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
@synthesize conferenceCal = _conferenceCal;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Display the Calendar
    //[self displayFFCalendar];
    /*CGRect frame = CGRectMake(0., 0., self.view.frame.size.width, self.view.frame.size.height);
    
    FFMonthCalendarView *viewCalendarYear = [[FFMonthCalendarView alloc] initWithFrame:frame];
    [viewCalendarYear setProtocol:self];
    [self.view addSubview:viewCalendarYear];
    */
    
    NSString *fullURL = @"https://www.google.com/calendar/embed?src=nyu.edu_nkls0lfdl9249huug0c7od2qgk%40group.calendar.google.com&ctz=America/New_York&mode=WEEK";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.conferenceCal loadRequest:requestObj];
    [self.view addSubview:self.conferenceCal];
  
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
}

@end
