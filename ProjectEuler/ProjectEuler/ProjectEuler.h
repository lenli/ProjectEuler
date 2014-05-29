//
//  LCLProblem2.h
//  ProjectEuler
//
//  Created by Leonard Li on 5/23/14.
//  Copyright (c) 2014 Leonard Li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectEuler : NSObject
+ (NSInteger)p1NaturalLoopSumOf:(NSInteger)firstNumber
                      andNumber:(NSInteger)secondNumber
                    notToExceed:(NSInteger)maxNumber;
+ (NSInteger)p2SumEvenFibonacciSequenceUnder:(NSInteger)maxNumber;
+ (long long)p3LargestPrimeFactorof:(long long)number;
+ (NSInteger)p4LargestPalidromeFromProductOfNumbersLessThan:(NSInteger)maxNumber;
+ (NSInteger)p5SmallestNumberEvenlyDivisibleByAllNumbersUnder:(NSInteger)maxNumber;
+ (NSInteger)p6differenceBetweenSumOfSquaresAndSquareOfSumsForNumbers:(NSInteger)quantityOfNumbers;
+ (NSInteger)p7findNthPrimeNumberWhere:(NSInteger)nthPrimeNumber;
+ (long long)p8findAdjacentDigitsWithGreatestProduct:(NSInteger)numberofDigits;
+ (NSInteger)p9PythagoreanTripletWhereSum:(NSInteger)sumOfTriplet;
+ (long long)p10SumOfPrimesBelow:(NSInteger)maxPrime;
+ (long long)p11ProductOfAdjacentNumbers:(NSInteger)quantityOfAdjacentNumbers;
+ (long long)p16SumOfPowerTwoToDigits:(NSInteger)powerOfTwo;
@end
