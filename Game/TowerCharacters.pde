public class TowerCharacters extends LivingObjects{
  private int health;
  private int speed;
  private int attack;
  private int direction;
  private int range;
  private int[] location; 
  private String sprite;
  public int ticks = 0;
  private int block;
  public Queue<Integer> blocked;
  private boolean deployed;
  private boolean attacking;
  private int type;
  private int dp;
  //public int defense;
  
  public TowerCharacters(){ //default
  }
  
  public TowerCharacters(int hp, int spd, int atk, int hit, String img, int blk, int optype, int deploymentCost){
    health = hp;
    speed = spd;
    attack = atk;
    direction = 1;
    range = hit;
    location = new int[]{0, 0};
    sprite = img;
    block = blk;
    blocked = new LinkedList<Integer>();
    deployed = false;
    attacking = false;
    type = optype;
    dp = deploymentCost;
  }
  
  //////////////////////////////////////////
  public int getHealth(){
    return health;
  }
  
  public void setHealth(int newHealth){
    health = newHealth;
  }
  
  //ATTACK
  public int getAttack(){
    return attack;
  }
  
  public void setAttack(int newAttack){
    attack = newAttack;
  }
  
  //DIRECTION
  public int getDirection(){
    return direction;
  }
  
  public void setDirection(int newDirection){
    direction = newDirection;
  }
  
  ////RANGE
  public int getRange(){
    return range;
  }
  
  //LOCATION
  public int[] getLocation(){
    return location;
  }
  
  public void setLocation(int[] newLocation){
    location = newLocation;
  }
  
  public String getSprite(){
    return sprite;
  }
  
  public int getBlock(){
    return block;
  }
  
  public boolean getDeployed(){
    return deployed;
  }
  
  public void setDeployed(boolean deploy){
    deployed = deploy;
  }
  
  public int getType(){
    return type;
  }
  
  public int getDp(){
    return dp;
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////
  public void toAttack(LivingObjects other){
    other.setHealth(other.getHealth() - this.getAttack());
  } 
  
    public int checkRange(){ //returns first value of blocked
    if(eneMap[this.location[1]][this.location[0]] > -1){
      if(blocked.peek() != null && blocked.peek() != eneMap[location[1]][location[0]]){
      blocked.add(eneMap[location[1]][location[0]]);
      }
    }
    if(this.getRange() == 1){
      rangeOne();
    }
    if(this.getRange() == 2){
      rangeTwo();
    }
    
    if(blocked.peek() == null){
      return -10;
    }
    return blocked.peek();
  }
  
  void rangeOne(){
    int x = this.getLocation()[1];
    int y = this.getLocation()[0];
    if(this.getDirection() == TOP){
      if(y - 1 > 0){
        if(eneMap[y - 1][x] > -1){
          blocked.add(eneMap[y-1][x]);
        }
      }
    }
    if(this.getDirection() == RIGHT){
      if(x + 1 < eneMap[0].length){
        if(eneMap[y][x+1] > -1){
          blocked.add(eneMap[y][x+1]);
        }
      }
    }
    if(this.getDirection() == DOWN){
      if(y + 1 < eneMap.length){
        if(eneMap[y +1][x] > -1){
          blocked.add(eneMap[y + 1][x]);
        }
      }
    }
    if(this.getDirection() == LEFT){
      if(x - 1 > 0){
        if(eneMap[y][x - 1] > -1){
          blocked.add(eneMap[y][x - 1]);
        }
      }
    }
  }
  
  void rangeTwo(){
 
  }
}
