//
//  BinaryTreeTest.swift
//  AlgorithmsTests
//
//  Created by Stanley Jin on 11/3/20.
//  Copyright © 2020 Stanley Jin. All rights reserved.
//

import XCTest
@testable import Algorithms

class BinaryTreeTest: XCTestCase {

    override func setUp() {
    }
    
    
    // BST: [5,3,1,4,7,6,8]
    func setUpBinaryTree() -> BinaryTree {
        let tree = BinaryTree(5)
        tree.root.left = TreeNode(2)
        tree.root.left?.left = TreeNode(1)
        tree.root.left?.right = TreeNode(3)
        tree.root.right = TreeNode(7)
        tree.root.right?.left = TreeNode(4)
        tree.root.right?.right = TreeNode(8)
        
        return tree
    }
    
    func testPrint()
    {
        let inorder = [1,2,3,5,4,7,8]
        let preorder = [5,2,1,3,7,4,8]
    
        let node = TreeNode.reconstructTree(inorder: inorder, preorder: preorder)
        print(node)
        
        print("ahahah")
        print(4%2)
    }

}
