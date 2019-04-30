//
//  GameScene.swift
//  EcoFriends
//
//  Created by ZIA SCOTT on 4/23/19.
//  Copyright © 2019 ZIA SCOTT. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

struct PhysicsCategory {
    static let trashPiece: UInt32 = 0b1
}


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var background = SKSpriteNode(imageNamed: "sea")
    
    
    
    override func didMove(to view: SKView) {
        background.scale(to: CGSize.init(width: 1334, height: 750))
        background.zPosition = 0
        background.position = CGPoint(x: self.size.width / 40, y: self.size.height / 40)
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector.zero
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = border
        
       
    addChild(background)
    
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(trash), SKAction.wait(forDuration: 1.0)])))
      }
    
    
    
    // >:) hi


    
    func trash () {
        let trashPiece = SKSpriteNode(imageNamed: "cup")
        let actualY = random(min: trashPiece.size.height/2, max: size.height - trashPiece.size.height/2)
        
        trashPiece.position = CGPoint(x: size.width + trashPiece.size.width/2, y: actualY)
        trashPiece.scale(to: CGSize(width: 35, height: 35))
        trashPiece.physicsBody = SKPhysicsBody(rectangleOf: trashPiece.size)
        trashPiece.physicsBody?.affectedByGravity = false
        trashPiece.physicsBody?.friction = 0
        
        
        addChild(trashPiece)
        
        
        let actualDuration = CGFloat.random(in: 1.0...10.0)
        let actionMove = SKAction.move(to: CGPoint(x: 100, y: actualY), duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        trashPiece.run(SKAction.sequence([actionMove, actionMoveDone]))
        
        
    }
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max-min) + min
    }
}

