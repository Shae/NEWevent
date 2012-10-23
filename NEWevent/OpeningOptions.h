//
//  OpeningOptions.h
//  NEWevent
//
//  Created by Shae Klusman on 10/22/12.
//  Copyright (c) 2012 Shae Klusman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OpeningOptions : UIViewController
{
    __weak IBOutlet UIButton *searchEventBTN;
    __weak IBOutlet UIButton *favoritesBTN;
    __weak IBOutlet UIButton *settingsBTN;
}

-(IBAction)listBtnClick:(id)sender;
-(IBAction)favBtnClick:(id)sender;
-(IBAction)optBtnClick:(id)sender;

@end
