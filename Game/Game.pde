import java.util.*;
static int[][]map;
private int[][] ogmap;
private ArrayList<int[]> enemyPath;

static final int WALL = -1;
static final int AERIAL = -2;
static final int GROUND = -3;

private float SQUARE_SIZE;
private boolean onMenu = true;
private int levelSelect = 0;
private PImage slug;
int delay = 10;

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
  lvlOne();
  lvlOneEnemyPath();
  frameRate(5);
  //testing purpose
  //size(1000, 550);
  //lvlOne();
  //gameMap(ogmap);
  
  Enemies brr = new Enemies(1, 2, 3, 4, new int[]{5, 5});
  println(brr.getHealth());
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
  if (levelSelect == 1){
    //lvlOne();
    gameMap(ogmap);
  }
  if (levelSelect == 2){
    //lvlTwo();
    gameMap(ogmap);
  }
  if (levelSelect == 3){
    //lvlThree();
    gameMap(ogmap);
  }
  if (!onMenu){  
    slug = loadImage("originium_slug.png");
    if(enemyPath.size() > 1){
      int[] coords = enemyPath.remove(enemyPath.size() - 1);
      image(slug, coords[1] * SQUARE_SIZE, coords[0] * SQUARE_SIZE);
    }
  }
}

void mouseClicked(){
//menu select
  if (onMenu){
    if (mouseX >= 325 && mouseX <= 675 && mouseY >=175 && mouseY <= 225){
      levelSelect = 1;
      onMenu = false;
    }
    if (mouseX >= 325 && mouseX <= 675 && mouseY >=250 && mouseY <= 300){
      levelSelect = 2;
      onMenu = false;
    }
    if (mouseX >= 325 && mouseX <= 675 && mouseY >=325 && mouseY <= 375){
      levelSelect = 3;
      onMenu = false;
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

void lvlOneEnemyPath(){
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


//inventory 
//arraylist <towercharacters> (display)
//int[] inventory 
