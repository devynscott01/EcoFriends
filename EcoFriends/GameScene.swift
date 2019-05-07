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
import SafariServices

struct PhysicsCategory {
    static let trashPiece: UInt32 = 0b1
}


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    var background = SKSpriteNode(imageNamed: "sea")
    //var trashPiece = SKSpriteNode(imageNamed: "cup")

    
    
    override func didMove(to view: SKView) {
        background.scale(to: CGSize.init(width: 1400, height: 750))
        background.zPosition = 0
        background.position = CGPoint(x: self.size.width / 40, y: self.size.height / 40)
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector.zero
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = border
        
    
    addChild(background)
       /*if let url = URL(string: "https://www.oceanicsociety.org/blog/1720/7-ways-to-reduce-ocean-plastic-pollution-today") {
            UIApplication.shared.open(url)
        }*/
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(trash), SKAction.wait(forDuration: 1.0)])))
   
        let button = SKSpriteNode(imageNamed: "button-play")
        button.zPosition = 100
        button.scale(to: CGSize(width: 500, height: 250))
        button.name = "play"
        addChild(button)
      }
    
    
    
    // >:) hi
    func trash () {
       
        var spriteImages: [SKTexture] = []
        
        spriteImages.append(SKTexture(imageNamed: "flipflop"))
         spriteImages.append(SKTexture(imageNamed: "bottle"))
         spriteImages.append(SKTexture(imageNamed: "can"))
         spriteImages.append(SKTexture(imageNamed: "cup"))
         spriteImages.append(SKTexture(imageNamed: "paper"))
         spriteImages.append(SKTexture(imageNamed: "soap"))
         spriteImages.append(SKTexture(imageNamed: "straw"))
         spriteImages.append(SKTexture(imageNamed: "waterbottle"))
        
    
       
        let rand = Int(arc4random_uniform(UInt32(spriteImages.count)))
        let textures = spriteImages[rand]
        
         print("random image generated")
        
        let trashPiece = SKSpriteNode()
        
        trashPiece.texture = textures
        trashPiece.size = textures.size()
        
        print("working")
        trashPiece.isUserInteractionEnabled = false
        trashPiece.scale(to: CGSize(width: 75, height: 75))
        let actualY = random(min: -300, max: 0)
       
        trashPiece.position = CGPoint(x: size.width + trashPiece.size.width/2, y: actualY)
        
        trashPiece.physicsBody = SKPhysicsBody(rectangleOf: trashPiece.size)
        trashPiece.physicsBody?.affectedByGravity = false
        trashPiece.physicsBody?.friction = 0
        trashPiece.zPosition = 3
        trashPiece.name = "garbage"
        addChild(trashPiece)
        
        print("working 2")
        let actualDuration = CGFloat.random(in: 5.0...8.0)
        let actionMove = SKAction.move(to: CGPoint(x: -700, y: actualY), duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        trashPiece.run(SKAction.sequence([actionMove, actionMoveDone]))
        
        
    }
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max-min) + min
    }
    
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    for touch in touches{
        
        let location = touch.location(in: self)
        let touchedNode = self.atPoint(location)
        
        if touchedNode.name == "garbage" {
            
            touchedNode.removeFromParent()
            break;
        }
            else if touchedNode.name == "play"{
                touchedNode.removeFromParent()
                break;
            }
            
        
        
    }
    
    
                }
    

 }
    


    

