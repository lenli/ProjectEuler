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
        // What is the largest prime factor of the number 600851475143?
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

+ (long long)p8findAdjacentDigitsWithGreatestProduct:(NSInteger)numberOfAdjacentDigits {
    
    NSDate *startTime = [NSDate date];
    
        // Problem 8
        NSString *originalNumberString = @"7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450";

        long long largestProduct = 0;
        NSArray *originalNumberArray = [ProjectEuler arrayFromString:originalNumberString];
        for (NSInteger i=0; i <= ([originalNumberString length] - numberOfAdjacentDigits); i++) {
            long long subtotal = 1;
            NSArray *currentStringArray = [originalNumberArray subarrayWithRange:NSMakeRange(i, numberOfAdjacentDigits)];
            
            for (NSInteger i = 0; i < [currentStringArray count]; i++ ) {
                NSInteger currentNumber = [currentStringArray[i] integerValue];
                subtotal = subtotal * currentNumber;
            }
            
            if (subtotal > largestProduct) {
                largestProduct = subtotal;
            }
        }
    
    NSDate *endTime = [NSDate date];
    NSTimeInterval runTime = [endTime timeIntervalSinceDate:startTime];
    NSLog(@"Problem 8: %lld, Run Time (secs) = %f", largestProduct, runTime);
    return largestProduct;
}

+ (NSInteger)p9PythagoreanTripletWhereSum:(NSInteger)sumOfTriplet {
    
    NSDate *startTime = [NSDate date];
    
        // Problem 9
        NSInteger tripletProduct = 0;
        NSInteger i = 0;
        NSInteger j = 0;
        NSInteger k = 0;
        
        for (i = 1; i < sumOfTriplet-3; i++) {
            for (j = i+1; j < sumOfTriplet-i; j++) {
                k = sumOfTriplet-j-i;
                if (pow(i,2)+pow(j,2) == pow(k,2)) {
                    tripletProduct = i * j * k;
                    break;
                }
            }
        }
        // Without programming:
        // a= 2mn; b= m^2 -n^2; c= m^2 + n^2;
        // a + b + c = 1000;
        // Solve for m, n
    
    NSDate *endTime = [NSDate date];
    NSTimeInterval runTime = [endTime timeIntervalSinceDate:startTime];
    NSLog(@"Problem 9: %d, Run Time (secs) = %f", tripletProduct, runTime);
    return tripletProduct;
}

+ (long long)p10SumOfPrimesBelow:(NSInteger)maxPrime {
    
    NSDate *startTime = [NSDate date];
    
        // Problem 10
        
        long long sumOfPrimes = 0;
        NSArray *primes = [ProjectEuler primesBelow:maxPrime];
        for (NSNumber *prime in primes) {
            sumOfPrimes += [prime integerValue];
        }
    
        // For more efficiency, use Sieve of Eratosthenes
    
    NSDate *endTime = [NSDate date];
    NSTimeInterval runTime = [endTime timeIntervalSinceDate:startTime];
    NSLog(@"Problem 10: %lld, Run Time (secs) = %f", sumOfPrimes, runTime);
    return sumOfPrimes;
}

