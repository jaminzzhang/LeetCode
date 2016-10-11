//: Playground - noun: a place where people can play

import Foundation

var str = "Hello, playground"



func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    
    let count = nums1.count + nums2.count
    let medianIndex = count/2;
    var composedNums: [Int] = [];
 
    var cursor1 = 0
    var cursor2 = 0
    //    var nextCursor1 = 0
    //    var nextCursor2 = 0
    
    while composedNums.count <= medianIndex {
        
        var nextNum1: Int = Int.min
        var nextNum2: Int = Int.min
        if cursor1 < nums1.count {
            nextNum1 = nums1[cursor1]
        }
        
        if cursor2 < nums2.count {
            nextNum2 = nums2[cursor2]
        }
        
        if (Int.min == nextNum1 || (Int.min != nextNum2 && nextNum2 < nextNum1)) {
            composedNums.append(nextNum2)
            cursor2 += 1;
        } else {
            composedNums.append(nextNum1)
            cursor1 += 1;
        }
        
        
    }
    
    
    if count%2 == 0 {
        let mediaSum = composedNums[medianIndex-1] + composedNums[medianIndex];
        return Double(mediaSum)/2
    } else {
        return Double(composedNums[medianIndex])
    }
}

findMedianSortedArrays([2, 4, 5], [1, 2])



