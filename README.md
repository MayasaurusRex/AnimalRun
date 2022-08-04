# AnimalRun iOS App
## Demo
A live demo of my app can be found here: \
https://youtu.be/BxetgsCngKk

## Motivations
My goal was to use this project as a way to learn more about iOS app design, specifically multi-page apps, using a software architecure format called Model-View-Controller (MVC).

## Software Desgin

### MVC Architecture
![mvc](https://user-images.githubusercontent.com/67076014/182691878-1b40eb67-800a-4a30-ac28-1b5ce468476c.png)
\
\
The MVC architecture was central to my software design. MVC is commonly used for UI desgin and web applications and defines the flow of the application. The Model acts as the backbone of the code and manages the data of the application and is in charge of updating the View. The View displays the information the user needs to see, depending on imput from the Model. The Controller recieves user input and can send the relevant information to the Model. The fundamental idea is that the controller does not affect to the view directly.

### Software Files
<img width="294" alt="Screen Shot 2022-08-03 at 3 55 52 PM" src="https://user-images.githubusercontent.com/67076014/182697548-b626a9f6-8d79-4e36-a285-7bd3dade8c48.png"> \
\
My software files, shown above, provide a little more insight into the actual implementation of the MVC methods for the app. The last four files (GameScene.swift, startScene.swift, ScoreboardScene.swift, and ScoreboardManager.swift) each represent a "view". Each of these views use different libraries to display information on the screen. They each take in user input and handle it, and any relavant data is stored persistently. User inputs, such as navigating to different pages is also handled within each view. 
\
\
I thought this was interesting because before my research into the implementation MVC, I thought MVC would include more files specific to the Model and Control functions as well, rather than just implementing the logic within the view files. I would say this is the area of the project that I learned the most!

## The Game
The game begins with the start screen, shown below: \
<img width="424" alt="Screen Shot 2022-08-03 at 3 27 57 PM" src="https://user-images.githubusercontent.com/67076014/182908554-e0c4446e-150a-46c8-9f34-0327fc978b1f.png"> \
\
The user can select to play the game or view the leaderboard. \
\
If the user selects to play the game, they will see this game screen: \
<img width="417" alt="Screen Shot 2022-08-03 at 3 28 13 PM" src="https://user-images.githubusercontent.com/67076014/182908984-c00c51c0-000f-4e6c-8143-76bdc4dd6829.png"> \
The user is a sheep and must tap the screen to jump over the hills. If the user fails to jump, the hills will push the sheep off the screen. If the user jumps too high, the sheep will leave the screen. The goal of the game is to stay on the screen for as long as possible. \
\
If the user loses, they will reach the user information screen: \
<img width="408" alt="Screen Shot 2022-08-03 at 3 28 26 PM" src="https://user-images.githubusercontent.com/67076014/182909386-3f7db402-7d37-4435-b004-6461d40af33b.png"> \
\
Here, the user can enter their name to join the leaderboard. They have the choice to play the game again, return to the start screen or check out the leaderboard. \
\
If they choose to go to the leaderboard, they will see this screen: \
<img width="410" alt="Screen Shot 2022-08-03 at 3 28 43 PM" src="https://user-images.githubusercontent.com/67076014/182909820-b749b8d7-ab93-447c-a338-6e7a35f2c7b1.png"> \
The leaderboard uses persistant data to store the top three players. From here, the user can navigate back to the start.



## Testing Results
| Test Case                          | Result      |
| :---:                              |    :----:   |     
| User can navigate to all pages     | TRUE        |
| Score accurately increments        | TRUE        |
| Pushed off of screen failure       | TRUE        |
| Jump too high failure              | TRUE        |
| Gravity accurately applied to sheep| TRUE        |
| User's name accepted               | TRUE        |
| Leaderboard successfully updates   | TRUE        |
| Persistant data for leaderboard    | TRUE        |


## Future Improvements
This project was a great introduction into multi-page iOS app design. My main goal for this project was to implement MVC architecture, however, I would love (and plan) to spend more time improving the actual game logic to create a more complicated/involved game. This would include adding more touch screen functionality that would have slightly different logic than that used in the simulation version. Also I would introduce for more object interactions in the game such as obstacles. Adding levels is also on my radar. Finally, since it is an iOS app, I'm hoping to add more forms of user input such as swiping, voice, etc. \
\
In the end, the best way to learn something is by doing it! I loved doing this project, and I learned so much about different architecture patterns, code implementations, and UI design. It was fun to add my own flair to the project with the animal theme, and I feel ready (and excited) to tackle more iOS projects moving forward!
