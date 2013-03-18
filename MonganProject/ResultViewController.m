//
//  ResultViewController.m
//  MonganProject
//
//  Created by Matthew Hinkle on 3/16/13.
//  Copyright (c) 2013 Matthew Hinkle. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchbar;
@property (strong, nonatomic) NSArray * products;
@end

@implementation ResultViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	_searchbar.delegate = self;
	[[self tableView] setDelegate:self];
	[[self tableView] setDataSource:self];
	
	[[[self searchDisplayController] searchResultsTableView] setHidden:YES];
	
	if(_searchByUpc) {
		[_searchbar.superview removeFromSuperview];
		[self loadResults];
	}
	
	_products = [NSArray array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadResults {
	[[ModalLoadingOverlayController sharedInstance] present];
	
	if([self searchByUpc]) {
		[[MonganProjectService sharedInstance] getItemsForUpc:[self upc] withCallback:^(GTLServiceTicket *ticket, id obj, NSError *error) {
			assert(!(error));
			
			[self setProducts:obj];
			[[self tableView] reloadData];
			
			[[ModalLoadingOverlayController sharedInstance] remove];
		}];
	} else {
		[[MonganProjectService sharedInstance] getItemsForProductName:[[self searchbar] text] withCallback:^(GTLServiceTicket *ticket, id obj, NSError *error) {
			assert(!(error));
			
			[self setProducts:obj];
			[[self tableView] reloadData];
			
			[[ModalLoadingOverlayController sharedInstance] remove];
		}];
	}
}

#pragma mark - UI scrollbar delegate
- (void) searchBarTextDidEndEditing:(UISearchBar *)searchBar {
	[self loadResults];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	[self loadResults];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [[self products] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
	
	GTLProductProduct * product = [[self products] objectAtIndex:[indexPath row]];
	
	[[cell textLabel] setText:[product productName]];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
