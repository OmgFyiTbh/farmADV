# farmADV
A farming program for computer craft tweaked in Feed the Beast Revelations.

FarmADV consists of two programs the main farming program and a inventory management program that is loaded as an API.

The farming program is designed and tested in Feed the Beast Revelations and will manage a 16x32 blobk wheat farm. 

This modpack has a quality of life mod that makes the hoe both in had and on the farming bot break more than one bloock at a time thus making the farming turtle unusable.
The work around for this is use a regual turtle equipped with diamond sword. At the moment the code is writen that this needs to be on the left.

The code at present is also writen to have a modem on the right of the turtle and sends strings over this modem to a display program that runs on another computer. this function can be removed by deleting the print() funtion within farmADV.

The inventory api "inv" has a number of functions that allows inventory magement and item selcetion on the CC turtles. please use this in your programs.

SETTING UP THE PROGRAM, TURTLE AND FARM:

FARM:
  - Fence of and till a 16x32 block farm with water blocks as required
  - All blocks must be tilled as the bot will not till before it plants
  - Then plant all blocks with wheat (only works with wheat at the moment...)

TURTLE:
  - Normal turtle
  - Sword equipped on left.
  - Sodem equipped on right.
  - Place turtle and bottom left position of farm coordinates (0,0) facing up the long edge of farm (y axis) one block above the dirt so it goes: Turtle, air then dirt.
  - Chest for wheat deposit behind turtle.
  - Chest for coal refueling on left of turtle, fill this with a few stacks of coal and top it up periodically.
 
 PROGRAM:
  - Run pastebin get rWrYd9xV setup
  - Once both parts of the program are downloaded Run setup
  - This will download farmADV and inv
  - To start farming run farmADV
  
Edit the code you download freely but please report bugs in the orginal code here if im not bored of this mod i will fix them. 
Happy farming.
  
