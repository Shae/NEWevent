//
//  FirstViewController.m
//  NEWevent
//
//  Created by Shae Klusman on 10/22/12.
//  Copyright (c) 2012 Shae Klusman. All rights reserved.
//

#import "FirstViewController.h"
#import "EventCell.h"
#import "AppDelegate.h"


@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [eventTableView registerNib:[UINib nibWithNibName:@"EventCell" bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"EventCell"];
    
    
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    path = [documentsDirectory stringByAppendingPathComponent:@"data.plist"]; //3
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: path]) //4
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];  //5
        [fileManager  copyItemAtPath:bundle toPath:path error:&error]; //6
    }else{
        NSLog(@"The plist was located at this path");
    }
   
    ///// READ pLIST DATA ///////
    NSMutableDictionary *savedStock = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    
    //load from savedStock example int value
    int value;
    value = [[savedStock objectForKey:@"value"] intValue];
    data = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    NSLog(@"DATA : %@", data);
  /*
    //////////// WRITE pLIST DATA ////////////////
    //here add elements to data file and write data to file
    int savevalue = 5;
    [data setObject:[NSNumber numberWithInt:savevalue] forKey:@"value"];
    [data writeToFile: path atomically:YES];
    NSLog(@"Write to pList" ); */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 0;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [data count];
    NSLog(@"data count = %i", [data count]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    static NSString *CellIdentifier = @"EventCell";
    EventCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell != nil)
    {
         NSDictionary *myItem = [appDelegate.eventArray objectAtIndex:indexPath.row];
                // Setting Cell eventLabel to kingdomArray index
                cell.mainLabel.text = [ myItem objectForKey:@"summary"];
        NSLog(@"%@", [myItem objectForKey:@"summary"]);
    }
    return cell;
}@end
