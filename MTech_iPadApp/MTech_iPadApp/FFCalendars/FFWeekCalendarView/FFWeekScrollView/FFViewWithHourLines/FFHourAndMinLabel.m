//
//  FFHourAndMinLabel.m
//  FFCalendar
//
//  Created by Fernanda G. Geraissate on 2/18/14.
//  Copyright (c) 2014 Fernanda G. Geraissate. All rights reserved.
//
//  http://fernandasportfolio.tumblr.com
//

#import "FFHourAndMinLabel.h"

#import "FFImportantFilesForCalendar.h"

@implementation FFHourAndMinLabel

#pragma mark - Synthesize

@synthesize dateHourAndMin;

#pragma mark - Lifecycle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame date:(NSDate *)date {
    
    self = [self initWithFrame:frame];
    
    if (self) {
        dateHourAndMin = date;
    }
    return self;
}

- (void)showText {
    
    NSDateComponents *comp =  [NSDate componentsOfDate:dateHourAndMin];
    long hour = (long)comp.hour;
    NSString *hourMinString;
    
    // Make hour 12 hr format
    if (hour > 12) {
        hourMinString = [NSString stringWithFormat:@"%02ld:%02ld", hour-12, (long)comp.minute];
    }
    else if (hour == 0) {
        hourMinString = [NSString stringWithFormat:@"%02ld:%02ld", (long)12, (long)comp.minute];
    }
    else if (hour == 12) {
        hourMinString = [NSString stringWithFormat:@"%@", @"Noon"];
    }
    else {
        hourMinString = [NSString stringWithFormat:@"%02ld:%02ld", hour, (long)comp.minute];
    }
    
    [self setText:hourMinString];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
