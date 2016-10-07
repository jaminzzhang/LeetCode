//
//  1TwoSum.swift
//  LeetCode
//
//  Created by Jamin on 07/10/2016.
//  Copyright © 2016 MZ. All rights reserved.
//

import Foundation

class TwoSum {
    
    func myTwoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var indexMap: [Int: [Int]] = [:]
        for i in 0..<nums.count {
            let num = nums[i];
            var indexList = indexMap[num]
            if indexList == nil {
                indexMap[num] = [i]
            } else {
                indexList?.append(i)
            }
        }
        
        for i in 0..<nums.count {
            
            if let indexList = indexMap[target-nums[i]] {
                if let nextIndex = indexList.filter({$0 != i}).first {
                    return [i, nextIndex];
                }
            }
        }
        
        return []
        
    }
    
    
    //Best Solutin
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var indexMap: [Int: Int] = [:]
        
        for i in 0..<nums.count {
            let num = nums[i]
            let complement = target-num;
            print("\(complement)")
            if let index = indexMap[complement] {
                return [index, i];
            } else {
                indexMap[num] = i;
            }
        }
        
        return []
        
    }

}


