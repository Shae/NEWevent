//
//  KingdomCustomCell.h
//  NEWevent
//
//  Created by Shae Klusman on 10/23/12.
//  Copyright (c) 2012 Shae Klusman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KingdomCustomCell : UITableViewCell
{
    
    __weak IBOutlet UILabel *eventLabel;
}
@property (weak, nonatomic) IBOutlet UILabel *eventLabel;
@end
