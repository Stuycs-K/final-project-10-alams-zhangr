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
  }

  void lvlTwo() {
    //MAP1 for placement purposes
    cost = 10;
    unitLimit = 3;

    lp = 1;
    totalenemies = 1;
    enemiesleft = 1;
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
      
   enemyList = new ArrayList<Enemies>();
        totalenemies = 2;
    enemiesleft = 2;
    //SET UP ENEMIES & MOVEMENT IN MAPS
  //public Enemies(int hp, int spd, int atk, int hit, String[] img, int[] framenums, int moveSpeed, int x, int y, int[] spawn, int DIRECTION, String EP, int TD) {
    sluggy = new Enemies(500, 1, 1, 0, boop.slug, new int[]{0, 5, 9}, 1, 950, 250, new int[]{2, 8}, Integer.parseInt(enemyPath.substring(0, 1)), enemyPath, 0);
    //sluggy2 = new Enemies(500, 1, 0, 0, boop.slug, 1, 950, 250, new int[]{2, 8}, Integer.parseInt(enemyPath.substring(0, 1)), enemyPath, 200);

    //SETUP ENEMYLIST


    //THIS TOO
    enemyList.add(sluggy);

    //enemyList.add(sluggy2);
  }
}
