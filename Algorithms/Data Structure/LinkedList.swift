//
//  DataStructure.swift
//  Algorithms
//
//  Created by Stanley Jin on 11/3/20.
//  Copyright © 2020 Stanley Jin. All rights reserved.
//

import Foundation

protocol ListNode
{
    var val: Int { get set }
    var next: Self? { get set}

    static func search(_ node: Self?, val: Int) -> Self?
    static func insert(_ head: inout Self?, val: Int)
    static func delete(_ head: inout Self?, val: Int)
    static func delete(_ head: inout Self?, val: Self)
}

func printll<T: ListNode>(_ node: T?)
{
    if let node = node
    {
        print(node.val)
    }
    if let next = node?.next
    {
        printll(next)
    }
}

final class SinglyListNode: ListNode, Equatable
{
    static func == (lhs: SinglyListNode, rhs: SinglyListNode) -> Bool {
        var l: SinglyListNode? = lhs
        var r: SinglyListNode? = rhs
        while l?.val == r?.val
        {
            if l == nil && r == nil
            {
                return true
            }
            
            l = l?.next
            r = r?.next
        }
        
        return false
    }
    
    var next: SinglyListNode?
    
    static func search(_ node: SinglyListNode?, val: Int) -> SinglyListNode? {
        var node = node
        while node != nil && node?.val != val
        {
            node = node?.next
        }
        
        return node
    }
    
    static func insert(_ head: inout SinglyListNode?, val: Int) {
        var node = SinglyListNode(val, valArr: [])
        node.next = head
        head = node
    }
    
    static func delete(_ head: inout SinglyListNode?, val: Int) {
         var curr = head
         var prev: SinglyListNode?
         while curr != nil && curr!.val != val
         {
             prev = curr
             curr = curr?.next
         }
         
        if curr != nil
        {
         prev?.next = curr?.next
            if prev == nil
            {
                head = head?.next
            }
         }
    }
    
    static func delete(_ head: inout SinglyListNode?, val: SinglyListNode) {
        //impossible for singly linked list.
    }
    
    required init(_ val: Int, valArr: [Int]) {
        self.val = val
        
        if valArr.count > 0
        {
            let node = SinglyListNode(valArr[0], valArr: Array(valArr.dropFirst()))
            self.next = node
        }
    }

    var val: Int = 0
}

final public class DoublyListNode: ListNode, Equatable {

    public static func == (lhs: DoublyListNode, rhs: DoublyListNode) -> Bool {
         var l: DoublyListNode? = lhs
               var r: DoublyListNode? = rhs
               while l?.val == r?.val
               {
                   if l == nil && r == nil
                   {
                        return true
                   }

                if (l?.next == nil && r?.next == nil) || l?.next?.prev?.val == l?.val && r?.next?.prev?.val == r?.val
                {
                    l = l?.next
                    r = r?.next
                }
                else
                {
                    return false
                }
               }
               
               return false
    }
    
    var val: Int
    var next: DoublyListNode?
    var prev: DoublyListNode?
    
    static func search(_ node: DoublyListNode?, val: Int) -> DoublyListNode? {
        return nil
    }
    
    static func insert(_ head: inout DoublyListNode?, val: Int) {
        let node = DoublyListNode(val)
        
        if let head = head
        {
            head.prev = node
        }
        
        node.next = head
        node.prev = nil  // necessary if a node is passed in.
        head = node
    }

    static func delete(_ head: inout DoublyListNode?, val: Int) {
        var curr = head
        while curr != nil && curr?.next?.val != val
        {
            curr = curr?.next
        }
        
        if curr != nil
        {
            curr?.next?.prev = curr?.prev
            curr?.prev?.next = curr?.next?.next
        }
    }
    
    static func delete(_ head: inout DoublyListNode?, val: DoublyListNode) {
        if let prev = val.prev
        {
            prev.next = val.next
        }
        else
        {
            head = val
        }
        
        val.next?.prev = val.prev
    }

