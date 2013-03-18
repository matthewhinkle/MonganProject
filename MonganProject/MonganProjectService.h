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
#import "GTLProduct.h"
#import "GTLUseritems.h"
#import "GTLUseritemsDesiredItem.h"
#import "DesiredItemAndProductAreBothHeldInThisClass.h"

@interface MonganProjectService : NSObject

+ (MonganProjectService *) sharedInstance;
- (GTLServiceProduct *) productService;
- (GTLServiceUseritems *) userItemService;

-(void) getItemsForUserWithCallback:(void (^)(GTLServiceTicket *ticket, id object, NSError *error))handler;

-(void) deleteDesiredByProductId:(NSString *)string WithCallback:(void (^)(GTLServiceTicket *ticket, id object, NSError *error))handler;

- (void) upsertDesiredItem:(GTLUseritemsDesiredItem *)desiredItem withCallback:(void (^)(GTLServiceTicket * ticket, id object, NSError * error))callback;

- (void) getItemsForUpc:(NSString *)upc withCallback:(void (^)(GTLServiceTicket * ticket, id obj, NSError * error))callback;

- (void) getItemsForProductName:(NSString *)productName withCallback:(void (^)(GTLServiceTicket * ticket, id obj, NSError * error))callback;

- (void) getDesiredItemForProduct:(GTLProductProduct *)product withCallback:(void (^)(GTLServiceTicket * ticker, id obj, NSError * error))callback;

- (void) insertProduct:(GTLProductProduct *)product withCallback:(void (^)(GTLServiceTicket * ticket, id obj, NSError * error))callback;

@end
