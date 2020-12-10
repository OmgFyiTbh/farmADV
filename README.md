# farmADV
A farming program for computer craft tweaked in Feed the Beast Revelations.

FarmADV consists of two programs the main farming program and a inventory management program that is loaded as an API.

The farming program is designed and tested in Feed the Beast Revelations and will manage a 16x32 block wheat farm. 

This modpack has a quality of life mod that makes the hoe both in hand and on the farming bot break more than one block at a time thus making the farming turtle unusable.
The work around for this is use a regular turtle equipped with diamond sword. At the moment the code is writen that this needs to be on the left.

The code at present is also writen to have a modem on the right of the turtle and sends strings over this modem to a display program that runs on another computer. this function can be removed by deleting the print() funtion within farmADV.

The inventory api "inv" has a number of functions that allows inventory magement and item selcetion on the CC turtles. please use this in your programs.

This Version has:
  - Auto harvest
  - Auto Seed
  - Auto Fueling from chest
  - Inventory checking
  - Continue with farming after a return to base
  - Will print strings over rednet to a receiving computer (you need to write the receiving program)

SETTING UP THE PROGRAM, TURTLE AND FARM:

FARM:
  - Fence of and till a 16x32 block farm with water blocks as required
  - All blocks must be tilled as the bot will not till before it plants
  - Then plant all blocks with wheat (only works with wheat at the moment...)

TURTLE:
  - Normal turtle
  - Sword equipped on left.
  - Modem equipped on right.
  - Place turtle a the bottom left position of farm coordinates (0,0) facing up the long edge of farm (y axis) one block above the dirt so it goes: Turtle, air then dirt.
  - Chest for wheat deposit behind turtle.
  - Chest for coal refueling on left of turtle, fill this with a few stacks of coal and top it up periodically.
 
 PROGRAM:
  - Run pastebin get rWrYd9xV setup
  - Once both parts of the program are downloaded Run setup
  - This will download farmADV and inv
  - To start farming run farmADV
  
Known issues:
- No way to exit the program once started
- No menu to allow farm size to be changed (requires changing from within code)
- Currently waits 5 mins between seed and harvest and will just harvest up un grown crops. change this in the code on the till function.

Edit the code you download freely but please report bugs in the orginal code here if im not bored of this mod i will fix them. 
Happy farming.
  
Credit for the inv library goes to Starkus, I used most of it made some changes and added some bit but source code is here: https://github.com/Starkus/quarry
