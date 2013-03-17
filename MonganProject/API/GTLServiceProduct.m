/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2013 Google Inc.
 */

//
//  GTLServiceProduct.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   product/v1
// Description:
//   This is an API
// Classes:
//   GTLServiceProduct (0 custom class methods, 0 custom properties)

#import "GTLProduct.h"

@implementation GTLServiceProduct

#if DEBUG
// Method compiled in debug builds just to check that all the needed support
// classes are present at link time.
+ (NSArray *)checkClasses {
  NSArray *classes = [NSArray arrayWithObjects:
                      [GTLQueryProduct class],
                      [GTLProductCollection class],
                      [GTLProductKey class],
                      [GTLProductProduct class],
                      nil];
  return classes;
}
#endif  // DEBUG

- (id)init {
  self = [super init];
  if (self) {
    // Version from discovery.
    self.apiVersion = @"v1";

    // From discovery.  Where to send JSON-RPC.
    // Turn off prettyPrint for this service to save bandwidth (especially on
    // mobile). The fetcher logging will pretty print.
    self.rpcURL = [NSURL URLWithString:@"https://monganproject.appspot.com/_ah/api/rpc?prettyPrint=false"];
  }
  return self;
}

@end
