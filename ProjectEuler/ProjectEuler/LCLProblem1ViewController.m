//
//  LCLProblem1ViewController.m
//  ProjectEuler
//
//  Created by Leonard Li on 5/23/14.
//  Copyright (c) 2014 Leonard Li. All rights reserved.
//

#import "LCLProblem1ViewController.h"

@interface LCLProblem1ViewController ()

@end

@implementation LCLProblem1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    static NSInteger maxNumber = 1000;
    
    NSInteger naturalSum = 0;
    for (NSInteger i=1; i<maxNumber; i++) {
        if (i % 3 == 0 || i % 5 == 0) {
            naturalSum += i;
        }
    }
    NSLog(@"Loop Solution is:  %d", naturalSum);

    
    NSInteger threes = 333*(3+999)/2;
    NSInteger fives = 199*(5+995)/2;
    NSInteger fifteens = 66*(15+990)/2;
    NSInteger seriesSolution = threes + fives - fifteens;
    
    NSLog(@"Arthimetic Series Solution is:  %d", seriesSolution);
}



@end
