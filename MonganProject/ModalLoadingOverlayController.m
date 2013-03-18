//
//  ModalLoadingOverlayController.m
//  zChan
//
//  Created by Mike Hershey on 2/20/13.
//  Copyright (c) 2013 ZCD Media. All rights reserved.
//

#import "ModalLoadingOverlayController.h"

ModalLoadingOverlayController * instance;

@interface ModalLoadingOverlayController ()

@property bool isShown;

@end

@implementation ModalLoadingOverlayController

+(void)initialize
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    instance = [storyboard instantiateViewControllerWithIdentifier:@"modalLoadingController"];
    instance.isShown = NO;
}

+(ModalLoadingOverlayController *) sharedInstance
{
    return instance;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.spinner startAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Add this view to superview, and slide it in from the bottom
- (void)present
{
    if(self.isShown) {
        return;
    }
    UIView * superview = [[[[UIApplication sharedApplication] keyWindow] subviews] objectAtIndex:0];
    // Set initial location at bottom of superview
    [superview addSubview:self.view];
    self.isShown = YES;
}

// Slide this view to bottom of superview, then remove from superview
- (void)remove
{
    if(!self.isShown) {
        return;
    }
    [self.view removeFromSuperview];
    /*
    [UIView beginAnimations:@"removeFromSuperviewWithAnimation" context:nil];
    
    // Set delegate and selector to remove from superview when animation completes
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    
    // Move this view to bottom of superview
    CGRect frame = self.view.frame;
    frame.origin = CGPointMake(0.0, self.view.superview.bounds.size.height);
    self.view.frame = frame;
    
    [UIView commitAnimations];
     */
    self.isShown = NO;
}

@end
