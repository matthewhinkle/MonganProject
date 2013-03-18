//
//  MonganProjectService.m
//  MonganProject
//
//  Created by Mike Hershey on 3/17/13.
//  Copyright (c) 2013 Matthew Hinkle. All rights reserved.
//

#import "MonganProjectService.h"

static MonganProjectService * instance;

@implementation MonganProjectService

+(void)initialize {
    instance = [[MonganProjectService alloc] init];
}

+ (MonganProjectService *) sharedInstance
{
    return instance;
}

- (GTLServiceProduct *) productService; {
	static GTLServiceProduct * service = nil;
	if(!(service)) {
		service = [[GTLServiceProduct alloc] init];
		[service setRetryEnabled:YES];
	}
	
	return service;
}

- (GTLServiceUseritems *) userItemService {
	static GTLServiceUseritems * service = nil;
	if(!(service)) {
		service = [[GTLServiceUseritems alloc] init];
		[service setRetryEnabled:YES];
	}
	
	return service;
}

-(void) getItemsForUserWithCallback:(void (^)(GTLServiceTicket *ticket, id object, NSError *error))handler;
{
    GTLQueryUseritems * query = [GTLQueryUseritems queryForList];
    [self.userItemService executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
        if(error) {
            handler(ticket, nil, error);
            return;
        }
        GTLUseritemsDesiredItemCollection * itemCollection = object;
        NSArray * items = itemCollection.items;
        if(!items) {
            handler(ticket, [NSArray array], nil);
            return;
        }
        __block int itemsLeft = items.count;
        NSMutableArray * ret = [NSMutableArray array];
        for(GTLUseritemsDesiredItem * item in items) {
            __block DesiredItemAndProductAreBothHeldInThisClass * thisItem = [[DesiredItemAndProductAreBothHeldInThisClass alloc] init];
            thisItem.desiredItem = item;
            [ret addObject:thisItem];
            GTLQueryProduct * subQuery = [GTLQueryProduct queryForGetWithIdentifier:item.productKey];
            [self.productService executeQuery:subQuery completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
                thisItem.product = object;
                 itemsLeft -= 1;
            }];
        }
        while(itemsLeft > 0) {
            [NSThread sleepForTimeInterval:0];
        }
        handler(ticket, ret, nil);
    }];
}

- (void) getItemsForUpc:(NSString *)upc withCallback:(void (^)(GTLServiceTicket * ticket, id obj, NSError * error))callback {
	GTLQueryProduct * query = [GTLQueryProduct queryForSearchUpcWithUpc:upc];
	[[self productService] executeQuery:query completionHandler:^(GTLServiceTicket * ticket, id obj, NSError * error) {
		if(error) {
			callback(ticket, nil, error);
			return;
		}
		
		NSArray * products = [obj items];
		if(!(products)) {
			callback(ticket, [NSArray array], nil);
			return;
		}
		
		callback(ticket, products, nil);
	}];
}

- (void) getItemsForProductName:(NSString *)productName withCallback:(void (^)(GTLServiceTicket * ticket, id obj, NSError * error))callback {
	GTLQueryProduct * query = [GTLQueryProduct queryForSearchNameWithName:productName];
	[[self productService] executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id obj, NSError *error) {
		if(error) {
			callback(ticket, nil, error);
			return;
		}
		
		NSArray * products = [obj items];
		if(!(products)) {
			callback(ticket, [NSArray array], nil);
			return;
		}
		
		callback(ticket, products, nil);
	}];
}

@end
