public class TowerCharacters extends LivingObjects {
  private int maxHealth;
  private int health;
  private int speed;
  private int attack;
  private int direction;
  private int range;
  private int[] location;
  private String sprite;
  public int ticks = 0;
  private int block;
  public Queue<Enemies> blocked;
  private boolean deployed;
  private boolean attacking;
  private int type;
  private int dp;
  //public int defense;

  public TowerCharacters() { //default
  }

  public TowerCharacters(int hp, int spd, int atk, int hit, String img, int blk, int optype, int deploymentCost) {
    maxHealth = hp;
    health = hp;
    speed = spd;
    attack = atk;
    direction = 1;
    range = hit;
    location = new int[]{0, 0};
    sprite = img;
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

  public String getSprite() {
    return sprite;
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
  
  public Queue<Enemies> getBlocked(){
    return blocked;
  }

  public boolean getDeployed() {
    return deployed;
  }

  public void setDeployed(boolean deploy) {
    deployed = deploy;
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

  ///////////////////////////////METHODS/////////////////////////////////////////
  public void toAttack(LivingObjects other) {
    other.setHealth(other.getHealth() - this.getAttack());
  }

  public LivingObjects checkRange() { //returns first value of blocked
    if (eneMap[location[1]][location[0]] > -1) {
      if (!blocked.contains(enemyList.get(eneMap[location[1]][location[0]]))) {
        blocked.add(enemyList.get(eneMap[location[1]][location[0]]));
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
          if (!blocked.contains(enemyList.get(eneMap[y - 1][x]))) {
            blocked.add(enemyList.get(eneMap[y - 1][x]));
          }
        }
      }
    }
    if (this.getDirection() == R) {
      if (x + 1 < eneMap[0].length) {
        if (eneMap[y][x+1] > -1) {
          if (!blocked.contains(enemyList.get(eneMap[y][x + 1]))) {
            blocked.add(enemyList.get(eneMap[y][ x + 1]));
          }
        }
      }
    }
    if (this.getDirection() == D) {
      if (y + 1 < eneMap.length) {
        if (eneMap[y +1][x] > -1) {
          if (!blocked.contains(enemyList.get(eneMap[y + 1][x]))) {
            blocked.add(enemyList.get(eneMap[y + 1][x]));
          }
        }
      }
    }
    if (this.getDirection() == L) {
      if (x - 1 > 0) {
        if (eneMap[y][x - 1] > -1) {
          if (!blocked.contains(enemyList.get(eneMap[y][x - 1]))) {
            blocked.add(enemyList.get(eneMap[y][ x - 1]));
          }
        }
      }
    }
  }
  
  void rangeTwo(){
  }

  void rangeSix() {
    int[][]six = new int[2][6];
    int x = this.getLocation()[0];
    int y = this.getLocation()[1];
  }
}
