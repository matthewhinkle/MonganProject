//
//  ScanViewController.h
//  MonganProject
//
//  Created by Matthew Hinkle on 3/16/13.
//  Copyright (c) 2013 Matthew Hinkle. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ZXingObjC.h"

@protocol ScanViewDelegate <NSObject>

- (void) scanView:(UIView *)scanView didCaptureResult:(NSString *)result;

@end

@interface ScanViewController : UIViewController <ZXCaptureDelegate>

@property (nonatomic, strong) id<ScanViewDelegate> delegate;

@end
