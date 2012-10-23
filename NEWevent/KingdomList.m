//
//  KingdomList.m
//  NEWevent
//
//  Created by Shae Klusman on 10/23/12.
//  Copyright (c) 2012 Shae Klusman. All rights reserved.
//

#import "KingdomList.h"
#import "KingdomCustomCell.h"

@interface KingdomList ()

@end

@implementation KingdomList

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
    kingdomArray = [NSArray arrayWithObjects: @"Aethelmearc", @"Ansteorra", @"An Tir", @"Artemisia", @"Atenveldt", @"Atlantia", @"Caid", @"Calontir", @"Drachenwald", @"Ealdormere", @"East", @"Gleann Abhann", @"Lochac", @"Meridies", @"Middle", @"Northshield", @"Outlands", @"Trimaris", @"West", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
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
                
                NSDictionary *myItem = [kingdomArray objectAtIndex:indexPath.row];
      /*          NSString *date = [myItem objectForKey:@"start"];

                NSArray* foo = [date componentsSeparatedByString: @"T"];
                NSArray* bar = [[foo objectAtIndex: 0] componentsSeparatedByString:@"-"];
                NSString* cutDate = [[NSString alloc] initWithFormat:@"%@-%@-%@", [bar objectAtIndex: 1],[bar objectAtIndex: 2], [bar objectAtIndex: 0]];
                
                cell.mainLabel.text = [myItem objectForKey:@"summary"];
                cell.subLabel.text = cutDate;*/
                
            }
            
        }
        
    }
    
    return cell;
}

@end
