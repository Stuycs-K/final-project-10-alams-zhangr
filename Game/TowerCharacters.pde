public class TowerCharacters extends LivingObjects{
  private int health;
  private int speed;
  private int attack;
  private int direction;
  private int range;
  private int[] location;  
  //public int defense;
  
  //INSTANTIATE
  public TowerCharacters(){ //default
  }
  
  public TowerCharacters(int hp, int spd, int atk, int range){
    health = hp;
    speed = spd;
    attack = atk;
    direction = 1;
    range = hit;
    location = new int[]{0, 0};
  }
  
  //HEALTH
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
  
  //public int getDefense(){
  //  return defense;
  //}
  //public void setDefense(int newDefense){
  //  defense = newDefense;
  //}
  

  /////////////////////////////////////////////////////////////////////////////////////////
  public void toAttack(Enemies other){
    other.setHealth(other.getHealth() - this.getAttack());
  } 
}
