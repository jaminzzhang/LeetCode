//: Playground - noun: a place where people can play

import Foundation

var str = "Hello, playground"



public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    var l1Next = l1;
    var l2Next = l2;
    var result: ListNode? = nil;
    var currResultNode: ListNode? = nil;
    var carry = 0;
    
    while (nil != l1Next || nil != l2Next || carry > 0) {
        
        let sum = (l1Next?.val ?? 0) + (l2Next?.val ?? 0) + carry;
        carry = sum/10;
        let num = sum < 10 ? sum : (sum%10);
        let currNode = ListNode(num)
        if nil == currResultNode {
            currResultNode = currNode
            result = currNode;
        } else {
            currResultNode?.next = currNode
            currResultNode = currNode;
        }
        l1Next = l1Next?.next
        l2Next = l2Next?.next
    }
    
    return result;
}


let l10 = ListNode(2)
let l11 = ListNode(4)
let l12 = ListNode(3)
l10.next = l11
l11.next = l12


let l20 = ListNode(5)
let l21 = ListNode(6)
let l22 = ListNode(4)
l20.next = l21
l21.next = l22

addTwoNumbers(l10, l20)

