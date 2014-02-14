//
//  TalkViewController.m
//  spinner
//
//  Created by Dhaya on 10/02/14.
//  Copyright (c) 2014 Dhaya. All rights reserved.
//

#import "TalkViewController.h"

@interface TalkViewController ()

@end

@implementation TalkViewController
@synthesize mainArray;
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *sevenView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"seven.png"]];
    UIImageView *barView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"crown.png"]];
    UIImageView *crownView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cherry.png"]];
    UIImageView *cherryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bar.png"]];
    UIImageView *lemonView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lemon.png"]];
    UIImageView *appleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"default-icon.png"]];
    mainArray = [[NSArray alloc] initWithObjects:
                               sevenView,barView, crownView,cherryView,lemonView,appleView,sevenView,barView, crownView,cherryView,lemonView,appleView,sevenView,barView, crownView,cherryView,lemonView,appleView,sevenView,barView, crownView,cherryView,lemonView,appleView,sevenView,barView, crownView,cherryView,lemonView,appleView,nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
	return [mainArray count];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 100;
}
-(UIView *)pickerView:(UIPickerView *)pickerView
           viewForRow:(NSInteger)row
         forComponent:(NSInteger)component reusingView:(UIView *)view
{
    // self.myImages is an array of UIImageView objects
    UIView * myView = [mainArray objectAtIndex:row];
    
    // first convert to a UIImage
    UIGraphicsBeginImageContextWithOptions(myView.bounds.size, NO, 0);
    
    [myView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    // then convert back to a UIImageView and return it
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    return imageView;
	return [mainArray objectAtIndex:row];
}

- (IBAction)buttonClick:(id)sender
{
    NSUInteger number = arc4random_uniform(mainArray.count);
  
 //   [picker selectRow:(arc4random() % [mainArray count]) inComponent:0 animated:YES];
   [picker selectRow:(arc4random() % [self pickerView:picker numberOfRowsInComponent:0]) inComponent:0 animated:YES];
    
    [self performSelector:@selector(scrollPicker:selectedRow:) withObject:self afterDelay:1.0 ];
    //[self scrollPicker:picker selectedRow:(arc4random() % [self pickerView:picker numberOfRowsInComponent:0])];
//    [picker1 selectRow:(arc4random() % [self pickerView:picker1 numberOfRowsInComponent:0]) inComponent:0 animated:YES];
//      [picker2 selectRow:(arc4random() % [self pickerView:picker2 numberOfRowsInComponent:0]) inComponent:0 animated:YES];
}
- (void)scrollPicker:(UIPickerView *)picekerview selectedRow:(NSInteger) row
{
     [picker1 selectRow:(arc4random() % [self pickerView:picker1 numberOfRowsInComponent:0]) inComponent:0 animated:YES];
     [self performSelector:@selector(scrollPicker1:selectedRow:) withObject:self afterDelay:1.0 ];
}
- (void)scrollPicker1:(UIPickerView *)picekerview selectedRow:(NSInteger) row
{
    [picker2 selectRow:(arc4random() % [self pickerView:picker2 numberOfRowsInComponent:0]) inComponent:0 animated:YES];
}
-(void)pickerView:(UIPickerView *)pickerView
     didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    if (pickerView == picker) {
        [picker1 selectRow:(arc4random() % [self pickerView:picker1 numberOfRowsInComponent:0]) inComponent:0 animated:YES];
    }
}
@end
