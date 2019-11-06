//
//  GeometricLife.swift
//  gameLife
//
//  Created by Fabrício Guilhermo on 31/10/19.
//  Copyright © 2019 Fabrício Guilhermo. All rights reserved.
//

import Foundation
import SceneKit

class GeometricLife: SCNNode {
    
    /**
     Creates a geometric object (cubes or spheres) to simulate a cell with life.
     - Parameters:
     - scnScene: The main scene view.
     */
    static func setupGeometricLife(scnScene: SCNScene?) -> SCNNode {
        let life: SCNGeometry
        life = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 1.0)
        let lifeNode = SCNNode(geometry: life)
        scnScene?.rootNode.addChildNode(lifeNode)
        return lifeNode
    }
}
