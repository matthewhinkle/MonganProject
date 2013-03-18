/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2013 Google Inc.
 */

//
//  GTLQueryProduct.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   product/v1
// Description:
//   This is an API
// Classes:
//   GTLQueryProduct (6 custom class methods, 10 custom properties)

#import "GTLQueryProduct.h"

#import "GTLProductCollection.h"
#import "GTLProductProduct.h"

@implementation GTLQueryProduct

@dynamic fields, identifier, imageUrl, key, name, priceTime100,
         productDiscription, productName, upc, upcCode;

+ (NSDictionary *)parameterNameMap {
  NSDictionary *map =
    [NSDictionary dictionaryWithObject:@"id"
                                forKey:@"identifier"];
  return map;
}

#pragma mark -
#pragma mark Service level methods
// These create a GTLQueryProduct object.

+ (id)queryForGetWithIdentifier:(NSString *)identifier {
  NSString *methodName = @"product.get";
  GTLQueryProduct *query = [self queryWithMethodName:methodName];
  query.identifier = identifier;
  query.expectedObjectClass = [GTLProductProduct class];
  return query;
}

+ (id)queryForInsertWithObject:(GTLProductProduct *)object {
  if (object == nil) {
    GTL_DEBUG_ASSERT(object != nil, @"%@ got a nil object", NSStringFromSelector(_cmd));
    return nil;
  }
  NSString *methodName = @"product.insert";
  GTLQueryProduct *query = [self queryWithMethodName:methodName];
  query.bodyObject = object;
  query.expectedObjectClass = [GTLProductProduct class];
  return query;
}

+ (id)queryForPatchWithIdentifier:(NSString *)identifier {
  NSString *methodName = @"product.patch";
  GTLQueryProduct *query = [self queryWithMethodName:methodName];
  query.identifier = identifier;
  query.expectedObjectClass = [GTLProductProduct class];
  return query;
}

#pragma mark -
#pragma mark "search" methods
// These create a GTLQueryProduct object.

+ (id)queryForSearchNameWithName:(NSString *)name {
  NSString *methodName = @"product.search.name";
  GTLQueryProduct *query = [self queryWithMethodName:methodName];
  query.name = name;
  query.expectedObjectClass = [GTLProductCollection class];
  return query;
}

+ (id)queryForSearchUpcWithUpc:(NSString *)upc {
  NSString *methodName = @"product.search.upc";
  GTLQueryProduct *query = [self queryWithMethodName:methodName];
  query.upc = upc;
  query.expectedObjectClass = [GTLProductCollection class];
  return query;
}

#pragma mark -
#pragma mark Service level methods
// These create a GTLQueryProduct object.

+ (id)queryForUpdateWithObject:(GTLProductProduct *)object {
  if (object == nil) {
    GTL_DEBUG_ASSERT(object != nil, @"%@ got a nil object", NSStringFromSelector(_cmd));
    return nil;
  }
  NSString *methodName = @"product.update";
  GTLQueryProduct *query = [self queryWithMethodName:methodName];
  query.bodyObject = object;
  query.expectedObjectClass = [GTLProductProduct class];
  return query;
}

@end
