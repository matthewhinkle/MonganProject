//
//  FirstViewController.m
//  MonganProject
//
//  Created by Matthew Hinkle on 3/16/13.
//  Copyright (c) 2013 Matthew Hinkle. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()
@property (nonatomic, strong) ScanViewController * scanViewController;
@property (nonatomic, strong) NSString * upc;
@property (nonatomic) BOOL searchByUpc;
@end

@implementation AddItemViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
	
	_searchByUpc = NO;
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction) didTouchUpInsideScanButton:(id)sender {
	[self setScanViewController:[[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"ScanViewController"]];
	
	[[self scanViewController] setDelegate:self];
	
	[self presentViewController:[self scanViewController] animated:YES completion:nil];
}

- (IBAction) cancelButtonClicked:(UIButton *)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void) scanView:(UIView *)scanView didCaptureResult:(NSString *)result {
	[[self scanViewController] dismissViewControllerAnimated:YES completion:^{
		[self setSearchByUpc:YES];
		[self setUpc:[self upc]];
		[self performSegueWithIdentifier:@"selectItem" sender:self];
	}];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	[[segue destinationViewController] setSearchByUpc:[self searchByUpc]];
	if([self searchByUpc]) {
		[[segue destinationViewController] setUpc:([self upc])];
	}
}

@end
