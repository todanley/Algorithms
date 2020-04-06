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
    
    func inordePrint()
    {
        left?.inordePrint()
        print("\n", val)
        right?.inordePrint()
    }
    
    func inorderPrintIterative()
    {
        var stack = Stack<TreeNode>()
        var curr: TreeNode? = self
        
        while curr != nil || !stack.isEmpty
        {
            while curr != nil
            {
                stack.push(curr!)
                curr = curr?.left
            }

            let popped = stack.top
            print("\n", popped?.val ?? "stack popped error")
            stack.pop()
            curr = popped?.right
        }
    }
    
    func preorderPrint()
    {
        print("\n", val)
        left?.preorderPrint()
        right?.preorderPrint()
    }
    
    func preorderPrintIterative()
    {
        var stack = Stack<TreeNode>()
        var curr: TreeNode? = self
        
        while curr != nil || !stack.isEmpty
        {
            while curr != nil
            {
                print("\n", curr?.val ?? "stack popped error")
                stack.push(curr!)
                curr = curr?.left
            }

            let popped = stack.top
            stack.pop()
            curr = popped?.right
        }
    }
    
    // Take both inorder and preorder result to restruct the original binary tree.
    static func reconstructTree(inorder: [Int], preorder: [Int]) -> TreeNode
    {
        let result = TreeNode(preorder.first!)
        if inorder.count == 1
        {
            return result
        }
        let rootIndex = inorder.firstIndex(of: preorder.first!)!
        let leftInorder = Array(inorder[0..<rootIndex])
        let rightInorder = Array(inorder[rootIndex + 1..<inorder.count])
        let flagIndex = rootIndex - 1
        let flag = inorder[flagIndex]
        let flagDesIndex = preorder.firstIndex(of: flag)!
        let leftPreorder = Array(preorder[1...flagDesIndex])
        let rightPreorder = Array(preorder[flagDesIndex + 1..<preorder.count])
        
        assert(leftInorder.count == leftPreorder.count && rightInorder.count == rightPreorder.count, "count does not match")

        result.left = reconstructTree(inorder: leftInorder, preorder: leftPreorder)
        result.right = reconstructTree(inorder: rightInorder, preorder: rightPreorder)
        
        return result
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
