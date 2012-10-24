//
//  KingdomList.m
//  NEWevent
//
//  Created by Shae Klusman on 10/23/12.
//  Copyright (c) 2012 Shae Klusman. All rights reserved.
//

#import "KingdomList.h"
#import "KingdomCustomCell.h"
#import "AppDelegate.h"
#import "OpeningOptions.h"
#import "kingdomChoiceLoad.h"

@interface KingdomList ()

@end

@implementation KingdomList

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
     //     imageView1.image = [UIImage imageNamed:@"SCA-WaterMark.png"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    kingdomArray = [NSArray arrayWithObjects: @"Aethelmearc", @"Ansteorra", @"An Tir", @"Artemisia", @"Atenveldt", @"Atlantia", @"Caid", @"Calontir", @"Drachenwald", @"Ealdormere", @"East", @"Gleann Abhann", @"Lochac", @"Meridies", @"Middle", @"Northshield", @"Outlands", @"Trimaris", @"West", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [kingdomArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    KingdomCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"KingdomCustomCell" owner:nil options:nil];
        for(UIView *view in views)
        {
            if([view isKindOfClass:[KingdomCustomCell class]])
            {
                cell = (KingdomCustomCell*) view;
                
                // Setting Cell eventLabel to kingdomArray index
                cell.eventLabel.text = [kingdomArray objectAtIndex:indexPath.row];
            }
        }
    }
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    selection = [kingdomArray objectAtIndex:indexPath.row];
    
   if (appDelegate.defaultKingdom == nil)
    {
        
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Save Kingdom Choice?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Save to Settings", @"Not Now", nil];
        actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
        [actionSheet showInView:self.view];
    }else{
            NSLog(@"%@", selection);
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"clickedButtonAtIndex");    
    if  (buttonIndex == 0)
    {
        NSLog(@" Index 0");
        //Enter code here to set kingdom default choice.
            AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        appDelegate.defaultKingdom = selection;
        kingdomChoiceLoad *home = [[kingdomChoiceLoad alloc] initWithNibName:@"kingdomChoiceLoad" bundle:nil];
        [home setModalTransitionStyle: UIModalTransitionStyleCrossDissolve];
        [self presentViewController:home animated:YES completion:nil];
    }
    if (buttonIndex == 1)
    {
        NSLog(@" Index 1");
        //Enter Code here for Screen swap with kingdom index selection.
        
    }
    if (buttonIndex == 2)
    {
        NSLog(@" Default kingdom save, Canceled");
    }
}
@end
