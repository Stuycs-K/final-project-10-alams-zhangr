import java.util.*;
private float SQUARE_SIZE;

private int cost;
private int timer;
private int unitLimit;
private int lp;
private int totalenemies;
private int enemiesleft = 0;

private int steps;

private int[][]map;
private int[][]ogmap; //DO NOT TOUCH
private int[][]charMap;
private int[][]eneMap;

//next block: 1 = up, 2 = right, 3 = down, 4 = left, 0 = none (last element)

private String enemyPath = "444144434414";
private int stepsPerSquare = (int)SQUARE_SIZE;

private TowerCharacters[]inventory;
private int[]coolDowns;
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

private boolean pause = false;
private boolean dead = false;

//private Enemies sluggy;
//private Enemies sluggy2;
private boolean lostLP = false;

Animate boop = new Animate();

private boolean instantiate = true;


PImage lvlone;

void setup() {
  size(1000, 550);
  screen.menu();

  //SETUP LIVING OBJECTS


  //SETUP OPERATORS

//  public TowerCharacters(int hp, int spd, int atk, int hit, String[] img, int[] framenums, int blk, int optype, int deploymentCost) {
  TowerCharacters op0 = new TowerCharacters(742, 1, 1, 1, boop.frostl, new int[]{1, 6, 15}, 2, GROUND, 9);
 

  TowerCharacters op1 = new TowerCharacters(742, 10, 2, 2, boop.rosmontis, new int[]{1, 13, 27}, 2, AERIAL, 9);
  TowerCharacters op2 = new TowerCharacters(100, 10, 2, 1, boop.meteorite, new int[]{1, 8, 16 }, 2, AERIAL, 9);
  Medic op3 = new Medic(742, 1, 700, 2, boop.purestream, new int[]{1, 9, 18}, 2, AERIAL, 9);
  TowerCharacters op4 = new TowerCharacters(742, 1, 1, 1, boop.mizuki, new int[]{1, 18,25}, 2, GROUND, 9);
  Medic op5 = new Medic(742, 1, 1, 1, boop.skadi, new int[]{47}, 2, AERIAL, 9);

  

  

  //SETUP INVENTORY
  inventory = new TowerCharacters[6];
  inventory[0] = op0;
  inventory[1] = op1;
  inventory[2] = op2;
  inventory[3] = op3;
  inventory[4] = op4;
  inventory[5] = op5;

  coolDowns = new int[]{0, 0, 0, 0, 0, 0};

  //lvlone = loadImage("map.png");
}

Display display = new Display();
Interaction attacks = new Interaction();

//PImage op0 = loadImage(inventory[charMap[i][j]].getSprite());
//image(op0, SQUARE_SIZE*j - 30, SQUARE_SIZE*i - 70, 175, 175);

//image(lvlone, 1000, 550 - SQUARE_SIZE);

void draw() {

  if (levelSelect > 0 ) {
    timer++;
    display.gameMap(ogmap);
    //image(lvlone, 0, 0, 1000, 550 - SQUARE_SIZE);
    display.inventory();
    attacks.coolDown();
    display.displayChar();
    display.displayEne();
    display.limits();
    screen.results();  //has charaction & eneaction
  } else if (!onMenu) {
    screen.menu();
    onMenu = true;
  }
}

Maps level = new Maps();
Controls control = new Controls();

void mouseClicked() {
  if (onMenu) {
    control.menuSelect();
  } else if (onMap && !onResults) {
    control.mapclicks();
  } else if (onResults) {
    onResults = false;
    levelSelect = 0;
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
