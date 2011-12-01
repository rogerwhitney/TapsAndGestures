//
//  ViewController.h
//  TapsGestures
//
//  Created by Roger Whitney on 11/30/11.
//  Copyright (c) 2011 San Diego State University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *touchCount;
@property (retain, nonatomic) IBOutlet UILabel *tapCount;
@property (retain, nonatomic) IBOutlet UILabel *touchX;
@property (retain, nonatomic) IBOutlet UILabel *touchY;
@property (retain, nonatomic) IBOutlet UILabel *swipDirection;
@property (retain, nonatomic) IBOutlet UILabel *pinchVelocity;
@property (retain, nonatomic) IBOutlet UILabel *pinchScale;
@property (retain, nonatomic) IBOutlet UILabel *accelerometer;
@property (retain, nonatomic) IBOutlet UILabel *pinchText;

@end
