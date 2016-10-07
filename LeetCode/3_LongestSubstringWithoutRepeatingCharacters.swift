//
//  3_LongestSubstringWithoutRepeatingCharacters.swift
//  LeetCode
//
//  Created by Jamin on 07/10/2016.
//  Copyright © 2016 MZ. All rights reserved.
//


/*
 https://leetcode.com/problems/longest-substring-without-repeating-characters/
 
 #3. Longest Substring Without Repeating Characters
 
 Given a string, find the length of the longest substring without repeating characters.
 
 Examples:
 
 Given "abcabcbb", the answer is "abc", which the length is 3.
 
 Given "bbbbb", the answer is "b", with the length of 1.
 
 Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
 */


import Foundation

class LongestSubstring {
    
    
    //My Optim
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        var currSubStrmap: [Character: Int] = [:];
        var currlocate = 0;
        var maxLength = 0;
        
        var index = 0
        for ch in s.characters {
            
            if let repeatIndex = currSubStrmap[ch] {
                if repeatIndex >= currlocate {
                    currlocate = repeatIndex + 1;
                }
            }
            
            currSubStrmap[ch] = index;
            index += 1
            maxLength = max(maxLength, index - currlocate)
        }
        
        return maxLength
    }
    
    
    //Editorial Solution
    func lengthOfLongestSubstringE(_ s: String) -> Int {
        
        var currChMapList: [Int] = [Int](repeating: -1, count: 128);
        var currlocate = 0;
        var maxLength = 0;
        
        var index = 0
        for ch in s.characters {
            
            let asciiCh = Int((String(ch).unicodeScalars.first?.value)!)
            let repeatIndex = currChMapList[asciiCh]
            if repeatIndex >= currlocate {
                currlocate = repeatIndex + 1;
            }
            
            currChMapList[asciiCh] = index;
            index += 1
            maxLength = max(maxLength, index - currlocate)
        }
        
        return maxLength
    }
    
    
    //First Solution
    func lengthOfLongestSubstring1(_ s: String) -> Int {
        
        var maxLength = 0;
        var currSubStrs: [Character] = []
        for ch in s.characters {
            
            var repeatIndex = -1;
            for i in 0..<currSubStrs.count {
                let currCh = currSubStrs[i]
                if currCh == ch {
                    repeatIndex = i;
                    break;
                }
            }
            
            
            if repeatIndex >= 0 {
                currSubStrs = Array(currSubStrs[repeatIndex+1..<currSubStrs.count])
            }
            
            currSubStrs.append(ch)
            //        print(currSubStrs)
            maxLength = max(maxLength, currSubStrs.count)
        }
        
        return maxLength
    }
    
 
    
    func test() {
        lengthOfLongestSubstring("abcabcbb")
    }
    
    
}
