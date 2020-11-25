--DO NOT USE WITH A FARMING TURTLE USE A REGULAR TURTLE WITH A SWORD EQUIPED ON LEFT! 
--EQUIP MODEM TO RIGHT TO SEND PRINTS TO A MONITOR
os.loadAPI("inv")
local xAxis = 15 --start at 0 width of farm
local yAxis = 31 --start at 0 length of farm
local posX = 0   --the x axis pos val
local posY = 0   --y axis pos val
local lastPosX = 0 -- record of where it was in x axis
local lastPosY = 0--record of where it was in y axis
local facingFw = true --is the turtle facing forward up the Y axis (true is UP)
local lastFacingFw = true -- record of last direction facing (true is Up)
local harvest = true --is it in harvest mode
local till = false --is it in till mode
local goHome = false --is it going home mode
local fuel = false --is the enoguh fuel true = yes
local modem = peripheral.wrap("right") --Remove if not using a monitor
--funcs
--for moving up or down the Y axis
function moveFw()
    if facingFw then--checks direction
        if posY < yAxis  then
            posY = posY+1
            turtle.forward()
            sleep(0.5)
        else
            nextCol()
        end
    else
        if posY > 0 then
            posY = posY - 1
            turtle.forward()
            sleep(0.5)
        else
            nextCol()
        end
    end
end
--redefine print to send to monitor. Removes this and the turtle will print to its own terminal instead.
function print(string)
    modem.transmit(1, 1, string)
end
--move the bot to the next X col and chnages the direction facing.
function nextCol()
    if posY == 31 and posX < 15 then
        turtle.turnRight()
        turtle.forward()
        turtle.turnRight()
        posX = posX + 1
        facingFw = false
    elseif posY == 0 and posX < 15 then
        turtle.turnLeft()
        turtle.forward()
        turtle.turnLeft()
        posX = posX + 1
        facingFw = true
    end
end
--navigates the bot to start pos
function goToOrigin()
    goHome = true
    lastPosX = posX
    lastPosY = posY
    lastFacingFw = facingFw
    print("Returning to home")
    print("++++++++++++++++++++++++++++++++")
    if facingFw then
        turtle.turnLeft()
        for i=1, posX do
            turtle.forward()
        end
        turtle.turnLeft()
        for i=1, posY do
            turtle.forward()
        end
    else
        turtle.turnRight()
        for i=1, posX do 
            turtle.forward()
        end
        turtle.turnLeft()
        for i=1, posY do
            turtle.forward()
        end
    end
    turtle.turnRight()
    sleep(0.1)
    turtle.turnRight()
    posY = 0
    posX = 0
    facingFw = true
    clear()
    printInfo()
    print("I am at home")
    sleep(2)
end
--returns to its previous pos after a unload or return
function goToLastPos()
    for i=1, lastPosY do
        turtle.forward()
    end
    if lastPosX > 0 then
        turtle.turnRight()
    end
    for i=1, lastPosX do
        turtle.forward()
    end
    if lastFacingFw then
        turtle.turnLeft()
    else
        turtle.turnRight()
    end
    posX = lastPosX
    posY = lastPosY
    facingFw = lastFacingFw
end
--harvests using sword. Hoe in FTB break loads of blocks this breaks only one
function harv()
    turtle.digDown(left)
end
--tills and seeds
function tillMode()
    inv.selectItem("minecraft:wheat_seeds")
    sleep(0.2)
    turtle.placeDown()
end
--Prints Position of Bot and state
function printInfo()
    print("++++++++++++++++++++")
    print("Y: "..posY)
    print("X: "..posX)
    print("++++++++++++++++++++")
    if harvest then
        print("Mode: Harvest")
        print("++++++++++++++++++++")
    elseif till then
        print("Mode: Till")
        print("++++++++++++++++++++")
    elseif goHome then
        print("Mode: Return to Base")
        print("++++++++++++++++++++")
    end 
end
--clears for purpose of a modem program we use remove this and replace with clear for the terminal
function clear()
    print("clear")
end
--main
turtle.refuel()--place coal in slot one and will auto refuel on run only once
while true do
    if inv.checkFuel() ~= true then
        if inv.getFuel() ~= true then
            print("NO FUEL PLEASE HELP ME")
            os.shutdown()
        else
            print("I have lots of go juice")
            sleep("1")
        end
    end
    clear()
    printInfo()
    if posY == 0 and posX == 15 then
        if harvest == true then
            harv()
            print("Im done harvesting")
            print("Setting to till mode...")
            print("++++++++++++++++++++")
            sleep(2)
            goToOrigin()
            inv.dropInChest()
            harvest = false
            till = true
        elseif till == true then
            tillMode()
            print("I'm done tilling")
            print("setting harvest mode....")
            print("++++++++++++++++++++")
            sleep(2)
            goToOrigin()
            harvest = true
            till = false
            print("I'm sleeping to let the crops grow!")
            print("zzZZZZ....zzZZZZ....")
            sleep(480)
            print("I am awake now time to work!")
            sleep(2)
        end
    end
    if harvest == true then
        harv()
    elseif till == true then
        tillMode()
    end
    if inv.isInventoryFull() then
        inv.stackItems()
        if inv.isInventoryFull() then
            goToOrigin()
            inv.dropInChest()
            goToLastPos()
        end
    end
    moveFw()
end