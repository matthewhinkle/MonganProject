/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2013 Google Inc.
 */

//
//  GTLUseritemsKey.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   useritems/v1
// Description:
//   This is an API
// Classes:
//   GTLUseritemsKey (0 custom class methods, 7 custom properties)

#import "GTLUseritemsKey.h"

// ----------------------------------------------------------------------------
//
//   GTLUseritemsKey
//

@implementation GTLUseritemsKey
@dynamic appId, complete, identifier, kind, name, namespaceProperty, parent;

+ (NSDictionary *)propertyToJSONKeyMap {
  NSDictionary *map =
    [NSDictionary dictionaryWithObjectsAndKeys:
      @"id", @"identifier",
      @"namespace", @"namespaceProperty",
      nil];
  return map;
}

@end
