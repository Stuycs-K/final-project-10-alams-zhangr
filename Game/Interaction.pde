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
              if (inventory[i].checkRange().getHealth() <= 0) {
                inventory[i].setAttacking(false);
                int[] position = inventory[i].checkRange().getLocation();
                eneMap[position[0]][position[1]] = map[position[0]][position[1]];
                enemyList.remove(0);
                inventory[i].blocked.remove();
              }
            }
          }
        }
      }
    }
  }
}
