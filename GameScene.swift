import Foundation
import SpriteKit
import GameplayKit


class GameScene: SKScene, UITextFieldDelegate{
    
    let clouds = SKSpriteNode(imageNamed: "clouds") // initializes the rainbow from the image
    let player = SKSpriteNode(imageNamed:"sheep.png") // defines a player character (sheep)
    var obstacles = [SKShapeNode]() // initializes the "hills"
    var obstacleVelocity:CGFloat = 50.0 // initializes velocity of the obstacles
    var dt:CGFloat = 0.0 // initializes change in time of the game
    var lastUpdateTime:CGFloat = 0.0 // initializes value of time since last update
    var playerHasFallen = false // variable to track if the
    var sc = SKLabelNode(fontNamed: "Verdana")
    var c = 0;
    var begin  = SKLabelNode(text: "Click anywhere to begin")
    var killed = 0
    var score = 0
    let goToGame = SKLabelNode(text: "PLAY AGAIN!")
    let goToScore = SKLabelNode(text: "LEADERBOARD!")
    let goToStart = SKLabelNode(text: "GO BACK!")
    var TextInput:UITextField?
    let scoreTable = ScoreBoardManager()
    
    
    
    override func didMove(to view: SKView){
        //adds the play again button to the screen
        goToGame.fontSize = 25
        goToGame.position = CGPoint(x:frame.width/2, y:3*frame.height/6)
        addChild(goToGame)
        goToGame.fontName = "Chalkduster"
        
        //adds the score button to the game
        goToScore.fontSize=25
        goToScore.position = CGPoint(x:frame.width/2, y: 2*frame.height/6)
        addChild(goToScore)
        
        //add the go back button to the game
        goToStart.fontSize=25
        goToStart.position = CGPoint(x:frame.width/2, y:frame.height/6)
        addChild(goToStart)
        goToStart.fontName = "Chalkduster"
        goToScore.fontName = "Chalkduster"
        
        //background color of the game screen
        backgroundColor = UIColor(hue: 0.5194, saturation: 1, brightness: 0.93, alpha: 1.0) /* #00d1ed */
        
        //declares the ground and adds it to the screen
        let ground = SKShapeNode(rect:CGRect(x:0, y:0, width:size.width, height:30))
        ground.fillColor = UIColor(hue:200/360, saturation:80/100, brightness:20/100, alpha: 1.0)
        ground.position=CGPoint(x:0, y:0)
        ground.physicsBody = SKPhysicsBody(rectangleOf:ground.frame.size)
        ground.physicsBody?.allowsRotation = false
        ground.physicsBody?.isDynamic = false
        addChild(ground)
        if loseScreen() == 1 {
            ground.isHidden = true
        }
      
        //adds the rainbows to the screen
        clouds.position = CGPoint (x:size.width*0.5, y:size.height*0.8)//set the initial position of the player sprite
        clouds.size = CGSize(width:size.width, height:size.width*0.5)//make the llama bigger
        addChild(clouds)
        
        //adds the score to the screen
        addChild(sc)
        self.sc.position = CGPoint(x:frame.width/2, y:5*frame.height/6)
        
        //adds the llama to the screen
        player.position = CGPoint (x:size.width*0.5, y:size.height*0.5)//set the initial position of the player sprite
        player.size = CGSize(width:size.width*0.2, height:size.width*0.2)//make the llama bigger
        addChild(player)
        player.physicsBody = SKPhysicsBody(rectangleOf:player.size)
        player.physicsBody?.allowsRotation = false
    
        
    }
    // touchesBegan allows for the user to interact with the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //if it is the first touch on a label,then the user can go to a different screen
        let touch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        //goes to the game scene again
        if touchedNode == goToGame{
            let gameScene = GameScene(size: size)
            gameScene.scaleMode = scaleMode
            TextInput?.isHidden = true
            
            // use a transition to the gameScene
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 1)
            
