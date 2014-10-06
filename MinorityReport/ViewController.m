//
//  ViewController.m
//  MinorityReport
//
//  Created by Eduardo Alvarado Díaz on 10/2/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *theFuture;
@property (weak, nonatomic) IBOutlet UILabel *thePreCogs;
@property CGPoint originalCenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.originalCenter = self.theFuture.center;
}

- (IBAction)onDrag:(UIPanGestureRecognizer *)panGesture{
    //NSLog(@"On Drag");
    CGPoint point = [panGesture locationInView:self.view];
    self.theFuture.center = point;

    if(panGesture.state == UIGestureRecognizerStateEnded ){
        [UIView animateWithDuration:1.0 animations:^{
            self.theFuture.center = self.originalCenter;
        }];
    }else{

        if( CGRectContainsPoint(self.thePreCogs.frame, point)){
            self.theFuture.backgroundColor = [UIColor redColor];
            self.theFuture.text = @"A ficticious and incriminating future";
            [self.theFuture sizeToFit];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
