import Foundation
import SpriteKit
import GameplayKit
import UIKit

class startScene:SKScene{
    let tapStartLabel = SKLabelNode(fontNamed: "Verdana")
    let leadLabel = SKLabelNode(fontNamed: "Verdana")
    var title = SKLabelNode(fontNamed: "Verdana")
    let sheep = SKSpriteNode(imageNamed: "sheep.png")
    
    override func didMove(to view:SKView){
        
        sheep.position = CGPoint(x:frame.width/2, y:4*frame.height/6)
        sheep.size = CGSize(width:size.width*0.3, height:size.width*0.3)//make the llama bigger
        addChild(sheep)
        
        backgroundColor = UIColor(hue: 0.5889, saturation: 1, brightness: 0.4, alpha: 1.0) /* #002f66 */
        tapStartLabel.fontSize = 40
        tapStartLabel.fontColor = .white
        tapStartLabel.position = CGPoint(x: frame.width/2, y: frame.height/2)
        tapStartLabel.text = "Start Game"
        addChild(tapStartLabel)
        
        leadLabel.fontSize = 40
        leadLabel.fontColor = .white
        leadLabel.position = CGPoint(x: frame.width/2, y: frame.height/2-100)
        leadLabel.text = "Leaderboard"
        addChild(leadLabel)
        
        
        
        title.fontSize = 50
        title.fontColor = .white
        title.position = CGPoint(x: frame.width/2, y: 5*frame.height/6)
        title.text = "ANIMAL RUN!"
        addChild(title)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        let touch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if touchedNode == tapStartLabel{
            let gameScene = GameScene(size: size)
            gameScene.scaleMode = scaleMode
        
            // use a transition to the gameScene
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 1)
        
            // transition from current scene to the new scene
            view!.presentScene(gameScene, transition: reveal)
        }
        
        if touchedNode == leadLabel{
            let gameScene = ScoreboardScene(size: size)
            gameScene.scaleMode = scaleMode
            
            // use a transition to the gameScene
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 1)
            
            // transition from current scene to the new scene
            view!.presentScene(gameScene, transition: reveal)
        }
    }

}
