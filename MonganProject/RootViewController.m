//
//  FirstViewController.m
//  MonganProject
//
//  Created by Matthew Hinkle on 3/16/13.
//  Copyright (c) 2013 Matthew Hinkle. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (nonatomic, strong) ZXCapture * capture;
@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTouchUpInsideScanButton:(id)sender {
	ScanViewController * controller = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"ScanViewController"];
	
	[controller setDelegate:self];
	
	[self presentViewController:controller animated:YES completion:nil];
}

- (void) scanView:(UIView *)scanView didCaptureResult:(NSString *)result {
	NSLog(@"got result!");
}

@end
