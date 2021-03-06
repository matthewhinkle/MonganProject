/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2013 Google Inc.
 */

//
//  GTLQueryUseritems.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   useritems/v1
// Description:
//   This is an API
// Classes:
//   GTLQueryUseritems (4 custom class methods, 4 custom properties)

#import "GTLQueryUseritems.h"

#import "GTLUseritemsDesiredItem.h"
#import "GTLUseritemsDesiredItemCollection.h"

@implementation GTLQueryUseritems

@dynamic desired, fields, have, productKey;

#pragma mark -
#pragma mark Service level methods
// These create a GTLQueryUseritems object.

+ (id)queryForDeleteWithProductKey:(NSString *)productKey {
  NSString *methodName = @"useritems.delete";
  GTLQueryUseritems *query = [self queryWithMethodName:methodName];
  query.productKey = productKey;
  return query;
}

+ (id)queryForGetWithProductKey:(NSString *)productKey {
  NSString *methodName = @"useritems.get";
  GTLQueryUseritems *query = [self queryWithMethodName:methodName];
  query.productKey = productKey;
  query.expectedObjectClass = [GTLUseritemsDesiredItem class];
  return query;
}

+ (id)queryForList {
  NSString *methodName = @"useritems.list";
  GTLQueryUseritems *query = [self queryWithMethodName:methodName];
  query.expectedObjectClass = [GTLUseritemsDesiredItemCollection class];
  return query;
}

+ (id)queryForUpsertWithProductKey:(NSString *)productKey
                           desired:(long long)desired
                              have:(long long)have {
  NSString *methodName = @"useritems.upsert";
  GTLQueryUseritems *query = [self queryWithMethodName:methodName];
  query.productKey = productKey;
  query.desired = desired;
  query.have = have;
  query.expectedObjectClass = [GTLUseritemsDesiredItem class];
  return query;
}

@end
