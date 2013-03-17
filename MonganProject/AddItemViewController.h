//
//  FirstViewController.h
//  MonganProject
//
//  Created by Matthew Hinkle on 3/16/13.
//  Copyright (c) 2013 Matthew Hinkle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#import "ScanViewController.h"

@interface AddItemViewController : UIViewController <ScanViewDelegate>

- (IBAction)cancelButtonClicked:(UIButton *)sender;

@end
