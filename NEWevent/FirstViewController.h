//
//  FirstViewController.h
//  NEWevent
//
//  Created by Shae Klusman on 10/22/12.
//  Copyright (c) 2012 Shae Klusman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableDictionary *data;
    NSString *path;
    
    __weak IBOutlet UITableView *eventTableView;
}

-(NSString*)dateConvert: (NSString*)dateIn;
-(NSString*)dayConvert: (NSString*)dateIn;

@end
