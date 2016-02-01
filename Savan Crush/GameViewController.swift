//
//  GameViewController.swift
//  Savan Crush
//
//  Created by Bosc-Ducros Hugo on 31/01/2016.
//  Copyright (c) 2016 Bosc-Ducros Hugo. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    var scene: GameScene!
    var level: Level!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape  //AllButUpsideDown.rawValue
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view.
        let skView = view as! SKView
        skView.multipleTouchEnabled = false
        
        // Create and configure the scene.
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        scene.swipeHandler = handleSwipe
        
        // Present the scene.
        skView.presentScene(scene)
        
        level = Level(filename: "Level_1")
        scene.level = level
        scene.addTiles()
        
        beginGame()
    }

    
    
    func beginGame() {
        shuffle()
    }
    
    func shuffle() {
        let newCookies = self.level.shuffle()
        scene.addSpritesForCookies(newCookies)
    }
    
    func handleSwipe(swap: Swap) {
        view.userInteractionEnabled = false
        
        if level.isPossibleSwap(swap) {
            level.performSwap(swap)
            scene.animateSwap(swap, completion: handleMatches)
//            scene.animateSwap(swap) {
//                self.view.userInteractionEnabled = true
//            }
        } else {
            scene.animateInvalidSwap(swap) {
                self.view.userInteractionEnabled = true
            }
        }
    }
    
    func handleMatches() {
        let chains = level.removeMatches()
        scene.animateMatchedCookies(chains) {
            let columns = self.level.fillHoles()
            self.scene.animateFallingCookies(columns) {
                let columns = self.level.topUpCookies()
                self.scene.animateNewCookies(columns) {
                    self.view.userInteractionEnabled = true
                }
            }
        }
    }
    
}
