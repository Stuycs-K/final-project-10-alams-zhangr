public class Interaction {
  public Interaction() {
  };

  //void charAction() {
  //  if (enemyList.size() != 0) {
  //    for (int i = 0; i < inventory.length; i++) {
  //      if (inventory[i].getDeployed() && !directionSelect) {
  //        if (inventory[i].checkRange() != null) {
  //          if (!pause) {
  //            if (inventory[i].getTicks()%(inventory[i].getSpeed()*3.3) == 0) {
  //              if (inventory[i].checkRange().getHealth() > 0) {
  //                inventory[i].setAttacking(true);
  //                inventory[i].toAttack(inventory[i].checkRange());
  //                if (inventory[i].checkRange() != null) {
  //                  if (inventory[i].checkRange().getHealth() <= 0) {
  //                    inventory[i].setAttacking(false);
  //                    int[] position = inventory[i].checkRange().getLocation();
  //                    eneMap[position[1]][position[0]] = map[position[1]][position[0]];
  //                    enemyList.remove(0);
  //                    enemiesleft--;
  //                    inventory[i].blocked.remove();
  //                  }
  //                }
  //              }
  //            }
  //          }
  //        }
  //      }
  //    }
  //  }
  //}

  void charAction() {
    if (!pause) {
      for (int i = 0; i < inventory.length; i++) {
        TowerCharacters op = inventory[i];
        if (op.getDeployed() && !directionSelect) {
          if (op.blocked.size() < op.block) {
            op.checkRange();
          }
          if (op.blocked.size() != 0) {
            op.setAttacking(true);
            if (op.getTicks()%(op.getSpeed()*3.3) == 0 && op.blocked.peek().getHealth() > 0) {
              op.toAttack(op.blocked.peek());
            }
            if (op.blocked.peek().getHealth() <= 0) {
              op.blocked.remove();
              enemiesleft--;
            }
          }
        }
      }
    }
  }

  void enemyMove(ArrayList<Enemies> e) {
    for (int i = 0; i < e.size(); i++) {
      if (e.get(i).getMS() != 0) {
        if (e.get(i).enemyPath.length() > 0) {
          if (stepsPerSquare != 0) {
            if (!pause) {
              e.get(i).move(e.get(i).getMS());
              stepsPerSquare--;
            }
            e.get(i).setLocation(new int[]{e.get(i).getXCoord()/ (int)SQUARE_SIZE, e.get(i).getYCoord()/ (int)SQUARE_SIZE});
          } else {
            e.get(i).setEnemyPath(e.get(i).getEnemyPath().substring(1));
            if (e.get(i).getEnemyPath().length() > 0) {
              e.get(i).setDirection(Integer.parseInt(e.get(i).getEnemyPath().substring(0, 1)));
            }
            stepsPerSquare = (int)SQUARE_SIZE / e.get(i).getMS();
          }
          eneMap[e.get(i).getYCoord() / (int)SQUARE_SIZE][e.get(i).getXCoord()/ (int)SQUARE_SIZE] = enemyList.indexOf(sluggy);
        }
        else if (e.get(i).enemyPath.length() == 0){
           enemiesleft--;
           lp--;
        }
      }
    }
    println(e.get(0).getEnemyPath());
  }

  void enemyAction() {
    if (enemyList.size() != 0) {
      if ( !dead && !pause) {
        attacks.enemyMove(enemyList);
      }
      //if (enemyPath.length() == 0) {
      //  println("length 0");
      //  enemiesleft--;
      //  lp--;
      //}
      for (int row = 0; row < eneMap.length; row++) {
        for (int col = 0; col < eneMap[0].length; col++) {
          if (eneMap[row][col] >= 0 && charMap[row][col] >= 0) {
            int atkingEnemy = eneMap[row][col];
            int atkingChar = charMap[row][col];
            if (inventory[atkingChar].getBlocked().size() < inventory[atkingChar].getBlock()) {

              if (enemyList.get(atkingEnemy).getHealth() > 0 && inventory[atkingChar].getHealth() > 0) {

                enemyList.get(atkingEnemy).toAttack(inventory[atkingChar]);
              } else if (inventory[atkingChar].getHealth() <= 0) {
                enemyList.get(atkingEnemy).setAttacking(false);
                //enemyList.get(atkingEnemy).setMS(enemyList.get(atkingEnemy).speed);

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

  void coolDown() {
    for (int i = 0; i < coolDowns.length; i++) {
      if (coolDowns[i] != 0) {
        coolDowns[i]--;
      }
    }
  }
}
