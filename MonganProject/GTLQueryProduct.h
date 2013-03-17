/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2013 Google Inc.
 */

//
//  GTLQueryProduct.h
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   product/v1
// Description:
//   This is an API
// Classes:
//   GTLQueryProduct (4 custom class methods, 3 custom properties)

#if GTL_BUILT_AS_FRAMEWORK
  #import "GTL/GTLQuery.h"
#else
  #import "GTLQuery.h"
#endif

@class GTLProductProduct;

@interface GTLQueryProduct : GTLQuery

//
// Parameters valid on all methods.
//

// Selector specifying which fields to include in a partial response.
@property (copy) NSString *fields;

//
// Method-specific parameters; see the comments below for more information.
//
@property (copy) NSString *name;
@property (copy) NSString *upc;

#pragma mark -
#pragma mark Service level methods
// These create a GTLQueryProduct object.

// Method: product.insert
// Fetches a GTLProductProduct.
+ (id)queryForInsertWithObject:(GTLProductProduct *)object;

#pragma mark -
#pragma mark "search" methods
// These create a GTLQueryProduct object.

// Method: product.search.name
// Fetches a GTLProductCollection.
+ (id)queryForSearchNameWithName:(NSString *)name;

// Method: product.search.upc
// Fetches a GTLProductCollection.
+ (id)queryForSearchUpcWithUpc:(NSString *)upc;

#pragma mark -
#pragma mark Service level methods
// These create a GTLQueryProduct object.

// Method: product.update
// Fetches a GTLProductProduct.
+ (id)queryForUpdateWithObject:(GTLProductProduct *)object;

@end
