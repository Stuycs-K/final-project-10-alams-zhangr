public class Display {
  public Display() {};

  void gameMap(int[][]grid) { //pass ogmap
    SQUARE_SIZE = width/map[0].length;
    strokeWeight(1);
    stroke(255, 255, 255);
    float l = 0;
    float k = 0;

    float selectl = 0;
    float selectk = 0;

    for (int i = 0; i < grid.length || ( l < 950 && k < 600 ); i++) {
      k = 0;
      for (int j = 0; j < grid[i].length; j++) {
        if ((opSelect || opRemove) && i == selectedY && j == selectedX) {
          selectl = l;
          selectk = k;
        }

        if (grid[i][j] == WALL) {
          fill(color(51));
        } else if (grid[i][j] == GROUND) {
          fill(color(0, 0, 255));
        } else if (grid[i][j] == AERIAL) {
          fill(color(255, 0, 0));
        } else { //INVENTORY
          fill(color(0, 150, 150));
        }
        rect(k, l, SQUARE_SIZE, SQUARE_SIZE);
        k += SQUARE_SIZE;
      }
      l += SQUARE_SIZE;
    }
    if (opSelect) {
      strokeWeight(10);
      stroke(color(0, 255, 0));
      rect(selectk, selectl, SQUARE_SIZE, SQUARE_SIZE);
      //text display
      textSize(25);
      fill(color(0, 255, 0));
      text("Press #1-6 to select an operator.", 0, SQUARE_SIZE*map.length);
      strokeWeight(1);
      stroke(255, 255, 255);
      
    }
    if(opRemove){
      strokeWeight(10);
      stroke(color(0, 255, 0));
      rect(selectk, selectl, SQUARE_SIZE, SQUARE_SIZE);
      //text display
      textSize(25);
      fill(color(0, 255, 0));
      text("press enter to confirm removal of operator", 0, SQUARE_SIZE*map.length);
      strokeWeight(1);
      stroke(255, 255, 255);
    }
    if(directionSelect){
      textSize(25);
      fill(color(0, 255, 0));
      text("Press wasd to select operator's direction.", 0, SQUARE_SIZE*map.length);
      strokeWeight(1);
      stroke(255, 255, 255);
    }
  }

  void displayChar() {
    for (int i = 0; i < charMap.length; i++) {
      for (int j = 0; j < charMap[i].length; j++) {
        if (charMap[i][j] >= 0) {
          PImage op0 = loadImage(inventory[charMap[i][j]].getSprite());
          image(op0, SQUARE_SIZE*j - 30, SQUARE_SIZE*i - 70, 175, 175);
        }
        if (eneMap[i][j] >= 0) {
          PImage op0 = loadImage(enemyList.get(eneMap[i][j]).getSprite());
          image(op0, SQUARE_SIZE*j, SQUARE_SIZE*i + 30, 120, 120); //testing
        }
      }
    }
  }

  void inventory() {
    //display inventory
    for (int i = 0; i < 6; i++) {
      if (!inventory[i].getDeployed()) {
        PImage op0 = loadImage(inventory[i].getSprite());
        if (cost < inventory[i].getDp() || unitLimit == 0) {
          tint(150, 150, 150);
        }
        if (opSelect) {
          int type = map[selectedY][selectedX];
          if (inventory[i].getType() != type) {
            tint(255, 0, 0);
          }
        }
        image(op0, SQUARE_SIZE*i, SQUARE_SIZE*3.5, 150, 150);
        noTint();
      }
    }
  }

  void limits() {
    //display cost
    if (timer%20 == 0) {
      cost++;
    }
    fill(color(255, 255, 255));
    rect((map[0].length - 2)*SQUARE_SIZE, (map.length)*SQUARE_SIZE, SQUARE_SIZE*2, SQUARE_SIZE);
    textSize(30);
    fill(color(0, 0, 0));
    text("Cost: " + cost, (map[0].length - 2)*SQUARE_SIZE + 20, map.length*SQUARE_SIZE + 30);
    text("Unit Limit: " + unitLimit, (map[0].length - 2)*SQUARE_SIZE + 20, map.length*SQUARE_SIZE + 90);
     
    fill(color(255, 255, 255));
    rect(map[0].length*SQUARE_SIZE/2, 10, 10, 10);
    textSize(20);
    fill(0);
    text("Life Points: " + lp, map[0].length*SQUARE_SIZE/2, 10);
    
  }
}
