import java.util.*;
private float SQUARE_SIZE;

private int cost;
private int timer;
private int unitLimit;

private int[][]map; //NOT USELESS CHECK LVL SETUP OPTIMIZE LATER
private int[][]ogmap; //for displaying inventory with map DO NOT TOUCH
private int[][]charMap;
private int[][]eneMap;
private ArrayList<int[]> enemyPath;//just to make it work at the moment
//int[] inside is in the format [row, col, direction of next block]
//next block: 1 = up, 2 = right, 3 = down, 4 = left, 0 = none (last element)

private TowerCharacters[]inventory;
private ArrayList<Enemies>enemyList;

static final int WALL = -1;
static final int AERIAL = -2;
static final int GROUND = -3;

static final int T = 1;
static final int R = 2;
static final int D = 3;
static final int L = 4;

private boolean onMenu = true;
private boolean onMap = false;
private boolean opSelect = false;
private boolean directionSelect = false;
private boolean opRemove = false;

private int selectedX;
private int selectedY;

private int levelSelect = 0;

private PImage slug;
int delay = 10;
private Enemies sluggy;

void setup() {
  //menu screen
  size(1000, 550);
  rect(325, 175, 350, 50);
  rect(325, 250, 350, 50);
  rect(325, 325, 350, 50);
  textSize(20);
  fill(0);
  text("Level One", 450, 210);
  text("Level Two", 450, 285);
  text("Level Three", 450, 360);

  //////////////////SETUP LIVING OBJECTS//////////////////

  //Enemies(int hp, int spd, int atk, int hit, int[] position, String img)

  sluggy = new Enemies(10, 10, 0, 0, "originium_slug.png", 250, 950, (int)SQUARE_SIZE);
  slug = loadImage(sluggy.getSprite());

  //SETUP ENEMYLIST
  enemyList = new ArrayList<Enemies>();
  enemyList.add(sluggy);

  //TowerCharacters(int hp, int spd, int atk, int hit, String img, int blk, String type, int dp){
  TowerCharacters op0 = new TowerCharacters(50, 20, 5, 1, "ayer.png", 1, GROUND, 2);
  TowerCharacters op1 = new TowerCharacters(50, 0, 1, 1, "meterorite.png", 1, AERIAL, 2);
  TowerCharacters op2 = new TowerCharacters(50, 0, 1, 1, "purestream.png", 1, AERIAL, 2);
  TowerCharacters op3 = new TowerCharacters(50, 0, 1, 1, "kaltsit.png", 1, AERIAL, 2);
  TowerCharacters op4 = new TowerCharacters(50, 0, 1, 1, "mudrock.png", 1, GROUND, 2);
  TowerCharacters op5 = new TowerCharacters(50, 0, 1, 1, "mizuki.png", 1, GROUND, 2);

  //SETUP INVENTORY
  inventory = new TowerCharacters[6];
  inventory[0] = op0;
  inventory[1] = op1;
  inventory[2] = op2;
  inventory[3] = op3;
  inventory[4] = op4;
  inventory[5] = op5;
}

Display display = new Display();

void draw() {
  if (levelSelect > 0) {
    display.gameMap(ogmap);
    timer++;
    display.inventory();
    display.displayChar();
    display.limits();
    charAction();
        lvlOneEnemyPath();
    if (enemyPath.size() > 1) {
      int sqSize = (int)(SQUARE_SIZE);
      println(sqSize);
      sluggy.movePath(enemyPath, 10, sqSize);
  }
  //if (!onMenu) {
  //  lvlOneEnemyPath();
  //  if (enemyPath.size() > 1) {
  //    int sqSize = (int)(SQUARE_SIZE);
  //    println(sqSize);
  //    sluggy.movePath(enemyPath, 10, sqSize);
  //    //image(slug, sluggy.getXCoord(), sluggy.getYCoord());
  //  }
  //}
}
}

Maps level = new Maps();

void mouseClicked() {
  //menu select
  if (onMenu) {
    if (mouseX >= 325 && mouseX <= 675 && mouseY >=175 && mouseY <= 225) {
      levelSelect = 1;
      level.lvlOne();

      //testing
      eneMap[2][3] = 0;
      enemyList.get(0).setLocation(new int[]{2, 3});


      onMenu = false;
      onMap = true;
    }
    if (mouseX >= 325 && mouseX <= 675 && mouseY >=250 && mouseY <= 300) {
      levelSelect = 2;
      onMenu = false;
      onMap = true;
    }
    if (mouseX >= 325 && mouseX <= 675 && mouseY >=325 && mouseY <= 375) {
      levelSelect = 3;
      onMenu = false;
      onMap = true;
    }

    /////GAME PLAY////
  } else if (onMap) {
    if (mouseX <= 950 && mouseY <= 550 - SQUARE_SIZE && !(directionSelect)) {
      int row = 0;
      int column = 0;
      int w = mouseX;
      int h = mouseY;
      while (w > SQUARE_SIZE) {
        w -= SQUARE_SIZE;
        column++;
      }
      while (h > SQUARE_SIZE) {
        h -= SQUARE_SIZE;
        row++;
      }
      selectedX = column;
      selectedY = row;
      println(row + " " + column);
      if (map[row][column] == AERIAL || map[row][column] == GROUND) {

        if (!(charMap[row][column] > -1)) {
          opSelect = true;
        } else {
          opRemove = true;
        }
      } else {
        opSelect = false;
      }
    }
  }
}

