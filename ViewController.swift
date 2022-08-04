import UIKit
import SpriteKit
import GameplayKit

class ViewController: UIViewController {
    
    /* This function leads in the first view of the game.
       I overwrote it to  load in the start screen view. */
    override func viewDidLoad() {
        // call the 
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let scene = startScene(size: view.bounds.size) // define an instance of the start screen view
        let skView = view as! SKView // define an instance from the sprite kit library
        scene.scaleMode = .resizeFill // resize the view based on the phone or device characteristics
        skView.presentScene(scene) // display the start screen
    }
    
}
