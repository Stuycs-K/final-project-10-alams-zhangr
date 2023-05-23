private int[][]map;

static final int WALL = -1;
static final int AERIAL = -2;
static final int GROUND = -3;

//inventory 
//arraylist <towercharacters> (display)
//int[] inventory 



void setup(){
  //menu screen *raymond*
  //size(950, 550);
  //background(0);
  //rect(width/2 - 55,height/2 , 100, 100);
  
  //testing purpose
  size(950, 550);
  
  
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

void draw(){
  
}

//MAP1 for placement purposes 
map = new int[4][9];
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

int[][] originalmap = new int[map.length][map[0].length]; //for display purposes



void gamemap(int[][]map){
  stroke(255,255,255);
    int l = 0;
    int k = 0;
    for(int i = 0; i < map.length || ( l < 985 && k < 535 )  ; i++){
      k = 0;
      for(int j = 0 ; j < map[i].length ; j++){
        if(map[i][j] == WALL){
          fill(color(51));
        } else if(map[i][j] == GROUND {
          fill(color(0));
        }
        else{
          fill(color(
        }
        rect(k,l, SQUARE_SIZE, SQUARE_SIZE);
        k += SQUARE_SIZE;
      }
      l += SQUARE_SIZE;
    }
}
