public class Interaction {
  public Interaction() {
  };

  void charAction() {
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
                  eneMap[position[0]][position[1]] = map[position[0]][position[1]];
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

  void enemyMove(Enemies e, PImage i){
    if (enemyPath.length() > 1) {
      if (stepsPerSquare != 0) {
        e.move(e.getMS());
        image(i, e.getXCoord() - (int)SQUARE_SIZE/2, e.getYCoord() - (int)SQUARE_SIZE/2, SQUARE_SIZE, SQUARE_SIZE);
        stepsPerSquare--;
        e.setLocation(new int[]{e.getXCoord()/ (int)SQUARE_SIZE/2, e.getYCoord()/ (int)SQUARE_SIZE/2);
      } else {
        enemyPath = enemyPath.substring(1);
        e.setDirection(Integer.parseInt(enemyPath.substring(0, 1)));
        stepsPerSquare = (int)SQUARE_SIZE / e.getMS();
        image(i, e.getXCoord() - (int)SQUARE_SIZE/2, e.getYCoord() - (int)SQUARE_SIZE/2, SQUARE_SIZE, SQUARE_SIZE);
      }
      eneMap[e.getYCoord() / (int)SQUARE_SIZE][e.getXCoord()/ (int)SQUARE_SIZE] = enemyList.indexOf(sluggy);
    }
  }
}
