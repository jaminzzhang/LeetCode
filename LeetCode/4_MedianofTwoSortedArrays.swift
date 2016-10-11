//
//  4_MedianofTwoSortedArrays.swift
//  LeetCode
//
//  Created by Jamin on 08/10/2016.
//  Copyright © 2016 MZ. All rights reserved.
//

import Foundation
/* Problem
 
 https://leetcode.com/problems/median-of-two-sorted-arrays/
 
 4. Median of Two Sorted Arrays
 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 
 Example 1:
 nums1 = [1, 3]
 nums2 = [2]
 
 The median is 2.0
 Example 2:
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 The median is (2 + 3)/2 = 2.5
 
 */

class MedianofTwoSortedArrays {
    
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        let count = nums1.count + nums2.count
        let medianIndex = count/2;
        var composedNums: [Int] = [];
        
        var cursor1 = 0
        var cursor2 = 0
        
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
    
    
}
