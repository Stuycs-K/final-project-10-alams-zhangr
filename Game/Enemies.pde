public class Enemies extends LivingObjects{
  private int health;
  private int speed;
  private int attack;
  private int direction;
  private int range;
  private int[] location;
  
  public Enemies(){ //default
    
  }
  
  public Enemies(int hp, int spd, int atk, int hit, int[] position){
    health = hp;
    speed = spd;
    attack = atk;
    direction = 1;
    range = hit;
    location = position;
  }
  
  ////////////////////////////////////////////
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
  
  ////////////////////////////////////////////
  public void toAttack(LivingObjects other){
    other.setHealth(other.getHealth() - this.getAttack());
  }
  
  
}
