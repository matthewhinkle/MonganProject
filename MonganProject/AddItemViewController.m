//
//  FirstViewController.m
//  MonganProject
//
//  Created by Matthew Hinkle on 3/16/13.
//  Copyright (c) 2013 Matthew Hinkle. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()
@property (nonatomic, strong) ZXCapture * capture;
@end

@implementation AddItemViewController

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
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButtonClicked:(UIButton *)sender {
}

@end
