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
        
    }];
}

@end
