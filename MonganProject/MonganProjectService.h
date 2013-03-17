//
//  MonganProjectService.h
//  MonganProject
//
//  Created by Mike Hershey on 3/17/13.
//  Copyright (c) 2013 Matthew Hinkle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTLServiceProduct.h"
#import "GTLServiceUseritems.h"

@interface MonganProjectService : NSObject

+ (MonganProjectService *) sharedInstance;
- (GTLServiceProduct *) productService;

@end
