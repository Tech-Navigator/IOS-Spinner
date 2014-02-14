//
//  TalkViewController.h
//  spinner
//
//  Created by Dhaya on 10/02/14.
//  Copyright (c) 2014 Dhaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TalkViewController : UIViewController
{
    IBOutlet  UIPickerView *picker;
      IBOutlet  UIPickerView *picker1;
      IBOutlet  UIPickerView *picker2;
}
@property (nonatomic,retain) NSArray *mainArray;
- (IBAction)buttonClick:(id)sender;
@end
