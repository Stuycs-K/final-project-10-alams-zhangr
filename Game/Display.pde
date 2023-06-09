public class Display {
  public Display() {
  };

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
    if (opRemove) {
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
    if (directionSelect) {
      textSize(25);
      fill(color(0, 255, 0));
      text("Press wasd to select operator's direction.", 0, SQUARE_SIZE*map.length);
      strokeWeight(1);
      stroke(255, 255, 255);
    }

    fill(#7D7D7D);
    rect(960, 0, 40, 40);
    fill(0);
    rect(968, 10, 8, 20);
    rect(984, 10, 8, 20);
  }

  void displayChar() {
    for (int i = 0; i < charMap.length; i++) {
      for (int j = 0; j < charMap[i].length; j++) {
        if (charMap[i][j] >= 0) {
          int frame = inventory[charMap[i][j]].getFrame();
          PImage op0 = loadImage(inventory[charMap[i][j]].getSprite()[frame]);
          image(op0, SQUARE_SIZE*j - SQUARE_SIZE/6, SQUARE_SIZE*i - (SQUARE_SIZE/3), SQUARE_SIZE*5/4,SQUARE_SIZE*5/4);
          healthBarsT(inventory[charMap[i][j]]);
        }
      }
    }
  }

  void displayEne() {
    for (int i = 0; i < eneMap.length; i++) {
      for (int j = 0; j < eneMap[i].length; j++) {
        if (eneMap[i][j] >= 0 && enemyList.size() != 0) {
          PImage op0 = loadImage(enemyList.get(eneMap[i][j]).getSprite());
          image(op0, enemyList.get(eneMap[i][j]).getXCoord(), enemyList.get(eneMap[i][j]).getYCoord(), 111, 111);
          healthBarsE(enemyList.get(eneMap[i][j]));
        }
      }
    }
  }

  void inventory() {
    //display inventory
    for (int i = 0; i < inventory.length; i++) {
      if (!inventory[i].getDeployed()) {
        PImage op0 = loadImage(inventory[i].getSprite()[0]);
        if (cost < inventory[i].getDp() || unitLimit == 0) {
          tint(150, 150, 150);
        }
        if (opSelect) {
          int type = map[selectedY][selectedX];
          if (inventory[i].getType() != type) {
            tint(255, 0, 0);
          }
        }
        if (coolDowns[i] > 0) {
          tint(150, 150, 150);
          fill(255);
          textSize(30);
          image(op0, SQUARE_SIZE*i - 10, SQUARE_SIZE*3.5, SQUARE_SIZE, SQUARE_SIZE);
          text(coolDowns[i], SQUARE_SIZE*i+(SQUARE_SIZE/2), SQUARE_SIZE*4.5);
        } else {
          image(op0, SQUARE_SIZE*i, SQUARE_SIZE*(map.length), SQUARE_SIZE, SQUARE_SIZE);
        }
        noTint();
      }
    }
  }
  
    
  void animate(){
    for(int i = 0 ; i < inventory.length ; i++){
      if(inventory[i].getDeployed()){
        if(timer%3== 0){
          inventory[i].increaseFrame();
        }
      }
    }
  }

  void limits() {
    //display cost
    if (timer%20 == 0) {
      if (cost < 99 && !onResults) {
        cost++;
      }
    }
    fill(color(255, 255, 255));
    rect((map[0].length - 2)*SQUARE_SIZE - 30, (map.length)*SQUARE_SIZE, SQUARE_SIZE*2 + 30, SQUARE_SIZE);
    textSize(25);
    fill(color(0, 0, 0));
    text("Cost: " + cost, (map[0].length - 2)*SQUARE_SIZE - 20, map.length*SQUARE_SIZE + 30);
    text("Unit Limit: " + unitLimit, (map[0].length - 2)*SQUARE_SIZE + 90, map.length*SQUARE_SIZE + 30);
    text("Life Points: " + lp, (map[0].length - 2)*SQUARE_SIZE - 20, map.length*SQUARE_SIZE + 60);
    text("Enemies Left: " + enemiesleft + "/" + totalenemies, (map[0].length - 2)*SQUARE_SIZE - 20, map.length*SQUARE_SIZE + 90);
  }

  void healthBarsT(LivingObjects other) {
    fill(color(0, 255, 0));
    text(other.getHealth() + "/" + other.getMaxHP(), other.getLocation()[0]*SQUARE_SIZE, other.getLocation()[1]*SQUARE_SIZE);
  }

  void healthBarsE(Enemies other) {
    fill(color(0, 255, 0));
    text(other.getHealth() + "/" + other.getMaxHP(), other.getXCoord(), other.getYCoord());
  }
}
