import java.util.*;

float SQUARE_SIZE;

private int[][]map;
private int[][]ogmap;

//private int[][] 

private TowerCharacters[]inventory;

static final int WALL = -1;
static final int AERIAL = -2;
static final int GROUND = -3;

private boolean onMenu = true;
private boolean onMap = false;

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
  //public TowerCharacters(int hp, int spd, int atk, int hit, String img, int blk, String type){
  TowerCharacters op0 = new TowerCharacters(50, 0, 1, 1, "ayer.png", 1, "AERIAL");
  TowerCharacters op1 = new TowerCharacters(50, 0, 1, 1, "ayer.png", 1, "AERIAL");
  
  inventory = new TowerCharacters[6];
  inventory[0] = op1;
  inventory[1] = op0;
  inventory[2] = op0;
  inventory[3] = op0;
  inventory[4] = op0;
  inventory[5] = op0;
  
 
}

void draw(){
  if (levelSelect == 1){
    lvlOne();
    gameMap(ogmap);
    inventory();
  }
  if (levelSelect == 2){
    //lvlTwo();
    gameMap(ogmap);
  }
  if (levelSelect == 3){
    //lvlThree();
    gameMap(ogmap);
  }
}

void mouseClicked(){
//menu select
  if (onMenu){
    if (mouseX >= 325 && mouseX <= 675 && mouseY >=175 && mouseY <= 225){
      levelSelect = 1;
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
      onMenu = true;
      onMap = true;
    }
  }
  
  if(onMap){
    if(mouseX <= 950 && mouseY <= 550){
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
      
    }
    
  }
//grid select (no character)
//keypressed
//if numerical # select character from inventory & place ->
//directional keys

//grid select (character)
//if CHARBLK then remove?: set char hp = 0

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

void inventory(){
  //display inventory
  for(int i = 0 ; i < 6 ; i++){
    if(!inventory[i].getDeployed()){
      PImage op0 = loadImage(inventory[i].getSprite());
      image(op0, SQUARE_SIZE*i,SQUARE_SIZE*3.5, 150, 150);
    }
  }
}
