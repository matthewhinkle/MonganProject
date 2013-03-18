//
//  ModalLoadingOverlayController.h
//  zChan
//
//  Created by Mike Hershey on 2/20/13.
//  Copyright (c) 2013 ZCD Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalLoadingOverlayController : UIViewController

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

+(ModalLoadingOverlayController *) sharedInstance;

- (void)present;
- (void)remove;

@end
