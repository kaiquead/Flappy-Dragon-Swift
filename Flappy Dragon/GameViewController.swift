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
import AVFoundation

class GameViewController: UIViewController {

    var stage: SKView!
    var musicPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stage = view as! SKView
        
        //Usado para definir o eixo Z manualmente e evitar que objetos fiquem "flipando"
        stage.ignoresSiblingOrder = true
        
        presentScene()
        playMusic()
    }
    
    func playMusic() {
        if let musicURL = Bundle.main.url(forResource: "music", withExtension: "m4a") {
            musicPlayer = try! AVAudioPlayer(contentsOf: musicURL)
            musicPlayer.numberOfLoops = -1
            musicPlayer.volume = 0.4
            musicPlayer.play()
        }
    }
    
    func presentScene() {
        //mesmo setando um tamanho pequeno de tela, ela irá se redimensionar de acordo com o tamanho do Iphone
        let scene = GameScene(size: CGSize(width: 320, height: 568))
        scene.gameViewController = self
        scene.scaleMode = .aspectFill
        stage.presentScene(scene, transition: .doorsOpenVertical(withDuration: 0.5))
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
