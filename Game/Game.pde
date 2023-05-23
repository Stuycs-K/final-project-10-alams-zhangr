import java.util.*;
static int[][]map;
private int[][] ogmap;

static final int WALL = -1;
static final int AERIAL = -2;
static final int GROUND = -3;


void setup(){
  //menu screen *ray*
  
  //testing purpose
  size(1000, 550);
  lvlOne();
  gameMap(ogmap);
  
  //DEBUG TOSTRING 
  //println(Arrays.toString(map)); not working for some reason
  //String arr = "{";
  //for(int i = 0 ; i < ogmap.length ; i ++){
  //  for(int j = 0 ; j < ogmap[i].length ; j++){
  //    if(j == 0){
  //      arr += "\n";
  //    }
  //    arr += ogmap[i][j] + ", ";
  //  }
  //}
  //arr += "}";
  //println(arr);
}

void draw(){
  
}

void mouseClicked(){
//menu select

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
  float SQUARE_SIZE = width/map[0].length;
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


//inventory 
//arraylist <towercharacters> (display)
//int[] inventory 
