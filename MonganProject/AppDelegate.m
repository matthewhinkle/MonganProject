//
//  AppDelegate.m
//  MonganProject
//
//  Created by Matthew Hinkle on 3/16/13.
//  Copyright (c) 2013 Matthew Hinkle. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
 	NSString * const scope = @"https://www.googleapis.com/auth/userinfo.email";
    
    GTMOAuth2ViewControllerTouch * viewController =
	[[GTMOAuth2ViewControllerTouch alloc] initWithScope:scope
											   clientID:kClientId
										   clientSecret:kClientSecret
									   keychainItemName:kKeychainItemName
									  completionHandler:^(GTMOAuth2ViewControllerTouch *viewController, GTMOAuth2Authentication *auth, NSError *error) {
										  assert(!(error));
										  [[[MonganProjectService sharedInstance] productService] setAuthorizer:auth];
                                          [auth setAccessToken:[[auth parameters] objectForKey:@"id_token"]];
                                          
                                          UIViewController * root = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"roooooooooot"];
                                          self.window.rootViewController = root;
                                      }];
    
    self.window.rootViewController = viewController;
    
    return YES;
}

@end
