//
//  MTPurpleAndWhiteButton.m
//  MTech_iPadApp
//
//  Created by Tom Longabaugh on 3/24/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import "MTPurpleAndWhiteButton.h"

#import "FFImportantFilesForCalendar.h"

@implementation MTPurpleAndWhiteButton

- (id)initWithFrame:(CGRect)frame
{
    self = [UIButton buttonWithType:UIButtonTypeCustom];
    if (self) {
        // Initialization code
        
        [self setFrame:frame];
        
        // Set button text to purple/white
        [self setTitleColor:[UIColor nyuPurpleCustom] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
        // set button background to purple/white
        [self setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageWithColor:[UIColor nyuPurpleCustom]] forState:UIControlStateSelected];
        
        // set button border to purple/white
        [self.layer setBorderColor:[UIColor nyuPurpleCustom].CGColor];
        [self.layer setBorderWidth:1.];
    }
    return self;
}

- (void)setSelected:(BOOL)_selected {
    
    self.selected = _selected;
    
    // switch colors based on selection
    if(_selected) {
        [self.layer setBorderColor:[UIColor whiteColor].CGColor];
    }
    else {
        [self.layer setBorderColor:[UIColor nyuPurpleCustom].CGColor];
    }
}

@end