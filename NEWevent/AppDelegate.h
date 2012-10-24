//
//  AppDelegate.h
//  NEWevent
//
//  Created by Shae Klusman on 10/22/12.
//  Copyright (c) 2012 Shae Klusman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>
{
    __weak NSString *defaultKingdom;
    __strong NSMutableArray *eventArray;
    BOOL autoUpdate;
    NSMutableArray *favEvents;
    NSString *askAgain;
    
    NSURLRequest *request;
    NSURL *url;
    NSURLConnection *connection;
    NSData *myData;
    NSMutableData *requestedData;
    NSInteger numItems;
    NSMutableArray *stuff;
    NSDictionary *eventObject;
    //an array of event objects built from the factory
    __strong NSMutableArray *eventClassObjArray;

}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *viewController;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (weak, nonatomic) NSString *defaultKingdom;
@property (strong, nonatomic) NSMutableArray *eventArray;
@property (strong, nonatomic) NSMutableArray *eventClassObjArray;
@property (nonatomic) BOOL autoUpdate;


-(void)buildEventData;

@end
