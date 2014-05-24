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

    NSDate *startTime = [NSDate date];

        // Problem 1
        NSInteger naturalSum = 0;
        for (NSInteger i=1; i<maxNumber; i++) {
            if (i % firstNumber == 0 || i % secondNumber == 0) {
                naturalSum += i;
            }
        }
    
        //    Probably a faster, but harder to understand solution
        //    Using Arthimetic Sum of Series formula:
        //
        //    NSInteger threes = 333*(3+999)/2;
        //    NSInteger fives = 199*(5+995)/2;
        //    NSInteger fifteens = 66*(15+990)/2;
        //    NSInteger seriesSolution = threes + fives - fifteens;
        //
        //    NSLog(@"Arthimetic Series Solution is:  %d", seriesSolution);
        
    
    NSDate *endTime = [NSDate date];
    NSTimeInterval runTime = [endTime timeIntervalSinceDate:startTime];
    NSLog(@"Problem 1: %d, Run Time = %f", naturalSum, runTime);
    return naturalSum;
}

+ (NSInteger)p2SumEvenFibonacciSequenceUnder:(NSInteger)maxNumber {
    
    NSDate *startTime = [NSDate date];
    
        // Problem 2
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
    
    NSDate *endTime = [NSDate date];
    NSTimeInterval runTime = [endTime timeIntervalSinceDate:startTime];
    NSLog(@"Problem 2: %d, Run Time = %f", fibonacciSum, runTime);
    return fibonacciSum;
}

+ (long long)p3LargestPrimeFactorof:(long long)originalNumber {
    
    NSDate *startTime = [NSDate date];
    
        // Problem 3
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
    
    NSDate *endTime = [NSDate date];
    NSTimeInterval runTime = [endTime timeIntervalSinceDate:startTime];
    NSLog(@"Problem 3: %lld, Run Time = %f", maxPrimeFound, runTime);
    return maxPrimeFound;
}

+ (NSInteger)p4LargestPalidromeFromProductOfNumbersLessThan:(NSInteger)maxNumber {
    
    NSDate *startTime = [NSDate date];

        // Problem 4
        NSInteger maxPalidrome = 0;
        for (NSInteger i = maxNumber; i > 0; i--) {
            for (NSInteger j = maxNumber; j > 0; j--) {
                NSInteger product = i * j;
                if (product > maxPalidrome) {
                    NSString *productString = [NSString stringWithFormat:@"%d", product];
                    
                    NSMutableArray *productArray = [NSMutableArray new];
                    for (NSInteger k = 0; k < [productString length]; k++) {
                        NSString *character = [NSString stringWithFormat:@"%c", [productString characterAtIndex:k]];
                        [productArray addObject:character];
                    }
                    NSMutableArray *productReversed = [NSMutableArray arrayWithArray:[[productArray reverseObjectEnumerator] allObjects]];
                    
                    if ([productArray isEqualToArray:productReversed]) {
                        if (product > maxPalidrome) {
                            maxPalidrome = product;
                        }
                    }
                }
            }
        }
    
    NSDate *endTime = [NSDate date];
    NSTimeInterval runTime = [endTime timeIntervalSinceDate:startTime];
    NSLog(@"Problem 4: %d, Run Time = %f", maxPalidrome, runTime);
    return maxPalidrome;
}

@end
