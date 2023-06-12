public class Maps {
  public Maps() {
  };

  void lvlOne() {
    //MAP1 for placement purposes
    enemylvlOne();
    instantiate = !instantiate;
    cost = 10;
    unitLimit = 3;
    lp = 1;


    reset();

    map = new int[4][9];
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 9; j++) {
        map[i][j] = GROUND;
      }
    }
    for (int i = 0; i < 9; i++) {
      if (i != 0 || i != 8) {
        map[0][i] = AERIAL;
        map[3][i] = AERIAL;
      } else {
        map[0][i] = WALL;
        map[3][i] = WALL;
      }
    }
    for (int i = 0; i < 4; i++) {
      map[i][0] = WALL;
      map[i][8] = WALL;
    }
    map[1][0] = GROUND;
    map[2][8] = GROUND;
    map[1][2] = AERIAL;
    map[2][4] = AERIAL;

    charMap = new int[4][9];
    eneMap = new int[4][9];

    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 9; j++) {
        charMap[i][j] = map[i][j];
        eneMap[i][j] = map[i][j];
      }
    }

    //maybe combine later***
    ogmap = new int[5][9]; //for display purposes INCLUDES INVENTORY
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 9; j++) {
        if (i != 4) {
          ogmap[i][j] = map[i][j];
        }
      }
    }

    map[2][8] = WALL;
    map[1][0] = WALL;
    stepsPerSquare = width / map[0].length;
  }

  void lvlTwo() {
    cost = 10;
    unitLimit = 3;
    
    enemylvlTwo();
    lp = 2;
    totalenemies = 4;
    enemiesleft = 4;
    reset();

    map = new int[4][9];
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 9; j++) {
        map[i][j] = GROUND;
      }
    }
    map[0][7] = WALL;
    map[0][8] = WALL;
    map[1][0] = WALL;
    map[1][1] = WALL;
    map[1][2] = WALL;
    map[1][3] = WALL;
    map[1][4] = AERIAL;
    map[1][6] = WALL;
    map[1][7] = WALL;
    map[1][8] = WALL;
    map[2][8] = WALL;
    map[3][0] = WALL;
    map[3][1] = WALL;
    map[3][2] = WALL;
    map[3][3] = WALL;
    map[3][4] = WALL;
    map[3][5] = AERIAL;
    map[3][6] = WALL;
    map[3][7] = WALL;
    map[3][8] = WALL;


    charMap = new int[4][9];
    eneMap = new int[4][9];

    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 9; j++) {
        charMap[i][j] = map[i][j];
        eneMap[i][j] = map[i][j];
      }
    }

    //maybe combine later***
    ogmap = new int[5][9]; //for display purposes INCLUDES INVENTORY
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 9; j++) {
        if (i != 4) {
          ogmap[i][j] = map[i][j];
        }
      }
    }
    
    map[1][0] = WALL;
    map[3][0] = WALL;
    map[3][8] = WALL;
  }
  
  void lvlThree(){
        //MAP1 for placement purposes
    cost = 10;
    unitLimit = 3;
    
    enemylvlThree();
    lp = 3;
    totalenemies = 5;
    enemiesleft = 5;
    reset();

    map = new int[4][9];
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 9; j++) {
        map[i][j] = GROUND;
      }
    }
    
    map[0][0] = WALL;
    map[0][1] = WALL;
    map[0][7] = AERIAL;
    map[0][8] = WALL;
    map[1][0] = WALL;
    map[1][4] = AERIAL;
    map[1][8] = WALL;
    map[2][3] = AERIAL;
    map[2][3] = AERIAL;
    map[2][4] = AERIAL;
    map[2][5] = AERIAL;
    map[3][0] = WALL;
    map[3][1] = WALL;
    map[3][2] = AERIAL;
    map[3][3] = AERIAL;
    map[3][4] = AERIAL;
    map[3][5] = AERIAL;
    map[3][6] = AERIAL;
    map[3][7] = AERIAL;
    map[3][8] = WALL;

    charMap = new int[4][9];
    eneMap = new int[4][9];

    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 9; j++) {
        charMap[i][j] = map[i][j];
        eneMap[i][j] = map[i][j];
      }
    }

    //maybe combine later***
    ogmap = new int[5][9]; //for display purposes INCLUDES INVENTORY
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 9; j++) {
        if (i != 4) {
          ogmap[i][j] = map[i][j];
        }
      }
    }
    
    map[2][0] = WALL;
    map[2][8] = WALL;
  }

  void reset() {
    for (int i = 0; i < inventory.length; i++) {
      if (inventory[i].getDeployed() || inventory[i].attacking) {
        inventory[i].setAttacking(false);
        inventory[i].setDeployed(false);
        while(inventory[i].blocked.size() > 0){
          inventory[i].blocked.remove();
        }
        inventory[i].setHealth(inventory[i].getMaxHP());
        inventory[i].setFrame(1);
      }
    }
  }
  
  

  void enemylvlOne() {
   //enemyPath = "444144434414";
   enemyList = new ArrayList<Enemies>();
        totalenemies = 2;
    enemiesleft = 2;
    //SET UP ENEMIES & MOVEMENT IN MAPS

  //public Enemies(int hp, int spd, int atk, int hit, String[] img, int[] framenums, int moveSpeed, int x, int y, int[] spawn, int DIRECTION, String EP, int TD, int SPSQ) {
    Enemies sluggy = new Enemies(500, 1, 1, 0, boop.slug, new int[]{0, 5, 9}, 1, 950, 250, new int[]{2, 8}, Integer.parseInt(enemyPath.substring(0, 1)), "444144434414", 0, stepsPerSquare);
    Enemies sluggy2 = new Enemies(500, 1, 1, 0, boop.slug, new int[]{0, 5, 9}, 1, 950, 250, new int[]{2, 8}, Integer.parseInt(enemyPath.substring(0, 1)), "444144434414", 10, stepsPerSquare);


    //SETUP ENEMYLIST


    //THIS TOO
    enemyList.add(sluggy);

    enemyList.add(sluggy2);
  }
  
  void enemylvlTwo(){
    enemyList = new ArrayList<Enemies>();
    totalenemies = 4;
    enemiesleft = 4;
    //SET UP ENEMIES & MOVEMENT IN MAPS
  //public Enemies(int hp, int spd, int atk, int hit, String[] img, int[] framenums, int moveSpeed, int x, int y, int[] spawn, int DIRECTION, String EP, int TD, int SPSQ) {
    Enemies sluggy = new Enemies(500, 1, 1, 0, boop.slug, new int[]{0, 5, 9}, 1, 50, 50, new int[]{1, 0}, Integer.parseInt(enemyPath.substring(0, 1)), "2222223322", 0, stepsPerSquare);
    Enemies sluggy2 = new Enemies(500, 1, 1, 0, boop.slug, new int[]{0, 5, 9}, 1, 50, 50, new int[]{1, 0}, Integer.parseInt(enemyPath.substring(0, 1)), "2222223322", 100, stepsPerSquare);
    Enemies sluggy3 = new Enemies(500, 1, 1, 0, boop.slug, new int[]{0, 5, 9}, 1, 50, 250, new int[]{3, 0}, Integer.parseInt(enemyPath.substring(0, 1)), "22222222", 0, stepsPerSquare);
    Enemies sluggy4 = new Enemies(500, 1, 1, 0, boop.slug, new int[]{0, 5, 9}, 1, 50, 250, new int[]{3, 0}, Integer.parseInt(enemyPath.substring(0, 1)), "22222222", 100, stepsPerSquare);


    //SETUP ENEMYLIST


    //THIS TOO
    enemyList.add(sluggy);

    enemyList.add(sluggy2);
    
    enemyList.add(sluggy3);
    enemyList.add(sluggy4);
  }
  
  void enemylvlThree(){
    enemyList = new ArrayList<Enemies>();
    totalenemies = 5;
    enemiesleft = 5;
    //SET UP ENEMIES & MOVEMENT IN MAPS
  //public Enemies(int hp, int spd, int atk, int hit, String[] img, int[] framenums, int moveSpeed, int x, int y, int[] spawn, int DIRECTION, String EP, int TD, int SPSQ) {
    Enemies sluggy = new Enemies(500, 1, 1, 0, boop.slug, new int[]{0, 5, 9}, 1, 50, 250, new int[]{2, 0}, Integer.parseInt(enemyPath.substring(0, 1)), "2221122221122", 0, stepsPerSquare);
    Enemies sluggy2 = new Enemies(500, 1, 1, 0, boop.slug, new int[]{0, 5, 9}, 1, 50, 250, new int[]{2, 0}, Integer.parseInt(enemyPath.substring(0, 1)), "2221122221122", 100, stepsPerSquare);
    Enemies sluggy3 = new Enemies(500, 1, 1, 0, boop.slug, new int[]{0, 5, 9}, 1, 50, 250, new int[]{2, 0}, Integer.parseInt(enemyPath.substring(0, 1)), "2221122221122", 200, stepsPerSquare);
    Enemies sluggy4 = new Enemies(500, 1, 1, 0, boop.slug, new int[]{0, 5, 9}, 1, 50, 250, new int[]{2, 0}, Integer.parseInt(enemyPath.substring(0, 1)), "2221122221122", 250, stepsPerSquare);
    Enemies sluggy5 = new Enemies(500, 1, 1, 0, boop.slug, new int[]{0, 5, 9}, 1, 50, 250, new int[]{2, 0}, Integer.parseInt(enemyPath.substring(0, 1)), "2221122221122", 300, stepsPerSquare);

    //SETUP ENEMYLIST


    //THIS TOO
    enemyList.add(sluggy);

    enemyList.add(sluggy2);
    
    enemyList.add(sluggy3);
    enemyList.add(sluggy4);
    enemyList.add(sluggy5);
  }
  
  
}
