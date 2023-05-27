import java.util.*;

private float SQUARE_SIZE;

private int cost;
private int timer; //unsure if needed
private int unitLimit;

private int[][]map; //USELESS but nice to have
private int[][]ogmap; //for displaying inventory with map DO NOT TOUCH
private int[][]charMap;
private int[][]eneMap;
private ArrayList<int[]> enemyPath;//just to make it work at the moment


private TowerCharacters[]inventory;

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

  lvlOne();
  //lvlOneEnemyPath();
  //frameRate(1);

  //SETUP LIVING OBJECTS

  //Enemies(int hp, int spd, int atk, int hit, int[] position, String img)
  Enemies brr = new Enemies(1, 2, 3, 4, new int[]{5, 5}, "hi");

  //TowerCharacters(int hp, int spd, int atk, int hit, String img, int blk, String type, int dp){
  TowerCharacters op0 = new TowerCharacters(50, 0, 1, 1, "ayer.png", 1, GROUND, 2);
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

void draw() {
  if (levelSelect > 0) {
    gameMap(ogmap);
    inventory();
    displayChar();
  }
  //if (!onMenu) {
  //  slug = loadImage("originium_slug.png");
  //  if (enemyPath.size() > 1) {
  //    int[] coords = enemyPath.remove(enemyPath.size() - 1);
  //    image(slug, coords[1] * SQUARE_SIZE, coords[0] * SQUARE_SIZE);
  //  }
  //}
}

void mouseClicked() {
  //menu select
  if (onMenu) {
    if (mouseX >= 325 && mouseX <= 675 && mouseY >=175 && mouseY <= 225) {
      levelSelect = 1;
      lvlOne();
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
    if (equal){
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
    //opSelect = false;
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
      while (!inventory[index].getDeployed() && inventory[index].getType() == map[selectedY][selectedX]) {
        inventory[index].setDeployed(true);
        charMap[selectedY][selectedX] = index;
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
      println("removed character");
    } else {
      opRemove = false;
    }
  }
}

/////////////////MAPS SETUP////////////////////////////

void lvlOne() {
  //MAP1 for placement purposes
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
  enemyPath.add(new int[]{1, 0});
  enemyPath.add(new int[]{1, 1});
  enemyPath.add(new int[]{2, 1});
  enemyPath.add(new int[]{2, 2});
  enemyPath.add(new int[]{2, 3});
  enemyPath.add(new int[]{1, 3});
  enemyPath.add(new int[]{1, 4});
  enemyPath.add(new int[]{1, 5});
  enemyPath.add(new int[]{1, 6});
  enemyPath.add(new int[]{2, 6});
  enemyPath.add(new int[]{2, 7});
  enemyPath.add(new int[]{2, 8});
}


///////////DISPLAYING/////////////////////////////////////

void gameMap(int[][]grid) { //pass ogmap
  SQUARE_SIZE = width/map[0].length;
  strokeWeight(1);
  stroke(255, 255, 255);
  float l = 0;
  float k = 0;
  
  float selectl = 0;
  float selectk = 0;
  
  for (int i = 0; i < grid.length || ( l < 950 && k < 600 ); i++) {
    k = 0;
    for (int j = 0; j < grid[i].length; j++) {
      if(opSelect && i == selectedY && j == selectedX){
        selectl = l;
        selectk = k;
      }
      
      if (grid[i][j] == WALL) {
        fill(color(51));
      } else if (grid[i][j] == GROUND) {
        fill(color(0, 0, 255));
      } else if (grid[i][j] == AERIAL) {
        fill(color(255, 0, 0));
      } else { //INVENTORY
        fill(color(0, 150, 150));
      }
      rect(k, l, SQUARE_SIZE, SQUARE_SIZE);
      k += SQUARE_SIZE;
    }
    l += SQUARE_SIZE;
  }
  if(opSelect){
  strokeWeight(10);
  stroke(color(0, 255,0));
  rect(selectk, selectl, SQUARE_SIZE, SQUARE_SIZE);
  }
}

void displayChar() {
  for (int i = 0; i < charMap.length; i++) {
    for (int j = 0; j < charMap[i].length; j++) {
      if (charMap[i][j] >= 0) {
        PImage op0 = loadImage(inventory[charMap[i][j]].getSprite());
        image(op0, SQUARE_SIZE*j - 30, SQUARE_SIZE*i - 70, 175, 175);
      }
    }
  }
}

void inventory() {
  //display inventory
  for (int i = 0; i < 6; i++) {
    if (!inventory[i].getDeployed()) {
      PImage op0 = loadImage(inventory[i].getSprite());
      if(opSelect){
        int type = map[selectedY][selectedX];
        if(inventory[i].getType() != type){
          tint(255,0,0);
        }
      }
      image(op0, SQUARE_SIZE*i, SQUARE_SIZE*3.5, 150, 150);
      noTint();
    }
  }
}
