//: Playground - noun: a place where people can play

import Foundation

var str = "Hello, playground"


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


lengthOfLongestSubstring("au")
lengthOfLongestSubstring("aab")
lengthOfLongestSubstring("dvdf")
lengthOfLongestSubstring("abcabcbb")