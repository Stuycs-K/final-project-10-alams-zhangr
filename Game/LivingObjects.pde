public abstract class LivingObjects{
  private int health;
  private int speed;
  private int attack;
  private int direction;
  private int range;
  private int[] location;
  
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
  
  ////////////////////////////////////////////////////
  public abstract void toAttack(LivingObjects other);
  
  //public abstract void leftRange(int[][] map, location);
  //public abstract void rightRange(int[][] map, location);
  //public abstract void topRange(int[][] map, location);
  //public abstract void bottomRange(int[][] map, location);

}
