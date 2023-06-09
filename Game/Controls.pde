public class Controls {
  public Controls() {
  }

  //mouseclicked methods
  void menuSelect() {
    if (mouseX >= 325 && mouseX <= 675 && mouseY >=175 && mouseY <= 225) {
      levelSelect = 1;
      level.lvlOne();
      onMenu = false;
      onMap = true;
    }
    if (mouseX >= 325 && mouseX <= 675 && mouseY >=250 && mouseY <= 300) {
      levelSelect = 2;
      level.lvlTwo();
      onMenu = false;
      onMap = true;
    }
    if (mouseX >= 325 && mouseX <= 675 && mouseY >=325 && mouseY <= 375) {
      levelSelect = 3;
      level.lvlTwo();
      onMenu = false;
      onMap = true;
    }
  }

  void mapclicks() {
    if (mouseX <= 950 && mouseY <= 550 - SQUARE_SIZE && !(directionSelect)) {
      int row = 0;
      int column = 0;
      int w = mouseX;
      int h = mouseY;
      while (w > SQUARE_SIZE) {
        w -= SQUARE_SIZE;
        column++;
      }
      while (h > SQUARE_SIZE) {
        h -= SQUARE_SIZE;
        row++;
      }
      selectedX = column;
      selectedY = row;
      if (map[row][column] == AERIAL || map[row][column] == GROUND) {

        if (!(charMap[row][column] > -1)) {
          opSelect = true;
        } else {
          opRemove = true;
        }
      } else {
        opSelect = false;
      }
    }
    if (mouseX >= 960 && mouseX <= width && mouseY >= 0 && mouseY <= 40){
      pause = !pause;
    }
    
  }

  //keypressed methods

  void selectDirection() {
    int index = charMap[selectedY][selectedX];
    while (keyPressed == false) {
    }
    String inputs = "wasd";
    boolean equal = false;
    for (int i = 0; i < inputs.length(); i++) {
      if (key == inputs.charAt(i)) {
        equal = true;
      }
    }
    
    //add a check direction method
    int current = inventory[index].getDirection();
    
    
    if (equal && checkDirection(inventory[index])) {
      if (key == 'w') {
        inventory[index].setDirection(T);
      }
      if (key == 'd') {
        inventory[index].setDirection(R);
      }
      if (key == 's') {
        inventory[index].setDirection(D);
      }
      if (key == 'a') {
        inventory[index].setDirection(L);
      }
      println("direction is " + inventory[index].getDirection());
      directionSelect = false;
    }
  }

  void operatorSelect() {
    while (keyPressed == false || key == ENTER) {
    }
    String inputs = "123456";
    boolean equal = false;
    for (int i = 0; i < inputs.length(); i++) {
      if (key == inputs.charAt(i)) {
        equal = true;
      }
    }
    if (equal) {
      String keey = "" + key;
      int index = Integer.parseInt(keey) - 1;
      while (!inventory[index].getDeployed() && inventory[index].getType() == map[selectedY][selectedX] && ((cost - inventory[index].getDp()) >= 0) && unitLimit > 0 && coolDowns[index] == 0) {
        cost -= inventory[index].getDp();
        charMap[selectedY][selectedX] = index;
        inventory[index].setLocation(new int[]{selectedX, selectedY});
        unitLimit--;
        inventory[index].setDeployed(true);
        directionSelect = true;
        opSelect = false;
      }
    }
  }

  boolean checkDirection(TowerCharacters other){
    return true;
  }
  
  void operatorRemove() {
    while (keyPressed == false) {
    }
    if (key == ENTER && charMap[selectedY][selectedX] > -1) {
      int index = charMap[selectedY][selectedX];
      charMap[selectedY][selectedX] = map[selectedY][selectedX];
      inventory[index].setDeployed(false);
      
      while(inventory[index].blocked.size() != 0){
        inventory[index].blocked.peek().setMS(inventory[index].blocked.peek().getSpeed());
        inventory[index].blocked.remove();
      }
      
      coolDowns[index] = 60;
      
      
      unitLimit++;
      println("removed character");
      opRemove = false;
    } else {
      opRemove = false;
    }
  }
}
