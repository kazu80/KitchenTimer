//
//  ViewController.h
//  ProgKitchenTImer
//
//  Created by kazuyoshi kawakami on 13/06/09.
//  Copyright (c) 2013年 kazuyoshi kawakami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel *labelTime;
    NSTimer *tm;
    int minute;
    int second;
}

@property (retain, nonatomic) IBOutlet UILabel *labelTime;

- (IBAction)clickStart:(id)sender;

- (IBAction)clickStop:(id)sender;

- (void)onTimer:(NSTimer*)timer;

@property (retain, nonatomic) IBOutlet UIPickerView *picker;

- (IBAction)clickSetting:(id)sender;

@end
