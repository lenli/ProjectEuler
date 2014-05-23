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

@end
