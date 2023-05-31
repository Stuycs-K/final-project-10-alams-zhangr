public class Maps {
  public Maps() {
  };

  void lvlOne() {
    //MAP1 for placement purposes
    cost = 5;
    unitLimit = 3;
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

  //void lvlOneEnemyPath() {
  //  enemyPath = new ArrayList<int[]>();
  //  enemyPath.add(new int[]{1, 0});
  //  enemyPath.add(new int[]{1, 1});
  //  enemyPath.add(new int[]{2, 1});
  //  enemyPath.add(new int[]{2, 2});
  //  enemyPath.add(new int[]{2, 3});
  //  enemyPath.add(new int[]{1, 3});
  //  enemyPath.add(new int[]{1, 4});
  //  enemyPath.add(new int[]{1, 5});
  //  enemyPath.add(new int[]{1, 6});
  //  enemyPath.add(new int[]{2, 6});
  //  enemyPath.add(new int[]{2, 7});
  //  enemyPath.add(new int[]{2, 8});
  //}
}
