//
//  GameViewController.swift
//  gameLife
//
//  Created by Fabrício Guilhermo on 31/10/19.
//  Copyright © 2019 Fabrício Guilhermo. All rights reserved.
//



import UIKit
import SceneKit
import CoreGraphics

class GameViewController: UIViewController, SCNSceneRendererDelegate {
    
    let screenSize: CGRect = UIScreen.main.bounds
//    var originNode = SCNNode()
    var scnView: SCNView?
    var scnScene: SCNScene?
    var cameraNode: SCNNode?
    var lblGenerationCount: UILabel?
    var btnNextGeneration: UIButton?
    var generationCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupScene()
        Field.creatingLogicField()
        Field.creatingField(scnScene: scnScene)
        Field.verifyingLife()
        // User interface elements
        btnNextGeneration = creatingBtnNextGeneration()
        lblGenerationCount = creatingGenerationCountLabel(btnNextGeneration: btnNextGeneration ?? UIButton())
        self.view.addSubview(btnNextGeneration ?? UIButton())
        self.view.addSubview(lblGenerationCount ?? UIView())
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setupView() {
        scnView = self.view as? SCNView
        scnView?.allowsCameraControl = true
        scnView?.autoenablesDefaultLighting = true
        scnView?.delegate = self
    }
    
    func setupScene() {
        scnScene = SCNScene()
        scnView?.scene = scnScene
        scnView?.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        scnView?.allowsCameraControl = true
    }
    
    // User interface elements
    func creatingBtnNextGeneration() -> UIButton {
        let btnSize: CGFloat = 70
        let button = CustomButton(frame: CGRect(x: screenSize.width/2 - btnSize/2, y: screenSize.height - 150, width: btnSize, height: btnSize))
        button.isHighlighted = false
        button.layer.cornerRadius = 35
        button.setTitle("+1", for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 5
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        
        return button
    }
    
    @objc func buttonAction(sender: UIButton?) {
        Rules.rules()
        Field.verifyingLife()
        generationCount += 1
        lblGenerationCount?.text = "Geração: " + String(generationCount)
    }
    
    func creatingGenerationCountLabel(btnNextGeneration: UIButton) -> UILabel {
        let lblWidth: CGFloat = 135
        let lblHeight: CGFloat = lblWidth/3
        let label = UILabel(frame: CGRect(x: screenSize.width/20, y: btnNextGeneration.center.y - lblHeight/2, width: lblWidth, height: lblHeight))
        label.text = "Geração: " + String(generationCount)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.layer.backgroundColor = #colorLiteral(red: 0.1546105894, green: 0.1546105894, blue: 0.1546105894, alpha: 1)
        label.layer.cornerRadius = 20
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        return label
    }
}

