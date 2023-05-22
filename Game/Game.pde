private int[][]map;
static final int SQUARE_SIZE = 100;
static final int WALL = -1;
static final int AERIAL = -2;
static final int GROUND = -3;

void setup(){
  size(900, 600);
  gamemap();
}

void draw(){
  
}

void gamemap(){
  stroke(255,255,255);
  fill(0,0,0);
  for(int i = 0 ; i < 800 ; i+=SQUARE_SIZE){
    for(int j = 0; j < 500 ; j+=SQUARE_SIZE){
      rect(i, j, SQUARE_SIZE, SQUARE_SIZE);
    }
  }
}
