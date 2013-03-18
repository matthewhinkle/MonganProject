//
//  ItemDetailsViewController.h
//  MonganProject
//
//  Created by Mike Hershey on 3/17/13.
//  Copyright (c) 2013 Matthew Hinkle. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AsyncImageView.h"
#import "DesiredItemAndProductAreBothHeldInThisClass.h"

#import "NSData+Base64.h"
#import "NSString+URLEncoding.h"
#import "NSString+URLEscape.h"
#import "ModalLoadingOverlayController.h"
#import "MonganProjectService.h"

@interface ItemDetailsViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, NSURLConnectionDataDelegate>

@property (strong, nonatomic) DesiredItemAndProductAreBothHeldInThisClass * item;

@property (weak, nonatomic) IBOutlet UITextField *itemName;
- (IBAction)itemNameReturnPressed:(UITextField *)sender;

@property (weak, nonatomic) IBOutlet UILabel *hasLabel;
@property (weak, nonatomic) IBOutlet UIStepper *hasStepper;
- (IBAction)hasValueChanged:(UIStepper *)sender;

@property (weak, nonatomic) IBOutlet UILabel *desiredLabel;
@property (weak, nonatomic) IBOutlet UIStepper *desiredStepper;
- (IBAction)desiredValueChanged:(UIStepper *)sender;

@property (weak, nonatomic) IBOutlet UITextField *description;
- (IBAction)descriptionReturnPressed:(UITextField *)sender;

@property (weak, nonatomic) IBOutlet AsyncImageView *imageView;




- (IBAction)saveButtonClicked:(UIButton *)sender;

@end
