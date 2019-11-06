//
//  Field.swift
//  gameLife
//
//  Created by Fabrício Guilhermo on 05/11/19.
//  Copyright © 2019 Fabrício Guilhermo. All rights reserved.
//

import Foundation
import SceneKit

class Field: SCNNode {
    
    static var cubes: [[SCNNode]] = []
    static var life: [[Bool]] = []
    static let fieldSize: Int = 41
    
    /**
     This function creates an array of Bool to filter life in the field (true: is alive and false: is dead).
     */
    static func creatingLogicField() {
        for _ in 0..<fieldSize {
            var line: [Bool] = []
            for _ in 0..<fieldSize {
                line.append(Bool.random())
            }
            life.append(line)
        }
    }
    
    /**
     This function creates an array of geometric objects to simulate life in the field.
     - Parameters:
     - scnScene: The main scene view.
     */
    static func creatingField(scnScene: SCNScene?) {
        let spaceBetweenGeometrics: Float = 1.1
        for i in 0..<fieldSize {
            var lineCubes: [SCNNode] = []
            for j in 0..<fieldSize {
                let cube: SCNNode = GeometricLife.setupGeometricLife(scnScene: scnScene)
                cube.position.x = Float(i) * spaceBetweenGeometrics
                cube.position.y = Float(j) * spaceBetweenGeometrics
                lineCubes.append(cube)
                scnScene?.rootNode.addChildNode(cube)
            }
            cubes.append(lineCubes)
        } 
    }
    
    /**
     This function changes the state of the geometric shape.
     */
    static func verifyingLife() {
        for i in 0..<fieldSize {
            for j in 0..<fieldSize {
                if life[i][j] == true {
                    cubes[i][j].geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 1)
                    cubes[i][j].geometry?.firstMaterial?.diffuse.contents = UIColor.darkGray
                } else {
                    cubes[i][j].geometry = SCNBox(width: 0.7, height: 0.7, length: 0.7, chamferRadius: 1)
                    //                cubes[i][j].geometry = SCNBox(width: 0, height: 0, length: 0, chamferRadius: 1)
                    cubes[i][j].geometry?.firstMaterial?.diffuse.contents = UIColor.white
                }
            }
        }
    }
}
