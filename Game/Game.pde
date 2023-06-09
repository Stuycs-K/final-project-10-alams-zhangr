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

private Enemies sluggy;
private boolean lostLP = false;

PImage lvlone;

void setup() {
  size(1000, 550);
  screen.menu();

  //SETUP LIVING OBJECTS

  //SET UP ENEMIES & MOVEMENT IN MAPS

  sluggy = new Enemies(500, 4, 1, 0, "originium_slug.png", 4, 950, 250, new int[]{2, 8}, Integer.parseInt(enemyPath.substring(0, 1)));

  //SETUP ENEMYLIST
  enemyList = new ArrayList<Enemies>();

  //THIS TOO
  enemyList.add(sluggy);

  //SETUP OPERATORS
  
  String[] frostl = new String[]{"frostl-0.png", "frostlI-1.png","frostlI-2.png", "frostlI-3.png", "frostlI-4.png",
  "frostlI-5.png", "frostlI-6.png", "frostlI-5.png", "frostlI-4.png", "frostlI-3.png", "frostlI-2.png", 
  "frostlA-1.png", "frostlA-2.png", "frostlA-3.png", "frostlA-4.png", "frostlA-5.png", 
"frostlA-6.png", "frostlA-7.png", "frostlA-8.png", "frostlA-9.png", "frostlA-10.png"};
  TowerCharacters op0 = new TowerCharacters(742, 30, 157, 1, frostl, 2, GROUND, 9);
  //TowerCharacters op1 = new TowerCharacters(250, 10, 180, 1, "meterorite.png", 0, AERIAL, 8);
  //TowerCharacters op2 = new Medic(500, 30, 100, 1, "purestream.png", 0, AERIAL, 10);
  //TowerCharacters op3 = new Medic(500, 30, 100, 1, "kaltsit.png", 0, AERIAL, 8);
  //TowerCharacters op4 = new TowerCharacters(530, 30, 200, 1, "mudrock.png", 1, GROUND, 7);
  //TowerCharacters op5 = new TowerCharacters(850, 10, 80, 1, "mizuki.png", 1, GROUND, 10);


  //SETUP INVENTORY
  inventory = new TowerCharacters[1];
  inventory[0] = op0;
  //inventory[1] = op1;
  //inventory[2] = op2;
  //inventory[3] = op3;
  //inventory[4] = op4;
  //inventory[5] = op5;
  
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
    display.animate();
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
