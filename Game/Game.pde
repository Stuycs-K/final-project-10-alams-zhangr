import java.util.*;

private float SQUARE_SIZE;
private int cost;
private int timer;

private int[][]map;
private int[][]ogmap; //for displaying inventory with map DO NOT TOUCH

private int[][]charMap;
private int[][]eneMap;


private TowerCharacters[]inventory;

static final int WALL = -1;
static final int AERIAL = -2;
static final int GROUND = -3;

private boolean onMenu = true;
private boolean onMap = false;
private boolean opSelect = false;
private boolean directionSelect = false;

private int selectedX;
private int selectedY;

private int levelSelect = 0;

void setup(){
  //menu screen *ray*
  size(1000, 550);
  rect(325, 175, 350, 50);
  rect(325, 250, 350, 50);
  rect(325, 325, 350, 50);
  textSize(20);
  fill(0);
  text("Level One", 450, 210);
  text("Level Two", 450, 285);
  text("Level Three", 450, 360);
  
  //Enemies(int hp, int spd, int atk, int hit, int[] position, String img)
  Enemies brr = new Enemies(1, 2, 3, 4, new int[]{5, 5}, "hi");
  println(brr.getHealth());
  
  //OPS
  //public TowerCharacters(int hp, int spd, int atk, int hit, String img, int blk, String type, int dp){
  TowerCharacters op0 = new TowerCharacters(50, 0, 1, 1, "ayer.png", 1, "GROUND", 2);
  TowerCharacters op1 = new TowerCharacters(50, 0, 1, 1, "meterorite.png", 1, "AERIAL", 2);
  TowerCharacters op2 = new TowerCharacters(50, 0, 1, 1, "purestream.png", 1, "AERIAL", 2);

  
  inventory = new TowerCharacters[6];
  inventory[0] = op0;
  inventory[1] = op1;
  inventory[2] = op2;
  inventory[3] = op0;
  inventory[4] = op0;
  inventory[5] = op0;
 
}

void draw(){
  if(levelSelect > 0){
    gameMap(ogmap);
    inventory();
    displayChar();
  }
}

void mouseClicked(){
//menu select
  if (onMenu){
    if (mouseX >= 325 && mouseX <= 675 && mouseY >=175 && mouseY <= 225){
      levelSelect = 1;
      lvlOne();
      onMenu = false;
      onMap = true;
    }
    if (mouseX >= 325 && mouseX <= 675 && mouseY >=250 && mouseY <= 300){
      levelSelect = 2;
      onMenu = false;
      onMap = true;
    }
    if (mouseX >= 325 && mouseX <= 675 && mouseY >=325 && mouseY <= 375){
      levelSelect = 3;
      onMenu = false;
      onMap = true;
    }
  }
  
  else if(onMap){
    if(mouseX <= 950 && mouseY <= 550 - SQUARE_SIZE){
      int row = 0;
      int column = 0;
      int w = mouseX;
      int h = mouseY;
      while(w > SQUARE_SIZE){
        w -= SQUARE_SIZE;
        column++;
      }
      while(h > SQUARE_SIZE){
        h -= SQUARE_SIZE;
        row++;
      }
      println(row + " " + column);
      if(map[row][column] == AERIAL && !(charMap[row][column] > -1)){
        opSelect = true;
        selectedX = column;
        selectedY = row;
        println("Press #1-6 to select an operator");
        //text display
        textSize(50);
        fill(color(255, 0, 0));
        text("Press #1-6 to select an operator", SQUARE_SIZE*map.length, width/2);
      }
      else{
        opSelect = false;
      }
    }
  }
}
 
void keyPressed(){
    if(opSelect){
      while(keyPressed == false){
        //text display
        textSize(15);
        fill(color(255, 0, 0));
        text("Press #1-6 to select an operator", 10, SQUARE_SIZE*map.length);
      }
      println(key);
      String inputs = "123456";
      boolean equal = false;
      for(int i = 0; i < inputs.length() ; i++){
        if(key == inputs.charAt(i)){
          equal = true;
        }
      }
      if(equal){
        String keey = "" + key;
        int index = Integer.parseInt(keey) - 1;
        inventory[index].setDeployed(true);
        charMap[selectedY][selectedX] = index;
        println(index);
        opSelect = false;
        directionSelect = true;
      }
      
    
    //if(directionSelect){
    //  if(key ==CODED){
    //    if(keyCode == UP){
    //    }
    //    if(keyCode == RIGHT){
    //    }
    //    if(keyCode == DOWN){
    //    }
    //    if(keyCode == LEFT){
    //    }
    //    directionSelect = false;
    //  }
    }
}

void lvlOne(){
  //MAP1 for placement purposes 
  map = new int[4][9];
  for(int i = 0 ; i < 4 ; i++){
    for(int j = 0 ; j < 9 ; j++){
      map[i][j] = GROUND;
    }
  }
  for(int i = 0 ; i < 9 ; i++){
    if(i != 0 || i != 8){  
      map[0][i] = AERIAL;
      map[3][i] = AERIAL;
    }
    else{
      map[0][i] = WALL;
      map[3][i] = WALL;
    }
  }
  for(int i = 0; i < 4 ; i++){
    map[i][0] = WALL;
    map[i][8] = WALL;
  }
  map[1][0] = GROUND;
  map[2][8] = GROUND;
  map[1][2] = AERIAL;
  map[2][4] = AERIAL;
   
  charMap = new int[4][9];
  eneMap = new int[4][9];
  
  for(int i = 0 ; i < 4 ; i++){
    for(int j = 0 ; j < 9 ; j++){
      charMap[i][j] = map[i][j];
      eneMap[i][j] = map[i][j];
    }
  }
  //maybe combine later***
  ogmap = new int[5][9]; //for display purposes INCLUDES INVENTORY
  for(int i = 0 ; i < 5 ; i++){
    for(int j = 0 ; j < 9 ; j++){
      if(i != 4){
        ogmap[i][j] = map[i][j];
      }
    }
  }
}

void gameMap(int[][]grid){ //pass ogmap
  SQUARE_SIZE = width/map[0].length;
  stroke(255,255,255);
    float l = 0;
    float k = 0;
    for(int i = 0; i < grid.length || ( l < 950 && k < 600 )  ; i++){
      k = 0;
      for(int j = 0 ; j < grid[i].length ; j++){
        if(grid[i][j] == WALL){
          fill(color(51));
        } else if(grid[i][j] == GROUND) {
          fill(color(0, 0, 255));
        }
        else if(grid[i][j] == AERIAL){
          fill(color(255, 0 , 0));
        }
        else{ //INVENTORY
          fill(color(0,150,150));
        }
        rect(k,l, SQUARE_SIZE, SQUARE_SIZE);
        k += SQUARE_SIZE;
      }
      l += SQUARE_SIZE;
    }
}

void displayChar(){
  for(int i = 0 ; i < charMap.length ; i++){
    for(int j = 0 ; j < charMap[i].length ; j++){
        if(charMap[i][j] > 0){
          PImage op0 = loadImage(inventory[charMap[i][j]].getSprite());
          image(op0, SQUARE_SIZE*j,SQUARE_SIZE*i, 150, 150);
        }
    }
  }
}

void inventory(){
  //display inventory
  for(int i = 0 ; i < 6 ; i++){
    if(!inventory[i].getDeployed()){
      PImage op0 = loadImage(inventory[i].getSprite());
      image(op0, SQUARE_SIZE*i,SQUARE_SIZE*3.5, 150, 150);
    }
  }
}
