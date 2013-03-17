//
//  ItemDetailsViewController.m
//  MonganProject
//
//  Created by Mike Hershey on 3/17/13.
//  Copyright (c) 2013 Matthew Hinkle. All rights reserved.
//

#import "ItemDetailsViewController.h"

@interface ItemDetailsViewController ()

@end

@implementation ItemDetailsViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hasValueChanged:(UIStepper *)sender {
}
- (IBAction)desiredValueChanged:(UIStepper *)sender {
}
- (IBAction)itemNameReturnPressed:(UITextField *)sender {
}
- (IBAction)descriptionReturnPressed:(UITextField *)sender {
}
- (IBAction)saveButtonClicked:(UIButton *)sender {
}
@end
