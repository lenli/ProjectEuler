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

@end
