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
    
    // 10 Find the sum of all the primes below two million.
    [ProjectEuler p10SumOfPrimesBelow:2000000];
    
    // 9 There exists exactly one Pythagorean triplet for which a + b + c = 1000.  Find the product abc.
    [ProjectEuler p9PythagoreanTripletWhereSum:1000];
    
    // 8 - Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?
    [ProjectEuler p8findAdjacentDigitsWithGreatestProduct:13];
    
    // 7 -- What is the 10001st prime number?
    [ProjectEuler p7findNthPrimeNumberWhere:10001];
    
    // 6 -- Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
    [ProjectEuler p6differenceBetweenSumOfSquaresAndSquareOfSumsForNumbers:100];
    
    // 5 -- What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
    [ProjectEuler p5SmallestNumberEvenlyDivisibleByAllNumbersUnder:20];
    
    // 4 -- Find the largest palindrome made from the product of two 3-digit numbers.
    [ProjectEuler p4LargestPalidromeFromProductOfNumbersLessThan:999];
    
    // 3 -- What is the largest prime factor of the number 600851475143?
    [ProjectEuler p3LargestPrimeFactorof:600851475143];
    
    // 2 -- By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
    [ProjectEuler p2SumEvenFibonacciSequenceUnder:4000000];
    
    // 1 -- Find the sum of all the multiples of 3 or 5 below 1000.
    [ProjectEuler p1NaturalLoopSumOf:3 andNumber:5 notToExceed:1000];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
