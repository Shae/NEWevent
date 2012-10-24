//
//  kingdomChoiceLoad.m
//  NEWevent
//
//  Created by Shae Klusman on 10/22/12.
//  Copyright (c) 2012 Shae Klusman. All rights reserved.
//

#import "kingdomChoiceLoad.h"
#import "AppDelegate.h"
#import "SBJSON.h"

@interface kingdomChoiceLoad ()

@end

@implementation kingdomChoiceLoad

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];   
    areaName.text = appDelegate.defaultKingdom;
    
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.center = CGPointMake(160, 210);
    spinner.hidesWhenStopped = YES;
    [self.view addSubview:spinner];
    [spinner startAnimating];

    
    if (appDelegate.autoUpdate == 1)
    {
        NSLog(@"autoUpdate set to YES.  -kingdomChoiceLoad- line 35");
    }
    /*  ////// EXTRAS ////////   
    if (appDelegate.defaultKingdom != nil)
    {
        NSLog(@"KINGDOM ALREADY SET TO : %@", appDelegate.defaultKingdom );
        //enter code for a URL data pull for pre-specified kingdom here
    }else {
        NSLog(@"No Kingdom SAVED in settings yet");
        //enter code for a URL data pull for seleced kingdom from kingdom list here
    }
    */
    if (appDelegate.eventArray != nil)
    {
        NSLog(@"NUMBER OF EVENTS NOW ON FILE: %i", [appDelegate.eventArray count]);
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    // Run method from app delegate for JSON pull.
    [appDelegate buildEventData];
    [spinner stopAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
