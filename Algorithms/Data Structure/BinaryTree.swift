//
//  BinaryTree.swift
//  Algorithms
//
//  Created by Stanley Jin on 11/3/20.
//  Copyright © 2020 Stanley Jin. All rights reserved.
//

import Foundation

public class TreeNode
{
    var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    init(_ val: Int)
    {
        self.val = val
    }
}


public class BinaryTree
{
    public var root: TreeNode
    
    init(_ rootVal: Int)
    {
        root = TreeNode(rootVal)
    }
    
    func convertToDLL() -> DoublyListNode
    {
        return BinaryTree.convertToDLL(root).head
    }
    
    static func convertToDLL(_ node: TreeNode) -> DoublyListNode
    {
        var na: DoublyListNode?
        let nb = DoublyListNode(node.val)
        var nc: DoublyListNode?
        if let left = node.left
        {
            na = convertToDLL(left)
            na?.next = nb
            nb.prev = na
        }
        
        if let right = node.right
        {
            print("right: ", right)
            nc = convertToDLL(right).head
            nb.next = nc
            nc?.prev = nb
        }
        
        print("return ", nb, nc)
        return nc == nil ? nb : nc!
    }
}
