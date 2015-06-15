//
//  SettingsTableViewController.m
//  MTech_iPadApp
//
//  Created by Tom Longabaugh on 6/14/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import "SettingsTableViewController.h"
#import "RootViewController.h"

@interface SettingsTableViewController ()

@end


@implementation SettingsTableViewController
{
    NSArray *tableData;
    int switchNum;
    RootViewController *rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableData = [NSArray arrayWithObjects:@"Conference Room", @"Dolan",
                 @"Research Lab", @"Buchla", @"Study/Pantry", nil];
    self.tableView.allowsSelection = NO;
    
    // Get reference to the root view controller, which stores which calendars are enabled
    rootView = (RootViewController*) [self tabBarController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [tableData count];
}

-(UITableViewCell*) tableView:(UITableView*) tableView cellForRowAtIndexPath:(NSIndexPath*) indexPath
{
    //Identifier
    static NSString* cellIdentifier = @"switchCell";
    
    // Cell number for updating info
    switchNum = indexPath.row;
    // Create the cell, format to include switches
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        UISwitch* s = [[UISwitch alloc] init];
        CGSize switchSize = [s sizeThatFits:CGSizeZero];
        s.frame = CGRectMake(cell.contentView.bounds.size.width - switchSize.width - 5.0f,
                             (cell.contentView.bounds.size.height - switchSize.height) / 2.0f,
                             switchSize.width,
                             switchSize.height);
        s.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        s.tag = 100;
        
        // Set the switch selector
        [s addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
        [cell.contentView addSubview:s];
        
        // Create the label, set the text
        UILabel* l = [[UILabel alloc] init];
        l.text = [tableData objectAtIndex:indexPath.row];
        CGRect labelFrame = CGRectInset(cell.contentView.bounds, 10.0f, 8.0f);
        labelFrame.size.width = cell.contentView.bounds.size.width / 2.0f;
        l.font = [UIFont boldSystemFontOfSize:17.0f];
        l.frame = labelFrame;
        l.backgroundColor = [UIColor clearColor];
        // Set accessibility
        cell.accessibilityLabel = @"Calendars";
        [cell.contentView addSubview:l];
    }
    
    // Set switches to on
    ((UISwitch*)[cell.contentView viewWithTag:100]).on = [rootView getCalendarEnabledForCalNum:indexPath.row]; // "value" is whatever the switch should be set to
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section

{
    return @"Enable/Disable Calendars";
}

-(void) switchChanged:(id)sender
{
    CGPoint switchPositionPoint = [sender convertPoint:CGPointZero toView:[self tableView]];
    NSIndexPath *indexPath = [[self tableView] indexPathForRowAtPoint:switchPositionPoint];
    
    // Get the switch value, set it's value in root view
    UISwitch* switcher = (UISwitch*)sender;
    BOOL value = switcher.on;
    [rootView setCalendarEnabled:value forCalNum:indexPath.row];

}

@end



