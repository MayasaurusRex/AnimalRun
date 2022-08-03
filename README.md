# AnimalRun iOS App
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
My software files, shown above, provide a little more insight into the actual implementation of the MVC methods for the app. The last four files (GameScene.swift, startScene.swift, ScoreboardScene.swift, and ScoreboardManager.swift) each represent a "view". Each of these views use different libraries to display information on the screen. Tthey each take in user input and handle it, and any relavant data is stored persistently. User inputs, such as navigating to different pages is also handled within each view. 
\
\
I thought this was interesting because before my research into the implementation MVC, I thought MVC would include more files specific to the Model and Control functions as well, rather than just implementing the logic within the files. I would say this is the area of the project that I learned the most!

