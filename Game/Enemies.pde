public class Enemies extends LivingObjects {
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
  private boolean attacking;
  private int xCoord;
  private int yCoord;
  private int ticks = 0;
  private float sqSize;
  private int ms;
  private String enemyPath;
  public int timeDeploy;

  public Enemies() { //default
  }

  public Enemies(int hp, int spd, int atk, int hit, String[] img, int[] framenums, int moveSpeed, int x, int y, int[] spawn, int DIRECTION, String EP, int TD) {
    maxHealth = hp;
    health = hp;
    speed = spd;
    attack = atk;
    direction = 1;
    range = hit;
    sprite = img;
    frame = 0;
    framing = framenums;
    attacking = false;
    ticks = 0;
    ms = moveSpeed;
    xCoord = x;
    yCoord = y;
    location = spawn;
    direction = DIRECTION;
    enemyPath = EP;
    timeDeploy = TD;
  }

  ////////////////////////////////////////////
  public int getMaxHP() {
    return maxHealth;
  }

  public int getHealth() {
    return health;
  }

  public void setHealth(int newHealth) {
    health = newHealth;
  }

  //SPEED
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

  public boolean getAttacking() {
    return attacking;
  }

  public void setAttacking(boolean attacks) {
    attacking = attacks;
  }

  public void setMS(int move) {
    ms = move;
  }

  public int getMS() {
    return ms;
  }

  public int getXCoord() {
    return xCoord;
  }

  public void setXCoord(int newX) {
    xCoord = newX;
  }

  public int getYCoord() {
    return yCoord;
  }

  public void setYCoord(int newY) {
    yCoord = newY;
  }

  public String getEnemyPath() {
    return enemyPath;
  }



  //METHODS
  public void toAttack(LivingObjects other) {
    other.setHealth(other.getHealth() - this.getAttack());
  }

  public void move(int step) {
    if (this.getDirection() == 1) { //up
      this.setYCoord(this.getYCoord() - step);
    } else if (this.getDirection() == 2) { //right
      this.setXCoord(this.getXCoord() + step);
    } else if (this.getDirection() == 3) { //down
      this.setYCoord(this.getYCoord() + step);
    } else if (this.getDirection() == 4) { //left
      this.setXCoord(this.getXCoord() - step);
    }
  }

  public int checkRange() { //returns first value of blocked
    return 0;
  }
}
