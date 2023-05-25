public class TowerCharacters extends LivingObjects{
  private int health;
  private int speed;
  private int attack;
  private int direction;
  private int range;
  private int[] location; 
  private String sprite;
  private int block;
  private boolean deployed;
  //public int defense;
  
  public TowerCharacters(){ //default
  }
  
  public TowerCharacters(int hp, int spd, int atk, int hit, String img, int blk){
    health = hp;
    speed = spd;
    attack = atk;
    direction = 1;
    range = hit;
    location = new int[]{0, 0};
    sprite = img;
    block = blk;
    deployed = false;
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
  //public int[] getRange(){
  //  return range;
  //}
  
  //public void setRange(int[] newRange){
  //  range = newRange;
  //}
  
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
  
  public void setDeployed(){
    deployed = !deployed;
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////
  public void toAttack(LivingObjects other){
    other.setHealth(other.getHealth() - this.getAttack());
  } 
}
