public class Enemies extends LivingObjects {
  private int health;
  private int speed;
  private int attack;
  private int direction;
  private int range;
  private int[] location;
  private String sprite;
  private int xCoord;
  private int yCoord;
  private int ticks;
  private float sqSize;
  public Enemies() { //default
  }

  public Enemies(int hp, int spd, int atk, int hit, int[] position, int x, int y, String img) {
    health = hp;
    speed = spd;
    attack = atk;
    direction = 1;
    range = hit;
    location = position;
    xCoord = x;
    yCoord = y;
    sprite = img;
    ticks = 0;
  }

  ////////////////////////////////////////////
  public int getHealth() {
    return health;
  }

  public void setHealth(int newHealth) {
    health = newHealth;
  }
  
  //SPEED
  public int getSpeed(){
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


  ////////////////////////////METHODS////////////////
  public void toAttack(LivingObjects other) {
    other.setHealth(other.getHealth() - this.getAttack());
  }

  public void move() {
    if (this.getDirection() == 1) { //up
      this.setYCoord(this.getYCoord() - 1);
      if (yCoord/SQUARE_SIZE != location[1]) {
        int x = location[0];
        int y = location[1];
        eneMap[y][x] = map[y][x];
        setLocation(new int[]{location[0], location[1] - 1});
      }
    } else if (this.getDirection() == 2) { //right
      this.setXCoord(this.getXCoord() + 1);
      if (xCoord/SQUARE_SIZE < eneMap[0].length && xCoord/SQUARE_SIZE != location[0]) {
        int x = location[0];
        int y = location[1];
        eneMap[y][x] = map[y][x];
        setLocation(new int[]{location[0] + 1, location[1]});
      }
    } else if (this.getDirection() == 3) { //down
      this.setYCoord(this.getYCoord() + 1);
      if (yCoord/SQUARE_SIZE < eneMap.length && yCoord/SQUARE_SIZE != location[1]) {
        int x = location[0];
        int y = location[1];
        eneMap[y][x] = map[y][x];
        setLocation(new int[]{location[0], location[1] + 1});
      }
    } else if (this.getDirection() == 4) { //left
      this.setXCoord(this.getXCoord() - 1);
      if (xCoord/SQUARE_SIZE > 0 && xCoord/SQUARE_SIZE != location[0]) {
        println("cord/ss is " + (xCoord/SQUARE_SIZE));
        int x = location[0];
        int y = location[1];
        println("x is " + x);
        println("y is " + y);
        println("blep " + eneMap[y][x]);
        println("boop " + map[y][x]);
        eneMap[y][x] = map[y][x];
        setLocation(new int[]{location[0] - 1, location[1]});
        
      }
    }
  }

  public int checkRange() { //returns index of first index in queue
    if (this.getRange() == 1) {
      rangeOne();
    }
    if (this.getRange() == 2) {
      rangeTwo();
    }
    return 0;
  }

  void rangeOne() {
  }

  void rangeTwo() {
  }
}
