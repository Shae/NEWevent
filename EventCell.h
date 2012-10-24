//
//  EventCell.h
//  NEWevent
//
//  Created by Shae Klusman on 10/23/12.
//  Copyright (c) 2012 Shae Klusman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventCell : UITableViewCell
{
    __weak IBOutlet UILabel *mainLabel;
}
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@end
