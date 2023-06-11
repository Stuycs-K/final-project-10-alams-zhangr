public class TowerCharacters extends LivingObjects {
  private int maxHealth;
  private int health;
  private int speed;
  private int attack;
  private int direction;
  private int range;
  private int[] location;
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
    if (!attacking && (frame >= frames[1])) {
      frame = frames[0];
    } else if (frames.length == 3 && attacking && (frame < frames[1] || frame >= frames[2] )) {
      frame = frames[1];
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

  public void checkRange() {
    //for(int i = 0 ; i < blocked.size() ; i++){
    //  if(blocked.peek().getHealth() <=0){
    //    blocked.remove();
    //  }
    //}
    for (int j = 0; j < enemyList.size(); j++) {
      Enemies invader = enemyList.get(j);
      
        if (invader.getLocation()[1] == location[1] && invader.getLocation()[0] == location[0] ) {
          if (!blocked.contains(invader)) {
            blocked.add(invader);
          
          invader.setMS(0);
        } else if (range == 1) {
        } else if (range == 2) {
        }
      }
    }
  }
}
