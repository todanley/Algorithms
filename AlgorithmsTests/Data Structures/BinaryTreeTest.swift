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
        tree.root.left = TreeNode(3)
        tree.root.left?.left = TreeNode(1)
        tree.root.left?.right = TreeNode(4)
        tree.root.right = TreeNode(7)
        tree.root.right?.left = TreeNode(6)
        tree.root.right?.right = TreeNode(8)
        
        return tree
    }
    
    func testPrint()
    {
        let tree = setUpBinaryTree()
        tree.root.inordePrint()
    }

}