    required init(_ val: Int, valArr: [Int] = [Int]()) {
         self.val = val
        
        if valArr.count > 0
        {
            let node = DoublyListNode(valArr[0], valArr: Array(valArr.dropFirst()))
            self.next = node
            node.prev = self
        }
    }
    
    var head:DoublyListNode
    {
        var head = self
        while head.prev != nil
        {
            head = head.prev!
        }
        
        return head
    }

    //    func llInsert(x)
    //    {
    //        x.next = l.nil.next
    //        l.nil.next.prev = x
    //        l.nil.next = x
    //        x.prev = l.nil
    //    }
    //
    //    func llSetInsert(x)
    //    {
    //        l.tail.next = x
    //        x.prev = l.tail
    //        l.tail = x
    //    }
    //
    //    func stackLLPush(x)
    //    {
    //        l.tail.next = x
    //        l.tail = x
    //    }
    //
    //    func stackLLPop(x)
    //    {
    //        l.tail = l.tail.prev
    //        l.tail.next = nil
    //    }
        
    
    static func mergeTwoLists(_ l1: inout DoublyListNode?, _ l2: inout DoublyListNode?) ->DoublyListNode? {
        var l1 = l1
        var l2 = l2
        
        var res = l1?.val ?? Int.max < l2?.val ?? Int.max ? l1 : l2
               // var res:SinglyListNode? = l1.val > l2.val ? l2 : l1
               while l1 != nil && l2 != nil
               {
                   if l1?.val ?? 0 < l2?.val ?? 0
                   {
                       var temp = l1
                    while temp?.next?.val ?? Int.max < l2?.val ?? 0
                       {
                           temp = temp?.next
                       }
                       var temp3 = temp?.next
                       var temp2 = l2?.next
                       temp?.next = l2
                       l2?.next = temp3
                       l2 = temp2
                   }
                   else
                   {
                       var temp = l2
                    while temp?.next?.val ?? Int.max < l1?.val ?? 0
                       {
                           temp = temp?.next
                       }
                       var temp3 = temp?.next
                       var temp2 = l1?.next
                       temp?.next = l1
                       l1?.next = temp3
                       l1 = temp2
                   }
               }
               return res
    }
    
    static func mergeaTwoLists(_ l1: DoublyListNode?, _ l2:DoublyListNode?) ->DoublyListNode? {
          
           var list1 = l1
           var list2 = l2
           
           
           var l = DoublyListNode(0)
           var p = l
           
           while(list1 != nil && list2 != nil) {
               if(list1!.val < list2!.val) {
                   p.next = list1
                   list1 = list1!.next
               }
               else {
                   p.next = list2
                   list2 = list2!.next
               }
               p = p.next!
           }
           if(list1 != nil) {
               p.next = list1!
           }
           if(list2 != nil) {
               p.next = list2!
           }
           
           return l.next
       }
    
    static func deleteDuplicates(_ head:DoublyListNode?) ->DoublyListNode? {
        var curr = head
        var top = head
        while curr != nil
        {
            var head = curr?.next
            var prev = curr
            while head != nil
            {
                if head?.val ?? 0 == curr?.val ?? 0
                {
                    prev?.next = head?.next
                }
                else{
                    prev = prev?.next
                }

                head = head?.next
            }
            curr = curr?.next
        }
        return top
    }
    
    static func oddEvenList(_ head:DoublyListNode?) ->DoublyListNode? {
        var first = head
        var head = head
        
        var firstTemp:DoublyListNode?
        var lastPrev:DoublyListNode?
        while head != nil && head?.next != nil
        {
            var temp = head?.next
            
            if firstTemp == nil
            {
                
                firstTemp = temp
                
            }
            
            head?.next = head?.next?.next
            temp?.next = head?.next?.next
            lastPrev = head
            head = head?.next
            

        }
        

        if head == nil
        {
            lastPrev?.next = firstTemp
        }
        else
        {
            head?.next = firstTemp
        }
        
        return first
    }
}
