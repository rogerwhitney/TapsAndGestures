//
//  ViewController.m
//  TapsGestures
//
//  Created by Roger Whitney on 11/30/11.
//  Copyright (c) 2011 San Diego State University. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize touchCount;
@synthesize tapCount;
@synthesize touchX;
@synthesize touchY;
@synthesize swipDirection;
@synthesize pinchVelocity;
@synthesize pinchScale;
@synthesize accelerometer;
@synthesize pinchText;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSUInteger numberTouches = [touches   count];
    NSString * count = [NSString stringWithFormat:@"%i", numberTouches];
    touchCount.text = count;
    tapCount.text = [NSString stringWithFormat:@"%i", [[touches anyObject] tapCount]];
    
    UITouch * aTouch = [touches anyObject];
    CGPoint location = [aTouch locationInView:self.view];
    touchX.text = [NSString stringWithFormat:@"%.1f", location.x];
    touchY.text = [NSString stringWithFormat:@"%0.1f", location.y];
    [super touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event];
}
- (void) handlePinchGesture: (UIPinchGestureRecognizer *) sender {
    pinchScale.text = [NSString stringWithFormat:@"%.3f", sender.scale];
    pinchVelocity.text = [NSString stringWithFormat:@"%.3f", sender.velocity];
    static CGFloat initialFontSize;
    
    if (sender.state == UIGestureRecognizerStateBegan)
        {
        initialFontSize = pinchText.font.pointSize;
        }
    CGFloat newFontSize =  initialFontSize * sender.scale;
    if (isnan(newFontSize)) return;
    if (newFontSize < 5) newFontSize =5;
    if (newFontSize > 1000) newFontSize = 1000;
    pinchText.font = [UIFont systemFontOfSize: newFontSize];
}

- (void) handleSwipeGesture: (UISwipeGestureRecognizer *) sender {
    NSString * direction;
    switch (sender.direction) {
        case UISwipeGestureRecognizerDirectionRight:
            direction = @"Right";
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            direction = @"Left";
            break;
        case UISwipeGestureRecognizerDirectionUp:
            direction = @"Up";
            break;
        case UISwipeGestureRecognizerDirectionDown:
            direction = @"Down";
            break;
        default:
             direction = @"None";
            break;
    }
    swipDirection.text = direction;
 }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)createAndStartGestureRecognizers
{
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]
                                            initWithTarget:self action:@selector(handleSwipeGesture:)];
    swipeRight.direction =  UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    [swipeRight release];
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc]
                                         initWithTarget:self action:@selector(handleSwipeGesture:)];
    swipeUp.direction =  UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUp];
    [swipeUp release];
    
    UIPinchGestureRecognizer * pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
    [self.view addGestureRecognizer:pinch];
    [pinch release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self createAndStartGestureRecognizers];

}

- (void)viewDidUnload
{
    [self setTouchCount:nil];
    [self setTapCount:nil];
    [self setTouchX:nil];
    [self setTouchY:nil];
    [self setSwipDirection:nil];
    [self setPinchVelocity:nil];
    [self setPinchScale:nil];
    [self setAccelerometer:nil];
    [self setPinchText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (void)dealloc {
    [touchCount release];
    [tapCount release];
    [touchX release];
    [touchY release];
    [swipDirection release];
    [pinchVelocity release];
    [pinchScale release];
    [accelerometer release];
    [pinchText release];
    [super dealloc];
}
@end
