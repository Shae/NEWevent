//
//  OpeningOptions.m
//  NEWevent
//
//  Created by Shae Klusman on 10/22/12.
//  Copyright (c) 2012 Shae Klusman. All rights reserved.
//

#import "OpeningOptions.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "KingdomList.h"
#import "AppDelegate.h"
#import "kingdomChoiceLoad.h"

@interface OpeningOptions ()

@end

@implementation OpeningOptions

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
     self.hidesBottomBarWhenPushed = YES;
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)listBtnClick:(id)sender
{
    // reach into the AppDelegate to get a variable
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // Check to see if a default Kingdom has been chosen
    if (appDelegate.defaultKingdom == nil) {
        
        KingdomList *kingdomView = [[KingdomList alloc] initWithNibName:@"KingdomList" bundle:nil];
        [kingdomView setModalTransitionStyle: UIModalTransitionStyleCrossDissolve];
        [self presentViewController:kingdomView animated:YES completion:nil];
        
    }else{
        NSLog(@"defaultKingdom in AppDelegate is set to: %@", appDelegate.defaultKingdom);
         kingdomChoiceLoad *chosenKingdom = [[kingdomChoiceLoad alloc] initWithNibName:@"kingdomChoiceLoad" bundle:nil];
        [chosenKingdom setModalTransitionStyle: UIModalTransitionStyleCrossDissolve];
        [self presentViewController:chosenKingdom animated:YES completion:nil];
    }


}

-(IBAction)favBtnClick:(id)sender
{
    
}

-(IBAction)optBtnClick:(id)sender
{
    
}


@end
