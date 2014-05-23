//
//  LCLProblem2.m
//  ProjectEuler
//
//  Created by Leonard Li on 5/23/14.
//  Copyright (c) 2014 Leonard Li. All rights reserved.
//

#import "ProjectEuler.h"

@implementation ProjectEuler

+ (NSInteger)p1NaturalLoopSumOf:(NSInteger)firstNumber
                      andNumber:(NSInteger)secondNumber
                    notToExceed:(NSInteger)maxNumber {

    //    Probably a faster, but harder to understand solution
    //    Using Arthimetic Sum of Series formula:
    //
    //    NSInteger threes = 333*(3+999)/2;
    //    NSInteger fives = 199*(5+995)/2;
    //    NSInteger fifteens = 66*(15+990)/2;
    //    NSInteger seriesSolution = threes + fives - fifteens;
    //
    //    NSLog(@"Arthimetic Series Solution is:  %d", seriesSolution);
    
    NSInteger naturalSum = 0;
    for (NSInteger i=1; i<maxNumber; i++) {
        if (i % firstNumber == 0 || i % secondNumber == 0) {
            naturalSum += i;
        }
    }
    return naturalSum;
}

+ (NSInteger)p2SumEvenFibonacciSequenceUnder:(NSInteger)maxNumber {
    
    NSMutableArray *fibonacciSequence = [NSMutableArray new];
    [fibonacciSequence addObject:@(1)];
    [fibonacciSequence addObject:@(2)];
    NSInteger fibonacciSum = 2;
    NSInteger currentSum = 3;
    
    while (currentSum < maxNumber) {
        NSInteger lastNumber = [[fibonacciSequence lastObject] integerValue];
        [fibonacciSequence addObject:@(currentSum)];
        currentSum += lastNumber;
        if (currentSum % 2 == 0 && currentSum < maxNumber) {
            fibonacciSum += currentSum;
        }
    }
    return fibonacciSum;
}

+ (long long)p3LargestPrimeFactorof:(long long)originalNumber {
    long long potentialPrime = 3;
    long long maxPrimeFound = 3;
    NSMutableArray *primes = [NSMutableArray arrayWithArray:@[@2, @3]];
    
    while (potentialPrime < sqrt(originalNumber)) {
        if (originalNumber % potentialPrime == 0) {
            BOOL isPrime = YES;
            for (NSNumber *prime in primes) {
                if (potentialPrime % [prime longLongValue] == 0) {
                    isPrime = NO;
                }
            }
            if (isPrime) {
                [primes addObject:@(potentialPrime)];
                maxPrimeFound = potentialPrime;
            }
        }
        potentialPrime = potentialPrime + 2;
    }
    return maxPrimeFound;
}

@end
