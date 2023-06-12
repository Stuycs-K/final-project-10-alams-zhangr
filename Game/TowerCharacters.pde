public class TowerCharacters extends LivingObjects {
  private int maxHealth;
  private int health;
  private int speed;
  private int attack;
  int direction;
  public int range;
  public int[] location;
  private String[] sprite;
  public int[] framing;
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

    if (frames.length == 1) {
      if (frame + 1 == frames[0]) {
        frame = 1;
      }
      frame++;
    }
    if (frames.length == 3) {
      if (!attacking && (frame >= frames[1])) {
        frame = frames[0];
      } else if (frames.length == 3 && attacking && (frame < frames[1] || frame >= frames[2] )) {
        frame = frames[1];
      } else {
        frame++;
      }
    }

    if (frames.length == 4) { //new int[]{5, 11, 18,25}

      //1-5 = is
      //6-11 = i
      //12-18 = ie
      //19-25 = a
      if (!attacking && frame > 11 ) {
        frame = 1;
      } else if (!attacking && frame > frames[3]) {
        frame = 6;
      }
      if (!attacking && frame > frames[3]) {
        frame = 6;
      } else if (attacking && frame > frames[3]) {
        frame = 18;
      } else {
        frame++;
      }
    }

    if (frames.length == 5) {
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

  public void checkRange() {
    for (int j = 0; j < enemiesleft; j++) {
      Enemies invader = enemyList.get(j);
      if (invader.getLocation()[1] == location[1] && invader.getLocation()[0] == location[0] ) {
        if (!blocked.contains(invader) && invader.getHealth() > 0) {
          blocked.add(invader);
        }
        invader.setMS(0);
      }
    }
    if (range >=1 && range < 5) {
      rangeStraight(1);
    }

    if (range >=2 && range < 5) {
      rangeStraight(2);
    }
  }

  public void rangeStraight(int num) {
    int x = this.getLocation()[0];
    int y = this.getLocation()[1];

    for (int i = 0; i < enemiesleft; i++) {
      Enemies invader = enemyList.get(i);
      int enex = invader.getLocation()[0];
      int eney = invader.getLocation()[1];


      if (direction == T) {
        if (y - num > 0) {
          if (eney == y - num && enex == x) {
            if (!blocked.contains(invader) && invader.getHealth() > 0) {
              blocked.add(invader);
            }
          }
        }
      } else if (direction == R) {
        if (x + num < map[0].length) {
          if (eney == y && enex == x + num) {
            if (!blocked.contains(invader) && invader.getHealth() > 0) {
              blocked.add(invader);
            }
          }
        }
      } else if (direction == D) {
        if (y + num < map.length) {
          if (eney == y + num && enex == x) {
            if (!blocked.contains(invader) && invader.getHealth() > 0) {
              blocked.add(invader);
            }
          }
        }
      } else if (direction == L) {
        if (x - num > 0) {
          if (eney == y && enex == x - num) {
            if (!blocked.contains(invader) && invader.getHealth() > 0) {
              blocked.add(invader);
            }
          }
        }
      }
    }
  }
}
