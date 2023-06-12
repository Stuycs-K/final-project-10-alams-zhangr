public class Medic extends TowerCharacters {
  public Queue<TowerCharacters> blocked;

  public Medic() {
    super();
  }

  public Medic(int hp, int spd, int atk, int hit, String[] img, int[]frami, int blk, int optype, int deploymentCost) {
    super(hp, spd, atk, hit, img, frami, blk, optype, deploymentCost);
    blocked = new LinkedList<TowerCharacters>();
  }

  public void toAttack(LivingObjects other) {
    if (other.getMaxHP() > other.getHealth()) {
      if (other.getHealth() + this.getAttack() > other.getMaxHP()) {
        other.setHealth(other.getMaxHP());
      } else {
        other.setHealth(other.getHealth() + this.getAttack());
      }
      println("healing" + other.getHealth());
    }
  }

  public void checkRange() {
    for (int i = 0; i < inventory.length; i ++) {
      TowerCharacters ally = inventory[i];
      if (ally.getLocation()[1] == location[1] && ally.getLocation()[0] == location[0] ) {
        if (!blocked.contains(ally) && ally.getHealth() < ally.maxHealth) {
          blocked.add(ally);
        }
      }
      if (range >=1 && range < 5) {
        rangeStraight(1);
      }

      if (range >=2 && range < 5) {
        rangeStraight(2);
      }
    }
  }

    public void rangeStraight(int num) {
      int x = this.getLocation()[0];
      int y = this.getLocation()[1];

      for (int i = 0; i < inventory.length; i++) {
        TowerCharacters ally  = inventory[i];
        int allyX = ally.getLocation()[0];
        int allyY = ally.getLocation()[1];


        if (direction == T) {
          if (y - num > 0) {
            if (allyY == y - num && allyX == x) {
              if (!blocked.contains(ally) && ally.getHealth() < ally.maxHealth) {
                blocked.add(ally);
              }
            }
          }
        } else if (direction == R) {
          if (x + num < map[0].length) {
            if (allyY == y && allyX == x + num) {
              if (!blocked.contains(ally) && ally.getHealth() < ally.maxHealth) {
                blocked.add(ally);
              }
            }
          }
        } else if (direction == D) {
          if (y + num < map.length) {
            if (allyY == y + num && allyX == x) {
              if (!blocked.contains(ally) && ally.getHealth() < ally.maxHealth) {
                blocked.add(ally);
              }
            }
          }
        } else if (direction == L) {
          if (x - num > 0) {
            if (allyY == y && allyX == x - num) {
              if (!blocked.contains(ally) && ally.getHealth() < ally.maxHealth) {
                blocked.add(ally);
              }
            }
          }
        }
      }
    }
  
}
