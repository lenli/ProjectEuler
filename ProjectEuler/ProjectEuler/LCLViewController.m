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
    // I am implementing for also the most understandable solution as well.
    // An answer that is super fast, but that nobody can understand easily is difficult to debug.
    
    [ProjectEuler p1NaturalLoopSumOf:3 andNumber:5 notToExceed:1000];
    [ProjectEuler p2SumEvenFibonacciSequenceUnder:4000000];
    [ProjectEuler p3LargestPrimeFactorof:600851475143];
    [ProjectEuler p4LargestPalidromeFromProductOfNumbersLessThan:999];
    [ProjectEuler p5SmallestNumberEvenlyDivisibleByAllNumbersUnder:20];
    [ProjectEuler p6differenceBetweenSumOfSquaresAndSquareOfSumsForNumbers:100];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
