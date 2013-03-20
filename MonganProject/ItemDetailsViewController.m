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
	[self populate];
}

- (void) populate {
	if([self item]) {
		[[self itemName] setText:[[[self item] product] productName]];
		[[self description] setText:[[[self item] product] productDiscription]];
		
		if([[self item] desiredItem]) {
			[self setDesiredItem:[[self item] desiredItem]];
			
			if([[[self item] desiredItem] owned]) {
				[[self hasLabel] setText:[[[[self item] desiredItem] owned] stringValue]];
				[[self hasStepper] setValue:[[[[self item] desiredItem] owned] doubleValue]];
			} else {
				[[self hasLabel] setText:@"0"];
			}
			
			if([[[self item] desiredItem] desired]) {
				[[self desiredLabel] setText:[[[[self item] desiredItem] desired] stringValue]];
				[[self desiredStepper] setValue:[[[[self item] desiredItem] desired] doubleValue]];
			} else {
				[[self desiredLabel] setText:@"-"];
			}
		} else {
			[self setDesiredItem:[[GTLUseritemsDesiredItem alloc] init]];
			[[self item] setDesiredItem:[self desiredItem]];
			
			[[self hasLabel] setText:@"0"];
			[[self desiredLabel] setText:@"-"];
		}
		
		NSLog(@"loading image with url: %@", [[[self item] product] imageUrl]);
		
		[[self imageView] setContentMode:UIViewContentModeScaleAspectFill];
		[[self imageView] setClipsToBounds:YES];
		
		if(self.item.product.imageUrl) {
			[[self imageView] setImageURL:[NSURL URLWithString: self.item.product.imageUrl]];
		} else {
			[[self imageView] setImage:[UIImage imageNamed:@"placeholder.png"]];
		}
	} else {
		[self setItem:[[DesiredItemAndProductAreBothHeldInThisClass alloc] init]];
		[[self item] setDesiredItem:[[GTLUseritemsDesiredItem alloc] init]];
		[[self item] setProduct:[[GTLProductProduct alloc] init]];
		[self populate];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hasValueChanged:(UIStepper *)sender {
	if([sender value] > 0 && [sender value] <= [[self desiredStepper] value]) {
		[[self desiredItem] setOwned:[NSNumber numberWithDouble:[sender value]]];
	} else if([sender value] > [[self desiredStepper] value]) {
		[sender setValue:[[self desiredStepper] value]];
		[[self desiredItem] setOwned:[NSNumber numberWithDouble:[sender value]]];
	} else {
		[sender setValue:0];
	}
	
	[[self hasLabel] setText:[[[self desiredItem] owned] stringValue]];
}

- (IBAction)desiredValueChanged:(UIStepper *)sender {
	if([sender value] > 0 && [sender value] >= [[self hasStepper] value]) {
		[[self desiredItem] setDesired:[NSNumber numberWithDouble:[sender value]]];
	} else if([sender value] < [[self hasStepper] value]) {
		[sender setValue:[[self hasStepper] value]];
		[[self desiredItem] setDesired:[NSNumber numberWithDouble:[sender value]]];
	} else {
		[sender setValue:0];
	}
	
	[[self desiredLabel] setText:[[[self desiredItem] desired] stringValue]];
}

- (IBAction)itemNameReturnPressed:(UITextField *)sender {
	[[[self item] product] setProductName:[[self itemName] text]];
}
- (IBAction)descriptionReturnPressed:(UITextField *)sender {
	[[[self item] product] setProductDiscription:[[self description] text]];
}

- (IBAction)saveButtonClicked:(UIButton *)sender {
	GTLUseritemsDesiredItem * item = [[GTLUseritemsDesiredItem alloc] init];
	[item setDesired:[NSNumber numberWithLongLong:[[[self desiredLabel] text] longLongValue]]];
	[item setOwned:[NSNumber numberWithLongLong:[[[self hasLabel] text] longLongValue]]];
	[item setProductKey:[[[self item] product] key]];
	
	GTLProductProduct * product = [[GTLProductProduct alloc] init];
	[product setProductName:[[self itemName] text]];
	[product setProductDiscription:[[self description] text]];
	[product setImageUrl:[[[self item] product] imageUrl]];
	
	if([[[self item] product] upcCode]) {
		[product setUpcCode:[[[self item] product] upcCode]];
	}
	
	if(!([[[self item] product] key]) || [[[[self item] product] key] isEqualToString:@""]) {
		[[MonganProjectService sharedInstance] insertProduct:product withCallback:^(GTLServiceTicket *ticket, id obj, NSError *error) {
			NSLog(@"we are inserting");
		
			if(error) {
				NSLog(@"insert error : %@", error);
				return;
			}
		
			NSLog(@"inserted product : %@", obj);
			
			[item setProductKey:[obj key]];
			[[MonganProjectService sharedInstance] upsertDesiredItem:item withCallback:^(GTLServiceTicket *ticket, id object, NSError *error) {
				if(error) {
					NSLog(@"upsert error : %@", error);
				}
				
				NSLog(@"upserted object : %@", object);
				
				[self performSegueWithIdentifier:@"saveItem" sender:nil];
			}];
		}];
	} else {
		NSLog(@"we are updating");
	
		[product setKey:[[[self item] product] key]];
		
		[[MonganProjectService sharedInstance] updateProduct:product withCallback:^(GTLServiceTicket *ticket, id obj, NSError *error) {
			if(error) {
				NSLog(@"update error : %@", error);
				return;
			}
			
			NSLog(@"updated product : %@", obj);
			
			[[MonganProjectService sharedInstance] upsertDesiredItem:item withCallback:^(GTLServiceTicket *ticket, id object, NSError *error) {
				if(error) {
					NSLog(@"upsert error for existing product : %@", error);
					return;
				}
				
				NSLog(@"upserted object : %@", object);
				
				[self performSegueWithIdentifier:@"saveItem" sender:nil];
			}];
		}];
	}
}

- (IBAction)didTouchUpInsideEditPictureButton:(id)sender {
	UIImagePickerController * controller = [[UIImagePickerController alloc] init];
	[controller setSourceType:UIImagePickerControllerSourceTypeCamera];
	[controller setCameraCaptureMode:UIImagePickerControllerCameraCaptureModePhoto];
	[controller setDelegate:self];
	[self presentViewController:controller animated:true completion:nil];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage * image = info[@"UIImagePickerControllerOriginalImage"];
	
    [picker dismissViewControllerAnimated:YES completion:^{
		[[self imageView] setImage:[self scaleImage:image]];
		
		NSString * base64Image = [[UIImageJPEGRepresentation(image, 1) base64EncodingWithLineLength:0] encodedURLString];
			
		NSString *uploadCall = [NSString stringWithFormat:@"key=%@&image=%@", kImgurApiKey, base64Image];
		
		NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://api.imgur.com/2/upload.json"]];
		[request setHTTPMethod:@"POST"];
		[request setValue:[NSString stringWithFormat:@"%d",[uploadCall length]] forHTTPHeaderField:@"Content-length"];
		[request setHTTPBody:[uploadCall dataUsingEncoding:NSUTF8StringEncoding]];
		
		[[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
	}];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	NSLog(@"received : %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
	
	NSError * error;
	id json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
	assert(!(error));
	
	[[[self item] product] setImageUrl:[[[json objectForKey:@"upload"] objectForKey:@"links"] objectForKey:@"original"]];
	
	NSLog(@"it is: %@", [[[self item] product] imageUrl]);
}

- (UIImage *) scaleImage:(UIImage *)image {
	const CGRect imageBounds = CGRectMake(0, 0, [image size].width, [image size].height);
	const CGRect stageBounds = [[self imageView] bounds];
	if(CGRectContainsRect(imageBounds, stageBounds)) {
		const CGRect newBounds = [self resizeBounds:imageBounds forSize:stageBounds.size];
		
		UIGraphicsBeginImageContextWithOptions(newBounds.size, NO, 0.0);
		[image drawInRect:newBounds];
		image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
	}
	
	return image;
}

- (CGRect) resizeBounds:(CGRect)bounds forSize:(CGSize)size {
	if(!(bounds.size.height)) {
		return bounds;
	}
	
	CGFloat aspectRatio = bounds.size.width / bounds.size.height;
	
	if(bounds.size.width > bounds.size.height) {
		bounds.size.width = size.width;
		bounds.size.height = size.width / aspectRatio;
	} else {
		bounds.size.height = size.height;
		bounds.size.width = size.height * aspectRatio;
	}
	
	return bounds;
}

@end
