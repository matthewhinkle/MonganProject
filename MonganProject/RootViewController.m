//
//  SecondViewController.m
//  MonganProject
//
//  Created by Matthew Hinkle on 3/16/13.
//  Copyright (c) 2013 Matthew Hinkle. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@property NSMutableArray * items;
@property DesiredItemAndProductAreBothHeldInThisClass * selected;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	
}

-(void) loadData
{
    [[ModalLoadingOverlayController sharedInstance] present];
    [[MonganProjectService sharedInstance] getItemsForUserWithCallback:^(GTLServiceTicket *ticket, id object, NSError *error) {
        if(error) {
            [self showAlertWithTitle:@"Network error!" AndMessage:@"Failed to retreive your inventory list!"];
            return;
        }
        if([object isKindOfClass:[NSArray class]]) {
            self.items = object;
        }
        [self.tableView reloadData];
        [[ModalLoadingOverlayController sharedInstance] remove];
    }];
}

-(void) viewDidAppear:(BOOL)animated
{
    [self loadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(self.items && self.items.count > 0) {
        return 1;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 88;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.items && self.items.count > 0) {
        return self.items.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ImageCell";
    InventoryItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    DesiredItemAndProductAreBothHeldInThisClass * item = [self.items objectAtIndex:indexPath.row];
    [cell renderDesiredItem:item];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"itemDetails"]) {
        [[segue destinationViewController] setItem:[self selected]];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        DesiredItemAndProductAreBothHeldInThisClass * item = [self.items objectAtIndex:indexPath.row];
        [[MonganProjectService sharedInstance] deleteDesiredByProductId:item.product.key WithCallback:^(GTLServiceTicket *ticket, id object, NSError *error) {
            if(error) {
                [self showAlertWithTitle:@"Error Deleting Item!" AndMessage:error.description];
                [self loadData];
                return;
            }
        }];
        [self.items removeObject:item];
        [self.tableView reloadData];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selected = [self.items objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"itemDetails" sender:self];
}

-(void) showAlertWithTitle:(NSString *)title AndMessage:(NSString *)message {
    UIAlertView * view = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [view show];
}

@end
