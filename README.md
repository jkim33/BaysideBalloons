# BaysideBalloons - Jason Kim and Derek Song
## APCS2 Final Project
## 4 Years At Stuy : Mini-RPG

## Description
<p>
  This is a Mini-RPG that is meant to resemble a student's 4 years at Stuyvesant. You will venture through the halls to defeat the obstacles of Freshmen, Sophomore, Junior and Senior Year. As you venture to overcome these challenges, there will be enemies along the way that you will fight. At the end of each year, there is a boss to defeat. Once you defeat the boss, you gain an upgrade in every stat. </p>
<p>
  Freshmen Year, you are out to defeat the librarian. Your mission is to search for the library and once you do, walk until you encounter the library itself. Sophomore Year, you search for you coach to defeat him! Try and find where the swimming pools are. Junior Year, you are tackling the most difficult challenge yet, the SATs! Stuy decided to administer the test in the cafeteria. Defeat it and save many from suffering. Finally, in Senior Year, you have senioritis. This causes you to go out on an adventure to defeat the one thing standing in between you and college - Your Teacher. You can find your specific teacher in a classroom. </p>
  
## How it Works
<p>
  RPG is the driver file! It has the setup() and draw() method that creates and runs the whole games. It's in charge of connecting the many little classes together! It also has the keyPressed() method that takes in the user input. </p>
<p>
  We have a player class that has the stats and, the attack() and move() method for the player. </p>
<p>
  We have the enemy class that has stats, and the attack() method. There are many subclasses.</p>
<p> 
  Something interesting we have is class Tiles. This class is essential as its subclasses are the little squares filling up the screen with little graphics. Tiles have properties like the image they're holding and the type of tile they are. This allowed us to make certain tiles floor, others became walls, and some became "portal" tiles and took us to a different Map. </p>
<p> 
  Speaking of Map, that is another interesting class. It has the display() method, which takes all the tiles, and puts them up for the user to see. </p>
<p>
  In terms of our battle system, we have a traditional system. Higher speed goes firsts and attacks. You have 3 moves to choose from. However, Presentation and Power-Nap require a certain amount of Time to use. Because of this, you cannot use these attacks all the time. The amount of time each attack takes is indicated to the right of the attack name. </p>
  
## How to Play
- You can move using the UP, DOWN, LEFT, RIGHT arrow keys. This will control your character on screen.
- Everytime you move, there's a chance that you will encounter a battle.
- When you do encounter a battle, you have 3 options for attacks. 
  1) Attack: 0
  2) Presentation: 5
  3) Power-Nap: 30
  - The numbers to the left represent the number key you should press to attack.
  - The numbers to the right represent the amount of time needed to execute the attack.
- Once the battle is done, you return to the overworld.
- The goal of the game is to defeat all 4 bosses. Hints are given in the description.
  
## Launch Instructions
  1) Open the Terminal. Clone this repository. 
    - HTTPS: git clone https://github.com/jkim33/BaysideBalloons.git
    - SSH: git clone git@github.com:jkim33/BaysideBalloons.git
  2) Change your directory until you are in the RPG directory.
    - Use cd in the terminal. 
    - cd someDirectory/BaysideBalloons/RPG/
  3) Open Test.pde with processing.
    - In terminal, type: processing RPG.pde
  4) In processing, hit the play button!
