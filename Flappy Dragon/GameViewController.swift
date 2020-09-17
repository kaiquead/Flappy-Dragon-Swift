//
//  GameViewController.swift
//  Flappy Dragon
//
//  Created by Kaique Alves on 16/09/20.
//  Copyright © 2020 Kaique Alves. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var stage: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stage = view as! SKView
        
        //Usado para definir o eixo Z manualmente e evitar que objetos fiquem "flipando"
        stage.ignoresSiblingOrder = true
        
        presentScene()
    }
    
    func presentScene() {
        let scene = GameScene(size: CGSize(width: 320, height: 568))
        scene.scaleMode = .aspectFill
        stage.presentScene(scene)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
