//
//  Rules.swift
//  gameLife
//
//  Created by Fabrício Guilhermo on 05/11/19.
//  Copyright © 2019 Fabrício Guilhermo. All rights reserved.
//

import Foundation
import SceneKit

class Rules: SCNNode {
    /**
     Avoids error of out of index.
    - Parameters:
        - x:A line of your matrix.
        - y: A column of your matrix
     */
    static func get(_ x: Int,_ y: Int) -> Bool?{
        if x > 0, y > 0, x < Field.fieldSize, y < Field.fieldSize {
            let haveLife = Field.life[x][y]
            return haveLife
        }
        return nil
    }
    /**
     Rules is a generic function to verify some matrix and count the neighbors of some square. Therefore, it creates a new matrix with boolean states changed.
    */
    static func rules() {
        var nextGen: [[Bool]] = []
        for x in (0..<Field.fieldSize) {
            var plane: [Bool] = []
            for y in (0..<Field.fieldSize) {
                let neighbors: [Bool?] = [
                    get(x-1, y-1),
                    get(x, y-1),
                    get(x, y+1),
                    get(x+1, y+1),
                    get(x-1, y+1),
                    get(x+1, y-1),
                    get(x-1, y),
                    get(x+1, y),
                ]
                let neighborsSum = neighbors.compactMap { $0 }.map{ $0 ? 1 : 0 }.reduce(0,+)
                switch neighborsSum {
                case 0...1:
                    plane.append(false)
                case 2...3:
                    if let isAlive = get(x, y) {
                        if isAlive {
                            plane.append(true)
                        } else {
                            plane.append(neighborsSum == 3)
                        }
                    } else {
                        plane.append(false)
                    }
                default:
                    plane.append(false)
                }
            }
            nextGen.append(plane)
        }
        Field.life = nextGen
    }
}
