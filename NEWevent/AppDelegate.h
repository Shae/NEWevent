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
    NSMutableArray *favEvents;
    NSString *askAgain;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *viewController;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (weak, nonatomic) NSString *defaultKingdom;

//+(void)setDefaultKingdom:(NSString *)newDefaultKingdom;

@end