+ (long long)p11ProductOfAdjacentNumbers:(NSInteger)quantityOfAdjacentNumbers {
    
    NSDate *startTime = [NSDate date];
    
    // Problem 11
    NSInteger productLength = quantityOfAdjacentNumbers;
    long long productOfNumbers = 1;
    
    NSString *row0 = @"08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08";
    NSString *row1 = @"49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00";
    NSString *row2 = @"81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65";
    NSString *row3 = @"52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91";
    NSString *row4 = @"22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80";
    NSString *row5 = @"24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50";
    NSString *row6 = @"32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70";
    NSString *row7 = @"67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21";
    NSString *row8 = @"24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72";
    NSString *row9 = @"21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95";
    NSString *row10 = @"78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92";
    NSString *row11 = @"16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57";
    NSString *row12 = @"86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58";
    NSString *row13 = @"19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40";
    NSString *row14 = @"04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66";
    NSString *row15 = @"88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69";
    NSString *row16 = @"04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36";
    NSString *row17 = @"20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16";
    NSString *row18 = @"20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54";
    NSString *row19 = @"01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48";
    
    NSArray *gridRows = @[[row0 componentsSeparatedByString:@" "],
                          [row1 componentsSeparatedByString:@" "],
                          [row2 componentsSeparatedByString:@" "],
                          [row3 componentsSeparatedByString:@" "],
                          [row4 componentsSeparatedByString:@" "],
                          [row5 componentsSeparatedByString:@" "],
                          [row6 componentsSeparatedByString:@" "],
                          [row7 componentsSeparatedByString:@" "],
                          [row8 componentsSeparatedByString:@" "],
                          [row9 componentsSeparatedByString:@" "],
                          [row10 componentsSeparatedByString:@" "],
                          [row11 componentsSeparatedByString:@" "],
                          [row12 componentsSeparatedByString:@" "],
                          [row13 componentsSeparatedByString:@" "],
                          [row14 componentsSeparatedByString:@" "],
                          [row15 componentsSeparatedByString:@" "],
                          [row16 componentsSeparatedByString:@" "],
                          [row17 componentsSeparatedByString:@" "],
                          [row18 componentsSeparatedByString:@" "],
                          [row19 componentsSeparatedByString:@" "]
                          ];
    
    // Left & Right
    for (NSInteger y = 0; y < [gridRows count]; y++) {
        for (NSInteger x = 0; x <= [gridRows[y] count] - productLength; x++) {
            long long currentMax = 1;
            for (NSInteger i = 0; i < productLength; i++) {
                NSInteger offsetXIndex = x + i;
                NSInteger currentValue = [gridRows[y][offsetXIndex] integerValue];
                currentMax *= currentValue;
            }
            if (currentMax > productOfNumbers) {
                productOfNumbers = currentMax;
            }
        }
    }
    
    // Up & Down
    for (NSInteger y = 0; y <= [gridRows count] - productLength; y++) {
        for (NSInteger x = 0; x < [gridRows[y] count]; x++) {
            long long currentMax = 1;
            for (NSInteger i = 0; i < productLength; i++) {
                NSInteger offsetYIndex = y + i;
                NSInteger currentValue = [gridRows[offsetYIndex][x] integerValue];
                currentMax *= currentValue;
            }
            if (currentMax > productOfNumbers) {
                productOfNumbers = currentMax;
            }
        }
    }
    
    // Diagonally TopLeft to BottomRight
    for (NSInteger y = 0; y <= [gridRows count] - productLength; y++) {
        for (NSInteger x = 0; x <= [gridRows[y] count] - productLength; x++) {
            long long currentMax = 1;
            for (NSInteger i = 0; i < productLength; i++) {
                NSInteger offsetXIndex = x + i;
                NSInteger offsetYIndex = y + i;
                NSInteger currentValue = [gridRows[offsetYIndex][offsetXIndex] integerValue];
                currentMax *= currentValue;
            }
            if (currentMax > productOfNumbers) {
                productOfNumbers = currentMax;
            }
        }
    }
    
    // Diagonally TopRight to BottomLeft
    for (NSInteger y = 0; y <= [gridRows count] - productLength; y++) {
        for (NSInteger x = [gridRows[y] count] - 1; x >= productLength - 1; x--) {
            long long currentMax = 1;
            for (NSInteger i = 0; i < productLength; i++) {
                NSInteger offsetXIndex = x - i;
                NSInteger offsetYIndex = y + i;
                NSInteger currentValue = [gridRows[offsetYIndex][offsetXIndex] integerValue];
                currentMax *= currentValue;
            }
            if (currentMax > productOfNumbers) {
                productOfNumbers = currentMax;
            }
        }
    }
    
    NSDate *endTime = [NSDate date];
    NSTimeInterval runTime = [endTime timeIntervalSinceDate:startTime];
    NSLog(@"Problem 11: %lld, Run Time (secs) = %f", productOfNumbers, runTime);
    return productOfNumbers;
    
}

+ (long long)p16SumOfPowerTwoToDigits:(NSInteger)powerOfTwo {
    
    NSDate *startTime = [NSDate date];
    
    // Problem 16
    
    long long sumOfDigits = 0;
    long double numberWithDigits = pow(2, powerOfTwo);
    NSString *numberStringOriginal = [NSString stringWithFormat:@"%Lf", numberWithDigits];
    NSRange dotRange = [numberStringOriginal rangeOfString:@"."];
    NSString *numberString = [numberStringOriginal substringToIndex:dotRange.location];
    NSArray *numberArray = [ProjectEuler arrayFromString:numberString];
    
    for (NSNumber *number in numberArray) {
        sumOfDigits += [number integerValue];
    }
    
    NSDate *endTime = [NSDate date];
    NSTimeInterval runTime = [endTime timeIntervalSinceDate:startTime];
    NSLog(@"Problem 16: %lld, Run Time (secs) = %f", sumOfDigits, runTime);
    return sumOfDigits;
}

#pragma mark - Helper Methods

+ (NSArray *)arrayFromString:(NSString *)inputString {
    NSMutableArray *originalNumberArray = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < [inputString length]; i++) {
        NSString *character = [NSString stringWithFormat:@"%c", [inputString characterAtIndex:i]];
        [originalNumberArray addObject:character];
    }
    return originalNumberArray;
}

+ (NSArray *)primesBelow:(NSInteger)maxPrime {
    NSInteger potentialPrime = 1;
    NSInteger primeNumberCount = 0;
    NSMutableArray *primes = [NSMutableArray new];
    
    if (maxPrime >= 1) {
        [primes addObject:@(2)];
        potentialPrime = 3;
        primeNumberCount = 1;
    }
    
    if (maxPrime >= 2) {
        [primes addObject:@(3)];
        potentialPrime = 5;
        primeNumberCount = 2;
    }
    
    while (potentialPrime < maxPrime) {
        BOOL isPrime = YES;
        for (NSNumber *prime in primes) {
            if ([prime integerValue] > sqrt(potentialPrime)) {
                break;
            }
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
    return primes;
}

@end
