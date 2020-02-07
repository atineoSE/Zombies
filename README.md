# Zombies: an exercise for students learning iOS development

This is an exercise for students learning iOS development. It covers some fundamental aspects of UIKit with basic Swift.



## UIKit fundamentals

* UI elements to display static and dynamic data

* UI controls (e.g. buttons)

* Layout with StackViews and Auto Layout

* Design of interfaces in Interface Builder

* IBActions and IBOutlets

* Gesture recognizer (tap gesture)

  

## Basic Swift

* Structs and enums
* Stored and computed properties
* Collections and loops (including nested arrays)
* Control flow (if-else, switch, while, for-in)
* Functions
* Tuples



## Background

This is your first day as a junior iOS dev. You have been asked to fix a mini-game called Zombies.

**Zombies** has been in development for quite some time and it's heavily delayed. The CEO is really upset! The previous dev left the project unfinished and you must complete it ASAP.

At least the previous dev left some FIXMEs and TODOs, and it's all Swift, so you are confident that your hard-earned skills by studying best practices of iOS development will serve you well in this task.

Good luck!



## Game description

**Zombies** is a mini game where the player must find the SOS signpost to survive. 

The player appears at a corner in a dark room, where some zombies lie hidden. Adjusting the eyes to the darkness, the player can only see the closest surroundings, represented by squares in the vertical and horizontal direction.

At the other corner of the room, the SOS signpost shines in the dark. If only the player could reach it... he would be saved!



## User interface

Since this is a first release of the game and the goal is to gather feedback from early users before committing to expensive graphic design, we will be using emojis for the image assets.

Here is a list of what you'll need:

⬜️ = visible space in the room (squares right by the player)

⬛️ = dark space in the room, further away from the player

🚶‍♂️ = player, he is controlled with direction arrows

🧟 = zombie: if the player finds one, he will lose one life

🆘 = SOS signpost: if the player reaches it, he will be saved

❤️ = remaining lives for the player



## Supported devices

The game is made for iPad landscape only, since we will need to make use of larger displays.




Video demo
====================
Luckly, your designer has come up with an animation showing how the game should work. This will be helpful in understanding the desired behaviour.



![Video demo](./video_demo_zombies.gif)

 

## Controls

Under the grid representing the room, there are 4 arrows that you can use to move the player, according to the following rules:

* The direction of the arrow indicates the direction of the movement (e.g. up arrow moves up in the grid)

* The arrows corresponding to movements that would fall out of the grid are disabled and should be shown as grayed out to the user

* It is not possible to walk diagonally through the grid

  

## Game rules

* The squares in the grid will hide or reveal according to the player's position. The player can only see in the immediately neighbouring squares in the horizontal and the vertical directions (not diagonally).
* A revealed square can contain either:
  * An empty floor space (⬜️)
  * a zombie (🧟)
* The player will lose one life (❤️) if he finds a zombie. Zombies lie hidden in the dark, if the player doesn't bump into them, they won't notice the player, who can keep walking, advancing towards the SOS signpost.

* Initially the player has 3 lives (❤️❤️❤️).
* There are 2 zombies hidden in the room. The zombie are placed randomly in the room at the beginning of each round, but to guarantee that the game is always solvable, the zombies cannot be placed right by the starting point or the SOS signpost in the horizontal or vertical directions.
* If the user loses all his lives, then the counter for losses (**L**) should be incremented.
* If the player reaches the SOS signpost, then the counter for wins (**W**) should be incremented.
* When the round finishes, a message covering the whole UI should be shown. The message to display should be:
  * "You won! 🥳", if the user reaches the SOS signpost
  * "Try again!🤞", if the user bumps into a zombie but he has more than one life remaining
  * "You lost!☠️", if the user bumps into a zombie and he has just one life remaining
* We can dismiss the end-of-round message by tapping on the screen, in which case a new round begins.
* A new game begins (resetting the number of lives to 3) if the player reached the SOS signpost or if he lost all his lives.



## Clean code

Use all clean code measures that you are aware of (indenting, consistent spacing, good naming, extracting duplication into reusable functions,  using computed properties for derived properties, etc)



## TODOs and FIXMEs

There are 5 TODOs and 5 FIXMEs in order to solve this exercise. There is also one crash. Your task is to solve all these to reach the functioning state shown in the video from your designer.

Plan your work so that you are most efficient. What will you address first? How will you debug the problems effectively? Would you benefit by troubleshooting some bits in a Xcode playground?



## Optional features (stretch goals)

Your designer has some ideas for further improvements to the game and they are asking you to implement them, if you have time. 



## Add a blocking square (🚧)

* Remove one zombie (leave just one, again placed randomly but not too close to the start and end points)
* Add a blocking square (🚧) randomly (same positioning rules as a zombie)
* The user cannot go in the direction of the block, and the direction arrows should be disabled in that case



## Add a flashlight (🔦)

* Leave just one zombie (same positioning rules as before apply)
* Add a flashlight  (🔦) randomly (same positioning rules as before apply)
* If the user reveals the flashlight, all squares in the room go alight, therefore the zombie is revealed
* Once the zombie is revealed, he will move towards the player, one square every time the player moves. The zombie should move towards the player, trying to shorten the distance towards him, either in the vertical or horizontal direction
* The player will get caught if the zombie comes withing one square distance (just as when the room was dark)

