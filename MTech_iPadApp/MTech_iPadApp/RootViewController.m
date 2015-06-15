//
//  RootViewController.m
//  MTech_iPadApp
//
//  Created by Tom Longabaugh on 3/5/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController
{
    BOOL conferenceCalEnabled;
    BOOL dolanCalEnabled;
    BOOL researchCalEnabled;
    BOOL buchlaCalEnabled;
    BOOL studyPantryCalEnabled;
    NSArray *isCalendarEnabledArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    conferenceCalEnabled = YES;
    dolanCalEnabled = YES;
    researchCalEnabled = YES;
    buchlaCalEnabled = YES;
    studyPantryCalEnabled = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setCalendarEnabled:(BOOL)enabled forCalNum: (int)calNum {
    switch (calNum) {
        case 0:
            conferenceCalEnabled = enabled;
            break;
        case 1:
            dolanCalEnabled = enabled;
            break;
        case 2:
            researchCalEnabled = enabled;
            break;
        case 3:
            buchlaCalEnabled = enabled;
            break;
        case 4:
            studyPantryCalEnabled = enabled;
            break;
        default:
            break;
    }
}

-(BOOL)getCalendarEnabledForCalNum:(int)calNum {
    switch (calNum) {
        case 0:
            return conferenceCalEnabled;
        case 1:
            return dolanCalEnabled;
        case 2:
            return researchCalEnabled;
        case 3:
            return buchlaCalEnabled;
        case 4:
            return studyPantryCalEnabled;
        default:
            break;
    }
    // Should never reach here
    return NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
