public class Interaction {
  public Interaction() {
  };

  void charAction() {
    if (enemyList.size() != 0) {
      for (int i = 0; i < inventory.length; i++) {
        if (inventory[i].getDeployed() && !directionSelect) {
          if (inventory[i].checkRange() != null) {
            inventory[i].setAttacking(true);
            if (inventory[i].getTicks()%inventory[i].getSpeed() == 0) {
              if (inventory[i].checkRange().getHealth() > 0) {
                inventory[i].toAttack(inventory[i].checkRange());
                if (inventory[i].checkRange() != null) {
                  if (inventory[i].checkRange().getHealth() <= 0) {
                    inventory[i].setAttacking(false);
                    int[] position = inventory[i].checkRange().getLocation();
                    eneMap[position[1]][position[0]] = map[position[1]][position[0]];
                    enemyList.remove(0);
                    enemiesleft--;
                    inventory[i].blocked.remove();
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  void enemyMove(Enemies e) {
    if (enemyPath.length() > 0) {

      if (stepsPerSquare != 0) {
        //image(i, e.getXCoord() - (int)SQUARE_SIZE/2, e.getYCoord() - (int)SQUARE_SIZE/2, SQUARE_SIZE, SQUARE_SIZE);
        if (!dead) {
          display.displayEne();
        }
        if (!pause){
          e.move(e.getMS());
          stepsPerSquare--;
        }

        e.setLocation(new int[]{e.getXCoord()/ (int)SQUARE_SIZE, e.getYCoord()/ (int)SQUARE_SIZE});
      } else {
        enemyPath = enemyPath.substring(1);
        if (enemyPath.length() > 0) {
          e.setDirection(Integer.parseInt(enemyPath.substring(0, 1)));
        }
        stepsPerSquare = (int)SQUARE_SIZE / e.getMS();
        //image(i, e.getXCoord() - (int)SQUARE_SIZE/2, e.getYCoord() - (int)SQUARE_SIZE/2, SQUARE_SIZE, SQUARE_SIZE);
        if (!dead && !pause) {
          display.displayEne();
        }
      }
      eneMap[e.getYCoord() / (int)SQUARE_SIZE][e.getXCoord()/ (int)SQUARE_SIZE] = enemyList.indexOf(sluggy);
    }
  }

  void enemyAction() {
    if (!dead && !pause) {
      attacks.enemyMove(enemyList.get(0));
    }
    if (enemyPath.length() == 0) {
      enemiesleft--;
      lp--;
    }
    for (int row = 0; row < eneMap.length; row++) {
      for (int col = 0; col < eneMap[0].length; col++) {
        if (eneMap[row][col] >= 0 && charMap[row][col] >= 0) {
          int atkingEnemy = eneMap[row][col];
          int atkingChar = charMap[row][col];
          if (inventory[atkingChar].getBlocked().size() < inventory[atkingChar].getBlock()) {
            inventory[atkingChar].checkRange();
            if (enemyList.get(atkingEnemy).getHealth() > 0 && inventory[atkingChar].getHealth() > 0) {
              enemyList.get(atkingEnemy).toAttack(inventory[atkingChar]);
            } else if (inventory[atkingChar].getHealth() <= 0) {
              charMap[row][col] = map[row][col];
              inventory[atkingChar].setDeployed(false);
              inventory[atkingChar].setAttacking(false);
              unitLimit++;
            }
          }
        }
      }
    }
  }
}
