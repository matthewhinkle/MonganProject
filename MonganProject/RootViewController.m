//
//  SecondViewController.m
//  MonganProject
//
//  Created by Matthew Hinkle on 3/16/13.
//  Copyright (c) 2013 Matthew Hinkle. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	[self authenticate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) authenticate {
	NSString * const scope = @"https://www.googleapis.com/auth/userinfo.email";
	
	GTMOAuth2ViewControllerTouch * viewController =
	[[GTMOAuth2ViewControllerTouch alloc] initWithScope:scope
											   clientID:kClientId
										   clientSecret:kClientSecret
									   keychainItemName:kKeychainItemName
									  completionHandler:^(GTMOAuth2ViewControllerTouch *viewController, GTMOAuth2Authentication *auth, NSError *error) {
										  [self viewController:viewController finishedWithAuth:auth error:error];
									}];
	
	[self presentViewController:viewController animated:YES completion:nil];
}

- (void) viewController:(GTMOAuth2ViewControllerTouch *)viewController finishedWithAuth:(GTMOAuth2Authentication *)auth error:(NSError *)error {
	[self dismissViewControllerAnimated:YES completion:nil];
	
	assert(!(error));
	[[self productService] setAuthorizer:auth];
	[auth setAccessToken:[[auth parameters] objectForKey:@"id_token"]];
}

- (GTLServiceProduct *) productService {
	static GTLServiceProduct * service = nil;
	if(!(service)) {
		service = [[GTLServiceProduct alloc] init];
		[service setRetryEnabled:YES];
	}
	
	return service;
}

@end
