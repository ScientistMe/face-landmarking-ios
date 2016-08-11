//
//  GameScene.swift
//  DisplayLiveSamples
//
//  Created by Stanley Chiang on 8/11/16.
//  Copyright © 2016 ZweiGraf. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var polygonNode: SKSpriteNode!
    var polygon:SKShapeNode!
    
    override func update(currentTime: CFTimeInterval) {
        let mouth = (UIApplication.sharedApplication().delegate as! AppDelegate).mouth
        if !mouth.isEmpty && mouth.first!.x != 0 && mouth.first!.y != 0 {
            //        create player position and draw shape based on mouth array
            if polygonNode != nil { polygonNode.removeFromParent() }
            addMouth(mouth)
        }
    }
    
    func addMouth(mouth:[CGPoint]) {
        print(mouth)
        var anchorPoint:CGPoint!
        let pathToDraw:CGMutablePathRef = CGPathCreateMutable()
        
        let center = self.view!.convertPoint( CGPointMake( (mouth[2].x + mouth[6].x) / 2, (mouth[2].y + mouth[6].y) / 2), toScene: self)
        
        for m in mouth {
            let mm = self.view!.convertPoint(m, toScene: self)
            if m == mouth.first! {
                anchorPoint = mm
                CGPathMoveToPoint(pathToDraw, nil, mm.x, mm.y)
            } else {
                CGPathAddLineToPoint(pathToDraw, nil, mm.x, mm.y)
            }
        }
        CGPathAddLineToPoint(pathToDraw, nil, anchorPoint.x, anchorPoint.y)
        
        polygon = SKShapeNode(path: pathToDraw)
        polygon.antialiased = true
        polygon.strokeColor = SKColor.redColor()
        polygon.fillColor = SKColor.redColor()
        polygon.name = "mouthshape"
        
        let texture = view!.textureFromNode(polygon)
        polygonNode = SKSpriteNode(texture: texture, size: polygon.calculateAccumulatedFrame().size)
        polygonNode.physicsBody = SKPhysicsBody(texture: polygonNode.texture!, size: polygonNode.calculateAccumulatedFrame().size)
        
        polygonNode.name = "mouthnode"
        polygonNode.position = center
        self.addChild(polygonNode)
        
    }
}
