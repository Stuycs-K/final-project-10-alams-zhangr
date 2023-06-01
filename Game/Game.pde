import java.util.*;
private float SQUARE_SIZE;

private int cost;
private int timer;
private int unitLimit;
private int lp;
private int totalenemies;
private int enemiesleft;

private int steps;

private int[][]map; //CHECK LVL SETUP OPTIMIZE LATER
private int[][]ogmap; //for displaying inventory with map DO NOT TOUCH
private int[][]charMap;
private int[][]eneMap;

//next block: 1 = up, 2 = right, 3 = down, 4 = left, 0 = none (last element)

private String enemyPath = "444144434414";
private int stepsPerSquare = (int)SQUARE_SIZE;

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

private PImage slug;
int delay = 10;
private Enemies sluggy;

void setup() {
  //menu screen
  size(1000, 550);
  screen.menu();

  //////////////////SETUP LIVING OBJECTS//////////////////

  sluggy = new Enemies(10, 10, 0, 0, "originium_slug.png", 10);
  slug = loadImage(sluggy.getSprite());
  sluggy.setXCoord(950);
  sluggy.setYCoord(250);
  sluggy.setDirection(Integer.parseInt(enemyPath.substring(0, 1)));
  stepsPerSquare = stepsPerSquare/2;

  //SETUP ENEMYLIST
  enemyList = new ArrayList<Enemies>();
  enemyList.add(sluggy);

//SETUP OPERATORS
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
Interaction attacks = new Interaction();

void draw() {
  if (levelSelect > 0) {
    display.gameMap(ogmap);
    timer++;
    display.inventory();
    display.displayChar();
    display.displayEne();
    display.limits();
    attacks.charAction();

    if (enemyPath.length() > 1) {
      if (stepsPerSquare != 0) {
        sluggy.move(sluggy.getMS());
        image(slug, sluggy.getXCoord() - (int)SQUARE_SIZE/2, sluggy.getYCoord() - (int)SQUARE_SIZE/2, SQUARE_SIZE, SQUARE_SIZE);
        stepsPerSquare--;
      } else {
        enemyPath = enemyPath.substring(1);
        sluggy.setDirection(Integer.parseInt(enemyPath.substring(0, 1)));
        stepsPerSquare = (int)SQUARE_SIZE / sluggy.getMS();
        image(slug, sluggy.getXCoord() - (int)SQUARE_SIZE/2, sluggy.getYCoord() - (int)SQUARE_SIZE/2, SQUARE_SIZE, SQUARE_SIZE);
      }
      eneMap[sluggy.getYCoord() / (int)SQUARE_SIZE][sluggy.getXCoord()/ (int)SQUARE_SIZE] = enemyList.indexOf(sluggy);
      println(stepsPerSquare);
      println(sluggy.getXCoord());
      println(sluggy.getYCoord());
      println(enemyPath);
      println(SQUARE_SIZE);
    }
  }

}

Maps level = new Maps();
Controls control = new Controls();

void mouseClicked() {
  if (onMenu) {
    control.menuSelect();
  } else if (onMap) {
    control.mapclicks();
  } else if (onResults) {
  }
}

void keyPressed() {
  if (directionSelect) {
    control.selectDirection();
  }
  if (opSelect) {
    control.operatorSelect();
  }
  if (opRemove) {
    control.operatorRemove();
  }
}
