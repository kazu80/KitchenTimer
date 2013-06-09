//
//  ViewController.m
//  ProgKitchenTImer
//
//  Created by kazuyoshi kawakami on 13/06/09.
//  Copyright (c) 2013年 kazuyoshi kawakami. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_labelTime release];
    [_picker release];
    [super dealloc];
}

- (IBAction)clickStart:(id)sender {
//    minute = 0;
//    second = 10;
    
    tm = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(onTimer:) userInfo:nil repeats:YES];
    
}

- (IBAction)clickStop:(id)sender {
    [tm invalidate];
}

-(void)onTimer:(NSTimer *)timer
{
    
    if ( --second < 0 ) {
        second = 60;
        minute --;
        if ( minute < 0) {
            [tm invalidate];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"時間です" delegate:self cancelButtonTitle:@"ｏｋ" otherButtonTitles:nil, nil];
            [alert show];
            minute = 0;
            second = 0;
            return;
        }
    }
    
    NSString *text = [NSString stringWithFormat:@"%02d分%02d秒%02d", minute, second, 0];
    NSLog(@"%@",text);
    _labelTime.text = text;
}



- (IBAction)clickSetting:(id)sender {
    if ( _picker.isHidden) {
        _picker.hidden = NO;
    } else {
        _picker.hidden = YES;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if ( component == 0 ){
        return 99;
    } else {
        return 60;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *text = @"";
    if ( component == 0 ) {
        text = [NSString stringWithFormat:@"%02d分", row];
    } else {
        text = [NSString stringWithFormat:@"%02d秒", row];
    }
    return text;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

    if ( component == 0 ) {
        minute = row;
    } else {
        second = row;
    }

}

@end
