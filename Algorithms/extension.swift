//
//  extension.swift
//  Algorithms
//
//  Created by Stanley Jin on 1/3/20.
//  Copyright © 2020 Stanley Jin. All rights reserved.
//

import Foundation

extension String
{
    func count(of needle: Character) -> Int {
        return self.reduce(0) {
            $1 == needle ? $0 + 1 : $0
        }
    }
    
    func seperate(times: Int) -> ((String, String), String)
    {
        let number = times * 2 - 1
        
        let op = self[self.index(self.startIndex, offsetBy: number)]
        
        let left = String(Array(self)[0..<number])
        
        let right = String(Array(self)[number+1..<self.count])
        
        return ((left, right), String(op))
    }
}

