//
//  SecondViewController.m
//  MonganProject
//
//  Created by Matthew Hinkle on 3/16/13.
//  Copyright (c) 2013 Matthew Hinkle. All rights reserved.
//

#import "GTLServiceProduct.h"
#import "GTLQueryProduct.h"

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	static GTLServiceProduct * service = nil;
	if(!(service)) {
		service = [[GTLServiceProduct alloc] init];
		service.retryEnabled = YES;
	}
	
	GTLQueryProduct * query = [GTLQueryProduct queryForSearchNameWithName:@"mike's awesome item"];
	[service executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
		NSLog(@"response = %@", object);
	}];
	
	NSLog(@"hai");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
