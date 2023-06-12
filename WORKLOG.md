# Work Log

## GROUP MEMBER 1 //SAFIKA

### 5/22/23

- created lvl 1 map
- commented plans for future

reminders:
- work on inventory
- tiles class?
- research ak characters

### 5/23/23

- working with the livingobjects class & its children
- planned out movement

reminders:
- add SPRITES

- working on livingobject classes (enemies & TowerCharacters)
- planned out two ways to implement enemy & character interaction

reminders:
- ADD SPRITES

### 5/24/23

- displayed inventory
- layout for sprites & other images
- added sprite & deployed vars to ops (towercharacters)

reminders:
- add placement

GOALS
- get enemy moment(including stopping when interacting with a character) n character placement & returning character done by friday

### 5/25/23

- worked on keypress controls for character placement & removal
- edited op vars

ISSUES
- issue with keypress direction selection
- issue with displaying text instructions for keypress

REMINDERS
- Add highlight to selected block
- Add ranges to livingObjects
- On charMap set enemy spawn n charBase to wall
- Fix display of characters to fit in squares
- Organize code

### 5/26/23
- Fixed issues with directselect
- added indicators for selection
- added cost, global timer, & unit limit
- display ops better

ISSUES
- text indicators for selection are not working

REMINDERS
- test ranges (work on ranges & individual object timers)

### 5/27/23
- changed range & tested
- working on character and enemy interaction

ISSUES
- text indicators for selection not working

### 5/29/23
- added character attacking enemies and rangezero

ISSUES
- text indicators

reminders
- add rangeone & range two

WHAT NEEDS TO BE DONE B4 DEMO:
- test character attacking MOVING enemies : safika
- enemies attacking characters : raymond
- how many enemies & lp stats : safika
- hp bars for enemies & characters : raymond
- set up map one with all correct characters & enemies with proper diverse stats : both
- results screens: safika

### 5/30/2023
- fixed ranges and added rangeone
- fixed text indicators
- added lp & enemies left stats

working on
- rangetwo
- results screen

### 5/31/2023
- created backup enemy move method

### 6/1/2023
- organized code into different classes
- added results screens

DEMO
- test character attacking MOVING enemies
-


## GROUP MEMBER 2 //RAYMOND

### 5/22/23

- Created skeleton of TowerCharacters class with getters and setters
- Created a simple attack method for SniperMeteorite (child class of TowerCharacters) (on branch character_meteorite)

### 5/23/23

- successfully merged branch character_meteorite into main
- created basic menu format
- tried to implement clickable level buttons in menu, but did not work

reminders:
- find out if mouseClicked() operates only during draw() or can it operate during setup()

### 5/24/23

- made a path for enemies
- successfully made enemy cross map in path

reminders:
- figure out how to make path of enemy slower
- figure out how to remove image

### 5/25/23

- got enemy path to work
- attempted to implement pause, but does not work as intended

### 5/26/23

- working on enemy movement
- revamped enemyPath in game (new parameter in the int array elements)
- new move method (have not tested yet)

### 5/29/23

- still working on enemy movement (still need to test movement)
- updated Enemy class to include new variables to help with coding enemy movement
- added ticks to Enemy class

### 5/30/23

- second revamp of enemy move method (succeeded!)
- tested and worked
- commented out useless variables and methods

NEED TO DO:
- adjust image displaying (not synced with squares)

### 5/31/23

- fixed image displaying
- fixed path
- implemented enemy speed

### 6/1/23

- fixed problem of displaying 2 enemies instead of 1
- enemy can attack character now
- demo finalized and pushed

### 6/4/23

-completed enemy block (not tested)
-rearranged code to make it look nicer in main final

Found Bug:
- life points keep decreasing after enemy reaches end

### 6/5/23

-tried to work on pause, I would say around ~60 percent done
-had to revamp it because previous method did not work as intended

### 6/6/23

- i think pause works as intended now
- maybe life points problem fixed (needs testing)

### 6/8/23

- attempted to add multiple enemies

### 6/9/23

- still attempting to add multiple enemies, yet it broke, will work on a fix

### 6/11/23

- finished creating maps for levels 2 and 3
- successfully allowed multiple enemies to follow a set path on the maps
