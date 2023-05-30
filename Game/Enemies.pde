public class Enemies extends LivingObjects{
  private int health;
  private int speed;
  private int attack;
  private int direction;
  private int range;
  private int[] location;
  private String sprite;
  
  public Enemies(){ //default
    
  }
  
  public Enemies(int hp, int spd, int atk, int hit, int[] position, String img){
    health = hp;
    speed = spd;
    attack = atk;
    direction = 1;
    range = hit;
    location = position;
    sprite = img;
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
  
  ////////////////////////////////////////////
  public void toAttack(LivingObjects other){
    other.setHealth(other.getHealth() - this.getAttack());
  }
  
      public int checkRange(){ //returns first value of blocked
    if(this.getRange() == 1){
      rangeOne();
    }
    if(this.getRange() == 2){
      rangeTwo();
    }
    return 0;
  }
  
  void rangeOne(){
    
  }
  
  void rangeTwo(){
 
  }
  
  

}
