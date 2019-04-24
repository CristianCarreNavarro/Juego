//
//  GameScene.swift
//  Juego
//
//  Created by DAM on 09/04/2019.
//  Copyright © 2019 DAM. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene,SKPhysicsContactDelegate{
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
     var starfield : SKEmitterNode!
     var scoreLabel : SKLabelNode!
    
    //1.57
    override func didMove(to view: SKView) {
        // Background starfield
        starfield = SKEmitterNode(fileNamed: "Starfield")
        starfield.position = CGPoint(x: self.frame.maxX, y: 400)
        starfield.setScale(3)
        starfield.advanceSimulationTime(10)
        starfield.zRotation = -1.57
        self.addChild(starfield)
        starfield.zPosition = -1
       
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
      
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
      
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     
            
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }

}
