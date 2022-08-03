import Foundation
import UIKit.UIView

struct scoreEntry: Codable {
    var playerName: String = "player 0"
    var score: Int = 0
    init(theName: String, theScore: Int){
        playerName = theName
        score = theScore
    }
}

//scoreborad manager allows for persistant data
class ScoreBoardManager {
    var scoreTable: [scoreEntry] = []
    let maxEntries = 10
    let scoreFileName = "scores.json"
   
    //adds the users to the scoreboard
    func start(){
        for _ in 1...3{
            let n = scoreEntry(theName: "player", theScore: 0)
            scoreTable.append(n)
        }
    }
    //inthe array
    init(){
        start()
        readScoreFile()
    }
    
    //reads the score file
    func readScoreFile(){
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(scoreFileName)
        
            do {
                let scoreText = try String(contentsOf: fileURL, encoding: .utf8)
                let scoreData: Data? = scoreText.data(using: .utf8)
                let jsonDecoder = JSONDecoder()
                scoreTable = try jsonDecoder.decode([scoreEntry].self, from:scoreData!)
            }
            catch {
                print("can't read the data")
            }
        }
    }
    
//writres the score file
    func writeScoreFile(){
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(scoreFileName)
            
            do{
                let jsonEncoder = JSONEncoder()
                let jsonData = try jsonEncoder.encode(scoreTable)
                let jsonString = String(data: jsonData, encoding: .utf8)
                try jsonString!.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {
            }
        }
    }
        
        func addEntry(name: String, score: Int){
            let score1 = scoreTable[0].score
            let score2 = scoreTable[1].score
            let score3 = scoreTable[2].score
            print("reached add Entry!")
            let new = scoreEntry(theName: name, theScore: score)
            if new.score < score3{
            }
            else if new.score >= score3 && new.score < score2 {
                scoreTable.insert(new, at: 2)
            }
            else if new.score >= score2 && new.score < score1 {
                scoreTable.insert(new, at: 1)
            }
            else if new.score > score1 {
                scoreTable.insert(new, at: 0)
            }
            if scoreTable.count > 3{
                scoreTable.removeLast()
            }
            writeScoreFile()
            readScoreFile()
            print(scoreTable.count)
    }
            
    
}
