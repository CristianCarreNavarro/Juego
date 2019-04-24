//
//  MenuScene.swift
//  gametests
//
//  Created by Fèlix Galindo Allué on 23/03/2019.
//  Copyright © 2019 Fèlix Galindo Allué. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    // Node references
    var starfield:SKEmitterNode!
    var newGameButtonNode:SKSpriteNode!
    var difficultyButtonNode:SKSpriteNode!
    var difficultyLabelNode:SKLabelNode!
    
    
    // Initialization
    override func didMove(to view: SKView) {
        
        // Background starfield
        starfield = SKEmitterNode(fileNamed: "Starfield")
        starfield.position = CGPoint(x: 0, y: self.frame.size.height)
        starfield.advanceSimulationTime(10)
        self.addChild(starfield)
        starfield.zPosition = -1
  
        starfield = self.childNode(withName: "starfield") as? SKEmitterNode
        starfield?.advanceSimulationTime(10)
        
   
        newGameButtonNode = SKSpriteNode(texture: SKTexture(imageNamed: "newgame"))
        newGameButtonNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(newGameButtonNode)
        newGameButtonNode.zPosition = 1
      
        newGameButtonNode!.name = "newgame"
        
        difficultyButtonNode = self.childNode(withName: "difficultyButton") as? SKSpriteNode
        difficultyLabelNode = self.childNode(withName: "difficultyLabel") as? SKLabelNode
        // Remember the difficulty level from prior execution
        if UserDefaults.standard.bool(forKey: "hard") {
            difficultyLabelNode?.text = "Hard"
        }
        else {
            difficultyLabelNode?.text = "Easy"
        }
   
    }
    
    // User touches the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // First finger in screen
        if let location = touches.first?.location(in: self) {
            let nodesArray = self.nodes(at: location)
            // First node under the finger
            let nodeName = nodesArray.first?.name
            if nodeName == "newgame" {
                newGame()
            }
            else if nodeName == "difficultyButton" {
                changeDifficulty()
            }
        }
    }
    
 
    func newGame() {
        let gameScene = GameScene(size: self.size)
        gameScene.scaleMode = self.scaleMode
      
        let transition = SKTransition.flipHorizontal(withDuration: 0.5)
        self.view?.presentScene(gameScene, transition:transition)
    }
    
  
    func changeDifficulty() {
        // General userdata storage (settings, ...)
        let userDefaults = UserDefaults.standard
        if (difficultyLabelNode.text == "Easy") {
            difficultyLabelNode.text = "Hard"
            userDefaults.set(true, forKey: "hard")
        }
        else {
            difficultyLabelNode.text = "Easy"
            userDefaults.set(false, forKey: "hard")
        }
        // Save all changes
        userDefaults.synchronize()
    }
}
