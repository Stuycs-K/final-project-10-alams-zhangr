public class TowerCharacters extends LivingObjects {
  private int maxHealth;
  private int health;
  private int speed;
  private int attack;
  private int direction;
  private int range;
  private int[] location;
  private String[] sprite;
  private int[] framing;
  private int frame;
  public int ticks = 0;
  private int block;
  public Queue<Enemies> blocked;
  private boolean deployed;
  private boolean attacking;
  private int type;
  private int dp;
  private int cd;

  public TowerCharacters() {
  }

  public TowerCharacters(int hp, int spd, int atk, int hit, String[] img, int[] framenums, int blk, int optype, int deploymentCost) {
    maxHealth = hp;
    health = hp;
    speed = spd;
    attack = atk;
    direction = 1;
    range = hit;
    location = new int[]{0, 0};
    sprite = img;
    framing = framenums;
    frame = 1;
    block = blk;
    blocked = new LinkedList<Enemies>();
    deployed = false;
    attacking = false;
    type = optype;
    dp = deploymentCost;
  }

  //////////////////////////////////////////
  public int getMaxHP() {
    return maxHealth;
  }
  public int getHealth() {
    return health;
  }

  public void setHealth(int newHealth) {
    health = newHealth;
  }

  public int getSpeed() {
    return speed;
  }

  //ATTACK
  public int getAttack() {
    return attack;
  }

  public void setAttack(int newAttack) {
    attack = newAttack;
  }

  //DIRECTION
  public int getDirection() {
    return direction;
  }

  public void setDirection(int newDirection) {
    direction = newDirection;
  }

  ////RANGE
  public int getRange() {
    return range;
  }

  //LOCATION
  public int[] getLocation() {
    return location;
  }

  public void setLocation(int[] newLocation) {
    location = newLocation;
  }

  public String[] getSprite() {
    return sprite;
  }

  public int getFrame() {
    return frame;
  }

  //takes in an int[]
  public void increaseFrame(int[] frames) {
    if (!attacking && (frame >= frames[0])) {
      frame = frames[0];
    } else if (frames.length == 3 && attacking && (frame < frames[1] || frame >= frames[2] )) {
      frame = frame[1];
    //}
    //else if (attacking && (frame < 7)) {
      
    } else {
      frame++;
    }
  }

  public void setFrame(int newFrame) {
    frame = newFrame;
  }

  public void increaseTicks() {
    ticks++;
  }

  public void restartTicks() {
    ticks = 0;
  }

  public int getTicks() {
    return ticks;
  }

  public int getBlock() {
    return block;
  }

  public Queue<Enemies> getBlocked() {
    return blocked;
  }

  public boolean getDeployed() {
    return deployed;
  }

  public void setDeployed(boolean deploy) {
    deployed = deploy;
    if (deploy) {
      health = maxHealth;
    }
  }

  public boolean getAttacking() {
    return attacking;
  }

  public void setAttacking(boolean attacks) {
    attacking = attacks;
    if (attacks) increaseTicks();
    else restartTicks();
  }

  public int getType() {
    return type;
  }

  public int getDp() {
    return dp;
  }

  //METHODS
  public void toAttack(LivingObjects other) {
    other.setHealth(other.getHealth() - this.getAttack());
  }

  public LivingObjects checkRange() { //returns first value of blocked
    if (eneMap[location[1]][location[0]] > -1) {
      if (enemyList.size() != 0 && !blocked.contains(enemyList.get(eneMap[location[1]][location[0]])) && !(blocked.size() > block)) {
        blocked.add(enemyList.get(eneMap[location[1]][location[0]]));
      } else if (blocked.contains(enemyList.get(eneMap[location[1]][location[0]]))) {
        if (deployed && !directionSelect && enemyList.get(eneMap[location[1]][location[0]]).getMS() != 0) {
          enemyList.get(eneMap[location[1]][location[0]]).setMS(0);
        }
      }

      while ( blocked.size() != 0 && !(blocked.peek().getLocation()[1] == location[1]) && !(blocked.peek().getLocation()[0] == location[0])) {
        blocked.remove();
        if (blocked.size() == 0) {
          attacking = false;
        }
      }
    }

    if (this.getRange() == 1) {
      rangeOne();
    }
    if (this.getRange() == 2) {
      rangeTwo();
    }

    return blocked.peek();
  }

  void rangeOne() {
    int x = this.getLocation()[0];
    int y = this.getLocation()[1];
    if (this.getDirection() == T) {
      if (y - 1 > 0) {
        if (eneMap[y - 1][x] > -1) {
          if (enemyList.size() != 0 &&!blocked.contains(enemyList.get(eneMap[y - 1][x])) && !(blocked.size() > block)) {
            blocked.add(enemyList.get(eneMap[y - 1][x]));
          }
          while ( blocked.size() != 0 && !(blocked.peek().getLocation()[1] == y-1) && !(blocked.peek().getLocation()[0] == x)) {
            blocked.remove();
            if (blocked.size() == 0) {
              attacking = false;
            }
          }
        }
      }
    }
    if (this.getDirection() == R) {
      if (x + 1 < eneMap[0].length) {
        if (eneMap[y][x+1] > -1) {
          if (enemyList.size() != 0 &&!blocked.contains(enemyList.get(eneMap[y][x + 1])) && !(blocked.size() > block)) {
            blocked.add(enemyList.get(eneMap[y][ x + 1]));
          }
          while ( blocked.size() != 0 && !(blocked.peek().getLocation()[1] == y) && !(blocked.peek().getLocation()[0] == x + 1)) {
            blocked.remove();
            if (blocked.size() == 0) {
              attacking = false;
            }
          }
        }
      }
    }
    if (this.getDirection() == D) {
      if (y + 1 < eneMap.length) {
        if (eneMap[y +1][x] > -1) {
          if (enemyList.size() != 0 &&!blocked.contains(enemyList.get(eneMap[y + 1][x])) && !(blocked.size() > block)) {
            blocked.add(enemyList.get(eneMap[y + 1][x]));
          }
          while ( blocked.size() != 0 && !(blocked.peek().getLocation()[1] == y+1) && !(blocked.peek().getLocation()[0] == x)) {
            blocked.remove();
            if (blocked.size() == 0) {
              attacking = false;
            }
          }
        }
      }
    }
    if (this.getDirection() == L) {
      if (x - 1 > 0) {
        if (eneMap[y][x - 1] > -1) {
          if (enemyList.size() != 0 &&!blocked.contains(enemyList.get(eneMap[y][x - 1])) && !(blocked.size() > block)) {
            blocked.add(enemyList.get(eneMap[y][ x - 1]));
          }
          while ( blocked.size() != 0 && !(blocked.peek().getLocation()[1] == y) && !(blocked.peek().getLocation()[0] == x - 1)) {
            blocked.remove();
            if (blocked.size() == 0) {
              attacking = false;
            }
          }
        }
      }
    }
  }

  void rangeTwo() {
  }

  void rangeSix() {
    int[][]six = new int[2][6];
    int x = this.getLocation()[0];
    int y = this.getLocation()[1];
  }
}
