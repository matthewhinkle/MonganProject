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
				[[self hasStepper] setValue:[[[[self item] desiredItem] desired] doubleValue]];
			} else {
				[[self desiredLabel] setText:@"-"];
			}
		} else {
			[self setDesiredItem:[[GTLUseritemsDesiredItem alloc] init]];
			[[self item] setDesiredItem:[self desiredItem]];
			
			[[self hasLabel] setText:@"0"];
			[[self desiredLabel] setText:@"-"];
		}
		
		if([[[self item] product] imageUrl]) {
			[[self imageView] setImage:[self scaleImage:
										[UIImage imageWithData:
										 [NSData dataWithContentsOfURL:[NSURL URLWithString:[[[self item] product] imageUrl]]]]]];
		} else {
			[[self imageView] setImage:[self scaleImage:[UIImage imageNamed:@"placeholder.png"]]];
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
	
	GTLProductProduct * product = [[GTLProductProduct alloc] init];
	[product setProductName:[[self itemName] text]];
	[product setProductDiscription:[[self description] text]];
	
	if(!([[[self item] product] key])) {
		[[MonganProjectService sharedInstance] insertProduct:product withCallback:^(GTLServiceTicket *ticket, id obj, NSError *error) {
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
				
				[self performSegueWithIdentifier:@"saveItem" sender:self];
			}];
		}];
	} else {
		[product setKey:[[[self item] product] key]];
		
		[[MonganProjectService sharedInstance] upsertDesiredItem:item withCallback:^(GTLServiceTicket *ticket, id object, NSError *error) {
			if(error) {
				NSLog(@"upsert error for existing product : %@", error);
				return;
			}
			
			NSLog(@"upserted object : %@", object);
			
			[self performSegueWithIdentifier:@"saveItem" sender:self];
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
	
	[[ModalLoadingOverlayController sharedInstance] present];
    [picker dismissViewControllerAnimated:YES completion:^{
		[[self imageView] setImage:[self scaleImage:image]];
		
		[[self class] uploadPhoto:UIImageJPEGRepresentation(image, 1)
							title:@""
					  description:@""
					imgurClientID:kImgurApiKey
				  completionBlock:^(NSString *result) {
					  NSLog(@"received : %@", result);
				  } failureBlock:^(NSURLResponse *response, NSError *error, NSInteger status) {
					  NSLog(@"bad response: %@", response);
					  NSLog(@"error: %@", error);
				  }];
		[[ModalLoadingOverlayController sharedInstance] remove];
	}];
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

+ (void)uploadPhoto:(NSData*)imageData
              title:(NSString*)title
        description:(NSString*)description
      imgurClientID:(NSString*)clientID
    completionBlock:(void(^)(NSString* result))completion
       failureBlock:(void(^)(NSURLResponse *response, NSError *error, NSInteger status))failureBlock
{
	NSAssert(imageData, @"Image data is required");
	NSAssert(clientID, @"Client ID is required");
	
	NSString *urlString = @"http://api.imgur.com/2/image/.json";
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
	[request setURL:[NSURL URLWithString:urlString]];
	[request setHTTPMethod:@"POST"];
	
	NSMutableData *requestBody = [[NSMutableData alloc] init];
	
	NSString *boundary = @"---------------------------0983745982375409872438752038475287";
	
	NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
	[request addValue:contentType forHTTPHeaderField:@"Content-Type"];
	
	// Add client ID as authrorization header
	[request addValue:[NSString stringWithFormat:@"Client-ID %@", clientID] forHTTPHeaderField:@"Authorization"];
	
	// Image File Data
	[requestBody appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[requestBody appendData:[@"Content-Disposition: attachment; name=\"image\"; filename=\".jpg\"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
	
	[requestBody appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
	[requestBody appendData:[NSData dataWithData:imageData]];
	[requestBody appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
	
	// Title parameter
	if (title) {
		[requestBody appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
		[requestBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"title\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
		[requestBody appendData:[title dataUsingEncoding:NSUTF8StringEncoding]];
		[requestBody appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
	}
	
	// Description parameter
	if (description) {
		[requestBody appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
		[requestBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"description\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
		[requestBody appendData:[description dataUsingEncoding:NSUTF8StringEncoding]];
		[requestBody appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
	}
	
	[requestBody appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	
	[request setHTTPBody:requestBody];
	
	[NSURLConnection sendAsynchronousRequest:request
									   queue:[NSOperationQueue mainQueue]
						   completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
							   NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data
																								  options:NSJSONReadingMutableContainers
																									error:nil];
							   if ([responseDictionary valueForKeyPath:@"data.error"]) {
								   if (failureBlock) {
									   if (!error) {
										   // If no error has been provided, create one based on the response received from the server
										   error = [NSError errorWithDomain:@"imguruploader"
																	   code:10000
																   userInfo:@{NSLocalizedFailureReasonErrorKey :
													[responseDictionary valueForKeyPath:@"data.error"]}];
									   }
									   failureBlock(response, error, [[responseDictionary valueForKey:@"status"] intValue]);
								   }
							   } else {
								   if (completion) {
									   completion([responseDictionary valueForKeyPath:@"data"]);
								   }
								   
							   }
							   
						   }];
}


@end
