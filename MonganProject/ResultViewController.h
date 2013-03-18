//
//  ResultViewController.h
//  MonganProject
//
//  Created by Matthew Hinkle on 3/16/13.
//  Copyright (c) 2013 Matthew Hinkle. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ModalLoadingOverlayController.h"
#import "MonganProjectService.h"

@interface ResultViewController : UITableViewController <UISearchBarDelegate>
@property (nonatomic, strong) NSString * upc;
@property (nonatomic) BOOL searchByUpc;
@end
