//
//  ScanViewController.m
//  MonganProject
//
//  Created by Matthew Hinkle on 3/16/13.
//  Copyright (c) 2013 Matthew Hinkle. All rights reserved.
//

#import "ScanViewController.h"

@interface ScanViewController()
@property (nonatomic, strong) ZXCapture * capture;
@property (weak, nonatomic) IBOutlet UILabel *instructionLabel;
@end

@implementation ScanViewController

- (void) viewDidLoad {
	[super viewDidLoad];
	
	_capture = [[ZXCapture alloc] init];
	[_capture setDelegate:self];
	[_capture setRotation:90.0f];
	
	[_capture setCamera:[_capture back]];
	[[[self view] layer] addSublayer:[_capture layer]];
	[[_capture layer] setFrame:[[self view] bounds]];
	[[self view] bringSubviewToFront:_instructionLabel];
}

- (void) captureResult:(ZXCapture *)capture result:(ZXResult *)result {
	if(result) {
		[[self delegate] scanView:[self view] didCaptureResult:[result text]];
	}
}

@end
