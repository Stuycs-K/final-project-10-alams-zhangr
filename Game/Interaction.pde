public class Interaction {
  public Interaction() {
  };

  void charAction() {
    if (!pause) {
      for (int i = 0; i < inventory.length; i++) {
        TowerCharacters op = inventory[i];
        if (op.getDeployed() && !directionSelect) {
          if (op.getHealth() > 0) {

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
<<<<<<< HEAD
          else {
            println(op.getLocation()[0] + " " + op.getLocation()[1]);
            op.setDeployed(false);
            op.setAttacking(false);
            op.setLocation(null);
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
        } else if (e.get(i).enemyPath.length() == 0) {
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
<<<<<<< HEAD
      //if (enemyPath.length() == 0) {
      //  println("length 0");
      //  enemiesleft--;
      //  lp--;
      //}

=======
      if (enemyPath.length() == 0) {
        enemiesleft--;
        lp--;
      }
      
>>>>>>> newBlock
      for (int row = 0; row < eneMap.length; row++) {
        for (int col = 0; col < eneMap[0].length; col++) {
          if (eneMap[row][col] >= 0 && charMap[row][col] >= 0 && !directionSelect) {
            int atkingEnemy = eneMap[row][col];
            int atkingChar = charMap[row][col];
            if (inventory[atkingChar].getBlocked().size() < inventory[atkingChar].getBlock()) {

              if (enemyList.get(atkingEnemy).getHealth() > 0 && inventory[atkingChar].getHealth() > 0) {

                enemyList.get(atkingEnemy).toAttack(inventory[atkingChar]);
              } else if (inventory[atkingChar].getHealth() <= 0) {
                enemyList.get(atkingEnemy).setAttacking(false);
                charMap[row][col] = map[row][col];
                enemyList.get(atkingEnemy).setMS(enemyList.get(atkingEnemy).speed);

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
