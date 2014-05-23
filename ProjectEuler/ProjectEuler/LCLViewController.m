//
//  LCLViewController.m
//  ProjectEuler
//
//  Created by Leonard Li on 5/23/14.
//  Copyright (c) 2014 Leonard Li. All rights reserved.
//

#import "LCLViewController.h"
#import "ProjectEuler.h"

@interface LCLViewController ()

@end

@implementation LCLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Even though Project Euler is traditionally meant to seek the fastest solution,
    // I am implementing for also the more understandable solution as well.
    // An answer that is super fast, but that nobody can understand easily is difficult to debug.
    
    NSLog(@"Problem 1: %d", [ProjectEuler p1NaturalLoopSumOf:3 andNumber:5 notToExceed:1000]);
    NSLog(@"Problem 2: %d", [ProjectEuler p2SumEvenFibonacciSequenceUnder:4000000]);
    NSLog(@"Problem 3: %lld", [ProjectEuler p3LargestPrimeFactorof:600851475143]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