            // transition from current scene to the new scene
            view!.presentScene(gameScene, transition: reveal)
        }
        
        //goes to the scoreboard scene
        if touchedNode == goToScore{
            let gameScene = ScoreboardScene(size: size)
            gameScene.scaleMode = scaleMode
            TextInput?.isHidden = true
            // use a transition to the gameScene
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 1)
            
            // transition from current scene to the new scene
            view!.presentScene(gameScene, transition: reveal)
        }
        
        //goes to the start screen
        if touchedNode == goToStart{
            let gameScene = startScene(size: size)
            gameScene.scaleMode = scaleMode
            TextInput?.isHidden = true
            
            // use a transition to the gameScene
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 1)
            
            // transition from current scene to the new scene
            view!.presentScene(gameScene, transition: reveal)
        }
        
        if( (player.physicsBody?.velocity.dy)! < 100.0){
            player.physicsBody?.velocity = CGVector(dx:0.0, dy:1000.0)
       
        }
    }
    //funtion that updates the screen
    override func update (_ _currentTime:TimeInterval){
        goToGame.isHidden = true
        goToGame.fontColor =  UIColor(hue: 0.4556, saturation: 0.81, brightness: 0.80, alpha: 1.0)
        goToScore.isHidden = true
        goToScore.fontColor = .magenta
        goToStart.isHidden = true
        goToStart.fontColor = UIColor(hue: 0.5667, saturation: 0.81, brightness: 0.80, alpha: 1.0)
        if lastUpdateTime>0{
            dt = CGFloat(_currentTime) - lastUpdateTime
        }else{
            dt = 0
        }
        let aLocation = size.width + CGFloat(obstacles.count)*size.width/4
        if obstacles.count < 100{
            pushObstacle(xLocation: aLocation)
        }
        popObstacle()
        moveObstacle(dt: dt)
        lastUpdateTime = CGFloat(_currentTime)
        
        scoreUpdate()
        
        if loseScreen() == 1 {
            obstacleVelocity = 0.0
            moveObstacle(dt: 0)
            backgroundColor = .black
            sc.fontSize = 20
            sc.fontColor = .red
            sc.text = String("YOU LOSE! YOUR SCORE WAS: \(c)")
            for obs in obstacles {
                obs.isHidden = true
            }
            clouds.isHidden = true
            goToGame.isHidden = false
            goToScore.isHidden = false
            goToStart.isHidden = false
        }
        
        
    }
    
    func pushObstacle(xLocation:CGFloat){
        self.childNode(withName: "ground")?.removeFromParent()
        let xL = Int(xLocation)
        let rand = Int.random(in: 0..<500)
        let wide = Int(size.width*0.25)
        let hill = SKShapeNode(rectOf:CGSize(width:wide, height:rand))
        hill.fillColor = UIColor(hue: 0.3778, saturation: 1, brightness: 0.48, alpha: 1.0) /* #007a20 */
        hill.physicsBody = SKPhysicsBody(rectangleOf:hill.frame.size)
        hill.position=CGPoint(x:xL+wide, y:0)
        hill.physicsBody?.isDynamic = false
        //addChild(hill)
        obstacles.append(hill)
        addChild(hill)
        
    }
    func popObstacle(){
        
        for ob in obstacles {
            if (ob.position.x < 0 ){
                obstacles.remove(at: 0)
                ob.removeFromParent()
                c+=1
            }
        }
        
        sc.text = String(("Score: \(c)"))
        
        //print(c)
    }
    func scoreUpdate(){
        
        for ob in obstacles {
            if(ob.position.x < frame.width && ob.position.x > 0){
                if(ob.position.x < player.position.x){
            }
        }
    }
    }
    func moveObstacle(dt: CGFloat){
        for obstacle in obstacles{
            obstacle.position.x-=obstacleVelocity*dt*5
        }
    }
    
    func loseScreen() -> Int{
        if !intersects(player){
            if killed < 1{
                killed += 1
                print("You Lose!")
                text()
            }
        }

        return killed
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        scoreTable.addEntry(name: textField.text!, score: c)
        TextInput?.isHidden = true
        return true
    }
    
    func text(){
        self.TextInput = UITextField()
        TextInput?.frame = CGRect(x: frame.width/4, y: 2*frame.height/6, width: 200, height: 40)
        TextInput?.backgroundColor = .white
        TextInput?.placeholder = "Enter name & return"
        TextInput?.delegate = self
        TextInput?.isHidden = false
        self.view!.addSubview(TextInput!)
    }
    
}

