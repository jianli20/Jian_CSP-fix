//
//  DeathScene.swift
//  Jian_CSP
//
//  Created by Li, Jian Hong on 1/3/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit
import SpriteKit

public class DeathScene : SKScene
{
    override public func didMove(to view: SKView) -> Void
    {
        self.backgroundColor = SKColor.red
        
        let gameOver = SKLabelNode(text: "YOU LOSE")
        gameOver.name = "game over"
        gameOver.fontSize = 65
        gameOver.fontColor = SKColor.black
        gameOver.position = CGPoint(x: frame.midX, y: frame.midY)
        
        addChild(gameOver)
    }
    
    override public func touchesBegan (_ touches: Set <UITouch>, with event: UIEvent?) -> Void
    {
        let touch = touches.first
        let touchLocation = touch?.location(in:self)
        let touchedNode = self.atPoint(touchLocation!)
        if(touchedNode.name == "game over")
        {
            let newGameScene = GameScene(size: size)
            newGameScene.scaleMode = scaleMode
            let transitionType = SKTransition.flipHorizontal(withDuration: 0.5)
            view?.presentScene(newGameScene, transition: transitionType)
        }
    }
}
