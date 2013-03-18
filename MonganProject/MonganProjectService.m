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
        [items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            GTLUseritemsDesiredItem * item = obj;
            DesiredItemAndProductAreBothHeldInThisClass * thisItem = [[DesiredItemAndProductAreBothHeldInThisClass alloc] init];
            thisItem.desiredItem = item;
            [ret addObject:thisItem];
            GTLQueryProduct * subQuery = [GTLQueryProduct queryForGetWithIdentifier:item.productKey];
            [self.productService executeQuery:subQuery completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
                NSLog(@"Got the callback!");
                thisItem.product = object;
                itemsLeft -= 1;
                if(itemsLeft == 0) {
                    handler(ticket, ret, nil);
                }
            }];
        }];
    }];
}

-(void) deleteDesiredByProductId:(NSString *)string WithCallback:(void (^)(GTLServiceTicket *ticket, id object, NSError *error))handler;
{
    GTLQueryUseritems * query = [GTLQueryUseritems queryForDeleteWithProductKey:string];
    [self.userItemService executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
        handler(ticket, object, error);
    }];
}

- (void) upsertDesiredItem:(GTLUseritemsDesiredItem *)desiredItem withCallback:(void (^)(GTLServiceTicket * ticket, id object, NSError * error))callback {
	GTLQueryUseritems * query = [GTLQueryUseritems queryForUpsertWithProductKey:[desiredItem productKey]
																		desired:[[desiredItem desired] longLongValue]
																		   have:[[desiredItem owned] longLongValue]];
	[[self userItemService] executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
		if(error) {
			callback(ticket, nil, error);
			return;
		}
		
		callback(ticket, object, nil);
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

- (void) getDesiredItemForProduct:(GTLProductProduct *)product withCallback:(void (^)(GTLServiceTicket * ticker, id obj, NSError * error))callback {
	GTLQueryUseritems * query = [GTLQueryUseritems queryForGetWithProductKey:[product key]];
	[[self userItemService] executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
		if(error) {
			callback(ticket, nil, error);
			return;
		}
		
		callback(ticket, object, nil);
	}];
}

- (void) insertProduct:(GTLProductProduct *)product withCallback:(void (^)(GTLServiceTicket * ticket, id obj, NSError * error))callback {
	GTLQueryProduct * query = [GTLQueryProduct queryForInsertWithObject:product];
	[[self productService] executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
		if(error) {
			callback(ticket, nil, error);
			return;
		}
		
		callback(ticket, object, nil);
	}];
}

- (void) updateProduct:(GTLProductProduct *)product withCallback:(void (^)(GTLServiceTicket * ticket, id obj, NSError * error))callback {
	GTLQueryProduct * query = [GTLQueryProduct queryForUpdateWithObject:product];	
	[[self productService] executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
		if(error) {
			callback(ticket, nil, error);
			return;
		}
		
		callback(ticket, object, nil);
	}];
}

@end
