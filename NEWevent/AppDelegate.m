//
//  AppDelegate.m
//  NEWevent
//
//  Created by Shae Klusman on 10/22/12.
//  Copyright (c) 2012 Shae Klusman. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "OpeningOptions.h"
#import "SBJSON.h"

@implementation AppDelegate
@synthesize defaultKingdom, eventArray, autoUpdate;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    ////// Retrieving Saved Settings ////////
    
    //Kingdom
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    defaultKingdom = [prefs stringForKey:@"kingdomSAVE"];
    autoUpdate = [prefs boolForKey:@"autoUpdateSAVE"];
    
     // Trying to retrieve an NSMutable array that was saved using NSKeyedArchiver
    NSData *dataRepresentingSavedArray = [prefs objectForKey:@"favEventsSAVE"];
    if (dataRepresentingSavedArray != nil)
    {
        NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
        if (oldSavedArray != nil)
            favEvents = [[NSMutableArray alloc] initWithArray:oldSavedArray];
        else
            favEvents = [[NSMutableArray alloc] init];
    }
    
    //Ask to save kingdom again
    askAgain = [prefs stringForKey:@"askAgainSAVE"];
    
    ////////////////////////////////////////////////////
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[OpeningOptions alloc] initWithNibName:@"OpeningOptions" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];

    
   /*
    // Override point for customization after application launch.
    UIViewController *viewController1 = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    UIViewController *viewController2 = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[viewController1, viewController2];
   //viewController0.hidesBottomBarWhenPushed = YES;
    self.window.rootViewController = self.tabBarController;
    
    [self.window makeKeyAndVisible];*/
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.

}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    ////////////  SAVE Settings  ////////////////////////
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:defaultKingdom forKey:@"kingdomSAVE"];
    [prefs setObject:askAgain forKey:@"askAgainSAVE"];
    [prefs setBool: 1 /*autoUpdate*/ forKey:@"autoUpdateSAVE"];
    
    
    // Trying to save an NSMutable array as a data object using NSKeyedArchiver
    if (favEvents != nil)
    {
        NSData *newSavedArray = [NSKeyedArchiver archivedDataWithRootObject:favEvents];
        [prefs setObject:newSavedArray forKey:@"favEventsSAVE"];
    }
    
    


    ///////////////////////////////////////////////////////////
}



/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

-(void)buildEventData
{
 
    numItems = 0;
    stuff = [[NSMutableArray alloc] init];
    
    url = [[NSURL alloc] initWithString:@"http://scalac.herokuapp.com/index"];
    request = [[NSURLRequest alloc] initWithURL:url];
    
    if (request != nil)
    {
        connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        requestedData = [NSMutableData data];
        
        //NSLog(@"%@", requestData);
        
    }
    NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSStringEncodingConversionAllowLossy error:nil];
    
    // Create SBJSON object to parse JSON
    SBJSON *parser = [[SBJSON alloc] init];
    
    // parse the JSON string into an object - assuming json_string is a NSString of JSON data
    eventObject = [[NSDictionary alloc] init];
    eventObject = [parser objectWithString:jsonString error:nil];
    
    numItems = [eventObject count];
    //NSLog(@"%@", eventObject); //works
    NSLog(@"%i", numItems); //works
    eventArray = [[NSMutableArray alloc] init];
    
    
    for (id key in eventObject)
    {
        
        NSString *currentKey = key;
        NSDictionary *currentObj = [eventObject objectForKey:currentKey];
        
        [eventArray addObject:currentObj];
        
        NSLog(@"%@", [currentObj objectForKey:@"summary"]);
        
    }

}
 
@end
