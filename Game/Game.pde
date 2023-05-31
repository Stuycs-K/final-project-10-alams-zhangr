import java.util.*;
private float SQUARE_SIZE;

private int cost;
private int timer;
private int unitLimit;
private int lp;
private int totalenemies;
private int enemiesleft;

private int steps;

private int[][]map; //NOT USELESS CHECK LVL SETUP OPTIMIZE LATER
private int[][]ogmap; //for displaying inventory with map DO NOT TOUCH
private int[][]charMap;
private int[][]eneMap;

//next block: 1 = up, 2 = right, 3 = down, 4 = left, 0 = none (last element)
//private String enemyPath = "44144434414";
private String enemyPath = "4";


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
private boolean onResults = false;
private boolean opSelect = false;
private boolean directionSelect = false;
private boolean opRemove = false;

private int selectedX;
private int selectedY;

private int levelSelect = 0;

Screens screen = new Screens();

void setup() {
  //menu screen
  size(1000, 550);
  screen.menu();

  //////////////////SETUP LIVING OBJECTS//////////////////

  //Enemies(int hp, int spd, int atk, int hit, int[] position, String img)

  Enemies sluggy = new Enemies(10, 10, 0, 0, new int[]{2, 8}, 950, 250, "originium_slug.png");
  //sluggy.setDirection(Integer.parseInt(enemyPath.substring(0, 1)));

  //SETUP ENEMYLIST
  enemyList = new ArrayList<Enemies>();
  enemyList.add(sluggy);

  //TowerCharacters(int hp, int spd, int atk, int hit, String img, int blk, String type, int dp){
  TowerCharacters op0 = new TowerCharacters(50, 10, 5, 1, "ayer.png", 1, GROUND, 2);
  TowerCharacters op1 = new TowerCharacters(50, 10, 1, 1, "meterorite.png", 1, AERIAL, 2);
  TowerCharacters op2 = new TowerCharacters(50, 1, 1, 1, "purestream.png", 1, AERIAL, 2);
  TowerCharacters op3 = new TowerCharacters(50, 1, 1, 1, "kaltsit.png", 1, AERIAL, 2);
  TowerCharacters op4 = new TowerCharacters(50, 1, 1, 1, "mudrock.png", 1, GROUND, 2);
  TowerCharacters op5 = new TowerCharacters(50, 1, 1, 1, "mizuki.png", 1, GROUND, 2);

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
    display.displayEne();
    display.limits();
    charAction();
    eneMove();
  }
}

Maps level = new Maps();
Controls control = new Controls();

void mouseClicked() {
  //menu select
  if (onMenu) {
    if (mouseX >= 325 && mouseX <= 675 && mouseY >=175 && mouseY <= 225) {
      levelSelect = 1;
      level.lvlOne();

      //testing
      eneMap[1][3] = 0;
      enemyList.get(0).setLocation(new int[]{1, 3});


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
  } else if (onResults) {
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
    while (keyPressed == false || key == ENTER) {
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
      opRemove = false;
    } else {
      opRemove = false;
    }
  }
}


void charAction() {
  for (int i = 0; i < inventory.length; i++) { //array of enemies must start at index 1 if peek = 0 hp then remove
    if (inventory[i].getDeployed() && !directionSelect) {
      if (inventory[i].checkRange() != null) {
        inventory[i].setAttacking(true);
        if (inventory[i].getTicks()%inventory[i].getSpeed() == 0) {
          if (inventory[i].checkRange().getHealth() > 0) {
            inventory[i].toAttack(inventory[i].checkRange());
            if (inventory[i].checkRange().getHealth() <= 0) {
              inventory[i].setAttacking(false);
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

void eneMove() {
  for (int i = 0; i < enemyList.size(); i++) {
    for (int j = 0; j < enemyPath.length(); j++) {
      if (steps == SQUARE_SIZE) {
        
        eneMap[enemyList.get(0).getYCoord()/(int)SQUARE_SIZE][enemyList.get(0).getXCoord()/(int)SQUARE_SIZE] = 0;
        steps = 0;
      }
      enemyList.get(0).setDirection(Integer.parseInt(enemyPath.substring(i, i + 1)));
      if (timer% 1 == 0) {
        enemyList.get(0).move();
        steps++;
      }
    }
  }
}
