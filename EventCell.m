//
//  EventCell.m
//  NEWevent
//
//  Created by Shae Klusman on 10/23/12.
//  Copyright (c) 2012 Shae Klusman. All rights reserved.
//

#import "EventCell.h"

@implementation EventCell
@synthesize mainLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
