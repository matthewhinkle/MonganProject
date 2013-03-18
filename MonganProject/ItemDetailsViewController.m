//
//  ItemDetailsViewController.m
//  MonganProject
//
//  Created by Mike Hershey on 3/17/13.
//  Copyright (c) 2013 Matthew Hinkle. All rights reserved.
//

#import "ItemDetailsViewController.h"

@interface ItemDetailsViewController ()
@property (nonatomic, strong) GTLUseritemsDesiredItem * desiredItem;
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
	
	[self populate];
}

- (void) populate {
	if(_item) {
		[_itemName setText:[[_item product] productName]];
		[_description setText:[[_item product] productDiscription]];
		
		if([_item desiredItem]) {
			[self setDesiredItem:[_item desiredItem]];
			
			[_hasLabel setText:[[[_item desiredItem] owned] stringValue]];
			[_desiredLabel setText:[[[_item desiredItem] desired] stringValue]];
		} else {
			[self setDesiredItem:[[GTLUseritemsDesiredItem alloc] init]];
			[_item setDesiredItem:[self desiredItem]];
			
			[_hasLabel setText:@"0"];
			[_desiredLabel setText:@"1"];
		}
		
		if([[_item product] imageUrl]) {
			[_imageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[_item product] imageUrl]]]]];
		}
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hasValueChanged:(UIStepper *)sender {
	if([sender value] > 0) {
		[[self desiredItem] setOwned:[NSNumber numberWithDouble:[sender value]]];
	} else {
		[sender setValue:0];
	}
	
	[self populate];
}

- (IBAction)desiredValueChanged:(UIStepper *)sender {
	if([sender value] > 0) {
		[[self desiredItem] setDesired:[NSNumber numberWithDouble:[sender value]]];
	} else {
		[sender setValue:0];
	}
	
	[self populate];
}

- (IBAction)itemNameReturnPressed:(UITextField *)sender {
	[self populate];
}
- (IBAction)descriptionReturnPressed:(UITextField *)sender {
	[self populate];
}

- (IBAction)saveButtonClicked:(UIButton *)sender {
	GTLUseritemsDesiredItem * item = [[GTLUseritemsDesiredItem alloc] init];
	[item setDesired:[NSNumber numberWithLongLong:[[[self desiredLabel] text] longLongValue]]];
	[item setOwned:[NSNumber numberWithLongLong:[[[self hasLabel] text] longLongValue]]];
	[item setProductKey:[[[self item] product] key]];
	
	NSLog(@"key = %@", [[[self item] product] key]);
	
	GTLProductProduct * product = [[GTLProductProduct alloc] init];
	[product setProductName:[[self itemName] text]];
	[product setProductDiscription:[[self description] text]];
	
	//if(!([[[self item] product] key])) {
		[[MonganProjectService sharedInstance] insertProduct:product withCallback:^(GTLServiceTicket *ticket, id obj, NSError *error) {
			NSLog(@"inserted product : %@", obj);
			
			NSLog(@"error = %@", error);
			
			[item setProductKey:[obj key]];
			NSLog(@"key = %@\n\n", [item productKey]);
			
			[[MonganProjectService sharedInstance] upsertDesiredItem:item withCallback:^(GTLServiceTicket *ticket, id object, NSError *error) {
				NSLog(@"error = %@", error);
				
				NSLog(@"upserted object %@", object);
			}];
		}];
	/*} else {
		[product setKey:[[[self item] product] key]];
		
		[[MonganProjectService sharedInstance] upsertDesiredItem:item withCallback:^(GTLServiceTicket *ticket, id object, NSError *error) {
			NSLog(@"error = %@", error);
			
			NSLog(@"upserted object %@", object);
		}];
	}*/
}
@end