void keyPressed() {
  if (directionSelect) {
    int index = charMap[selectedY][selectedX];
    while (keyPressed == false) {
    }
    String inputs = "wasd";
    boolean equal = false;
    for (int i = 0; i < inputs.length(); i++) {
      if (key == inputs.charAt(i)) {
        equal = true;
      }
    }
    if (equal) {
      if (key == 'w') {
        inventory[index].setDirection(T);
      }
      if (key == 'd') {
        inventory[index].setDirection(R);
      }
      if (key == 's') {
        inventory[index].setDirection(D);
      }
      if (key == 'a') {
        inventory[index].setDirection(L);
      }
      println("direction is " + inventory[index].getDirection());
      directionSelect = false;
    }
  }

  if (opSelect) {
    while (keyPressed == false) {
      //text display
      textSize(25);
      fill(color(0, 255, 0));
      text("Press #1-6 to select an operator", 0, SQUARE_SIZE*map.length);
    }
    String inputs = "123456";
    boolean equal = false;
    for (int i = 0; i < inputs.length(); i++) {
      if (key == inputs.charAt(i)) {
        equal = true;
      }
    }
    if (equal) {
      String keey = "" + key;
      int index = Integer.parseInt(keey) - 1;
      while (!inventory[index].getDeployed() && inventory[index].getType() == map[selectedY][selectedX] && ((cost - inventory[index].getDp()) >= 0) && unitLimit > 0) {
        cost -= inventory[index].getDp();
        charMap[selectedY][selectedX] = index;
        inventory[index].setLocation(new int[]{selectedX, selectedY});
        unitLimit--;
        inventory[index].setDeployed(true);
        directionSelect = true;
        opSelect = false;
      }
    }
  }

  if (opRemove) {
    while (keyPressed == false) {
    }
    if (key == ENTER && charMap[selectedY][selectedX] > -1) {
      int index = charMap[selectedY][selectedX];
      charMap[selectedY][selectedX] = map[selectedY][selectedX];
      inventory[index].setDeployed(false);
      unitLimit++;
      println("removed character");
    } else {
      opRemove = false;
    }
  }
}

void lvlOne() {
  //MAP1 for placement purposes
  cost = 5;
  unitLimit = 3;
  map = new int[4][9];
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 9; j++) {
      map[i][j] = GROUND;
    }
  }
  for (int i = 0; i < 9; i++) {
    if (i != 0 || i != 8) {
      map[0][i] = AERIAL;
      map[3][i] = AERIAL;
    } else {
      map[0][i] = WALL;
      map[3][i] = WALL;
    }
  }
  for (int i = 0; i < 4; i++) {
    map[i][0] = WALL;
    map[i][8] = WALL;
  }
  map[1][0] = GROUND;
  map[2][8] = GROUND;
  map[1][2] = AERIAL;
  map[2][4] = AERIAL;

  charMap = new int[4][9];
  eneMap = new int[4][9];

  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 9; j++) {
      charMap[i][j] = map[i][j];
      eneMap[i][j] = map[i][j];
    }
  }
 
  //maybe combine later***
  ogmap = new int[5][9]; //for display purposes INCLUDES INVENTORY
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 9; j++) {
      if (i != 4) {
        ogmap[i][j] = map[i][j];
      }
    }
  }
  
  map[2][8] = WALL;
  map[1][0] = WALL;
}

void lvlOneEnemyPath() {
  enemyPath = new ArrayList<int[]>();
  enemyPath.add(new int[]{1, 0, 0});
  enemyPath.add(new int[]{1, 1, 4});
  enemyPath.add(new int[]{2, 1, 1});
  enemyPath.add(new int[]{2, 2, 4});
  enemyPath.add(new int[]{2, 3, 4});
  enemyPath.add(new int[]{1, 3, 3});
  enemyPath.add(new int[]{1, 4, 4});
  enemyPath.add(new int[]{1, 5, 4});
  enemyPath.add(new int[]{1, 6, 4});
  enemyPath.add(new int[]{2, 6, 1});
  enemyPath.add(new int[]{2, 7, 4});
  enemyPath.add(new int[]{2, 8, 4});
}

void charAction() {
  for (int i = 0; i < inventory.length; i++) { //array of enemies must start at index 1 if peek = 0 hp then remove
    if (inventory[i].getDeployed()) {
      if (inventory[i].checkRange() != null) {
        println(inventory[i].checkRange());
        inventory[i].setAttacking(true);
        //inventory[i].increaseTicks();
        println ("move " + inventory[i].getTicks());
        if (inventory[i].getTicks()%inventory[i].getSpeed() == 0) {
          if (inventory[i].checkRange().getHealth() > 0) {
            println(inventory[i].checkRange().getHealth());
            inventory[i].toAttack(inventory[i].checkRange());
            if (inventory[i].checkRange().getHealth() <= 0) {
              inventory[i].setAttacking(false);
              //inventory[i].restartTicks();
              int[] position = inventory[i].checkRange().getLocation();
              eneMap[position[0]][position[1]] = map[position[0]][position[1]];
              enemyList.remove(0);
              inventory[i].blocked.remove();
            }
          }
        }
      }
    }
  }
}
