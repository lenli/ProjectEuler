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
        // Find the sum of all the multiples of 3 or 5 below 1000.
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
    NSLog(@"Problem 1: %d, Run Time (secs) = %f", naturalSum, runTime);
    return naturalSum;
}

+ (NSInteger)p2SumEvenFibonacciSequenceUnder:(NSInteger)maxNumber {
    
    NSDate *startTime = [NSDate date];
    
        // Problem 2
        // By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
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
    NSLog(@"Problem 2: %d, Run Time (secs) = %f", fibonacciSum, runTime);
    return fibonacciSum;
}

+ (long long)p3LargestPrimeFactorof:(long long)originalNumber {
    
    NSDate *startTime = [NSDate date];
    
        // Problem 3
        // What is the largest prime factor of the number 600851475143 ?
        long long potentialPrime;
        long long maxPrimeFound;
        NSMutableArray *primes = [NSMutableArray new];
        
        if (originalNumber > 2) {
            potentialPrime = 3;
            maxPrimeFound = 3;
            primes = [NSMutableArray arrayWithArray:@[@2, @3]];
            
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
        } else {
            if (originalNumber % 2 == 0) {
                maxPrimeFound = 2;
            } else {
                maxPrimeFound = 1;
            }
        }
    
    NSDate *endTime = [NSDate date];
    NSTimeInterval runTime = [endTime timeIntervalSinceDate:startTime];
    NSLog(@"Problem 3: %lld, Run Time (secs) = %f", maxPrimeFound, runTime);
    return maxPrimeFound;
}

+ (NSInteger)p4LargestPalidromeFromProductOfNumbersLessThan:(NSInteger)maxNumber {
    
    NSDate *startTime = [NSDate date];

        // Problem 4
        // Find the largest palindrome made from the product of two 3-digit numbers.
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
                        maxPalidrome = product;
                    }
                }
            }
        }
    
    NSDate *endTime = [NSDate date];
    NSTimeInterval runTime = [endTime timeIntervalSinceDate:startTime];
    NSLog(@"Problem 4: %d, Run Time (secs) = %f", maxPalidrome, runTime);
    return maxPalidrome;
}

+ (NSInteger)p5SmallestNumberEvenlyDivisibleByAllNumbersUnder:(NSInteger)maxNumber {
    
    NSDate *startTime = [NSDate date];
    
        // Problem 5
        // What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
        NSInteger currentNumber = 1;
        NSMutableDictionary *factors = [NSMutableDictionary new];
    
        if (maxNumber >= 2) {
            [factors setObject:@1 forKey:@2];
            currentNumber = 2;
        }
    
        while (currentNumber < maxNumber) {
            currentNumber++;
            NSInteger remainingFactor = currentNumber;
            NSMutableDictionary *currentFactors = [NSMutableDictionary new];
            
            while (YES) {
                BOOL noFactorFound = YES;
                
                // If factor found in current number, update dictionary of counts for each factor
                for (NSNumber *factor in [factors allKeys]) {
                    if (remainingFactor % [factor integerValue] == 0) {
                        NSNumber *keyCount = [currentFactors objectForKey:factor];
                        if ([keyCount integerValue] > 0) {
                            NSNumber *newCount = @([keyCount integerValue] + 1);
                            [currentFactors setObject:newCount forKey:factor];
                        } else {
                            [currentFactors setObject:@1 forKey:factor];
                        }
                        remainingFactor = remainingFactor / [factor integerValue];
                        noFactorFound = NO;
                    }
                }
                
                // If no factors found, the remainder must be a factor
                if (noFactorFound) {
                    if (remainingFactor > 1) {
                        [currentFactors setObject:@1 forKey:@(remainingFactor)];
                    }
                    break;
                }
            }
            
            // If current number uses more factors, add them
            for (NSNumber *currentFactor in [currentFactors allKeys]) {
                NSInteger currentFactorCount = [[currentFactors objectForKey:currentFactor] integerValue];
                
                NSInteger factorCount = [[factors objectForKey:currentFactor] integerValue];
                
                if (currentFactorCount > factorCount) {
                    [factors setObject:@(currentFactorCount) forKey:currentFactor];
                }
            }
            
        }
    
        // Find Integer by Reconstructing Factors
        NSInteger smallestInteger = 1;
        for (NSNumber *factor in [factors allKeys]) {
            NSInteger factorCount = [[factors objectForKey:factor] integerValue];
            smallestInteger = smallestInteger * pow([factor integerValue], factorCount);
        }
    
    NSDate *endTime = [NSDate date];
    NSTimeInterval runTime = [endTime timeIntervalSinceDate:startTime];
    NSLog(@"Problem 5: %d, Run Time (secs) = %f", smallestInteger, runTime);
    return smallestInteger;
}

+ (NSInteger)p6differenceBetweenSumOfSquaresAndSquareOfSumsForNumbers:(NSInteger)quantityOfNumbers {
    
    NSDate *startTime = [NSDate date];
    
        // Problem 6
        // Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
        NSInteger squareOfSums;
        NSInteger subtotal = 0;
        NSInteger sumOfSquares = 0;
        for (NSInteger i = 1; i <= quantityOfNumbers; i++) {
            subtotal += i;
            sumOfSquares += pow(i,2);
        }
        squareOfSums = pow(subtotal,2);
    
        // The no loop formula:
        //
        // sum = limit(limit + 1)=2
        // sum sq = (2limit + 1)(limit + 1)limit=6
    
        NSInteger difference = squareOfSums - sumOfSquares;
    
    NSDate *endTime = [NSDate date];
    NSTimeInterval runTime = [endTime timeIntervalSinceDate:startTime];
    NSLog(@"Problem 6: %d, Run Time (secs) = %f", difference, runTime);
    return difference;
}

+ (NSInteger)p7findNthPrimeNumberWhere:(NSInteger)nthPrimeNumber {
    NSDate *startTime = [NSDate date];
    
    // Problem 7
    // What is the 10001st prime number?
    
    NSInteger potentialPrime = 1;
    NSInteger primeNumberCount = 0;
    NSMutableArray *primes = [NSMutableArray new];
    
    if (nthPrimeNumber >= 1) {
        [primes addObject:@(2)];
        potentialPrime = 3;
        primeNumberCount = 1;
    }
    
    if (nthPrimeNumber >= 2) {
        [primes addObject:@(3)];
        potentialPrime = 5;
        primeNumberCount = 2;
    }
    
    while (primeNumberCount < nthPrimeNumber) {
        BOOL isPrime = YES;
        for (NSNumber *prime in primes) {
            if (potentialPrime % [prime integerValue] == 0) {
                isPrime = NO;
                break;
            }
        }
        if (isPrime) {
            [primes addObject:@(potentialPrime)];
            primeNumberCount++;
        }
        potentialPrime = potentialPrime + 2;
    }
    
    NSInteger maxPrimeFound = [[primes lastObject] integerValue];
    NSDate *endTime = [NSDate date];
    NSTimeInterval runTime = [endTime timeIntervalSinceDate:startTime];
    NSLog(@"Problem 7: %d, Run Time (secs) = %f", maxPrimeFound, runTime);
    return maxPrimeFound;
}


@end
