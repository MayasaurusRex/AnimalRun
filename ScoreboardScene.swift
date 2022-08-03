import Foundation
import SpriteKit
import GameplayKit

class ScoreboardScene:SKScene{
    let score: Int = 0
    //leaderboard label
    let leaderLabel = SKLabelNode(fontNamed: "Verdana")
    //return label
    let returnLabel = SKLabelNode(fontNamed: "Verdana")
    //score label
    let scoreTable = ScoreBoardManager().scoreTable
    
    
    //funtion that adds labels to the scoreboard scene
    override func didMove(to view:SKView){
        backgroundColor = .purple
        //label for the leaderboard
        leaderLabel.fontSize = 40
        leaderLabel.fontColor = .white
        leaderLabel.position = CGPoint(x: frame.width/2, y: frame.height-100)
        leaderLabel.text = "Leaderboard"
        addChild(leaderLabel)
        

        //label for the return
        returnLabel.fontSize = 40
        returnLabel.fontColor = .white
        returnLabel.position = CGPoint(x: frame.width/2, y: frame.height/12)
        returnLabel.text = "Return to Start"
        addChild(returnLabel)
        print()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        let touch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if touchedNode == returnLabel{
            let gameScene = startScene(size: size)
            gameScene.scaleMode = scaleMode
            
            // use a transition to the gameScene
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 1)
            
            // transition from current scene to the new scene
            view!.presentScene(gameScene, transition: reveal)
        }
        
    }
    
    
    func print(){
        var counter = 0

        for i in (0...scoreTable.count-1).reversed(){
            let output = SKLabelNode(fontNamed: "Verdana")
            let mult = CGFloat(counter)
            output.fontSize = 20
            output.fontColor = .white
            output.position = CGPoint(x: frame.width/2, y: mult * frame.height/6 + 300)
            counter += 1
            output.text = "Player \(scoreTable[i].playerName) score: \(scoreTable[i].score)"
            addChild(output)
        }


    }
    
}
