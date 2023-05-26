public abstract class LivingObjects{

  //HEALTH
  public abstract int getHealth();
  
  public abstract void setHealth(int newHealth);
  
  //ATTACK
  public abstract int getAttack();
  
  public abstract void setAttack(int newAttack);
  
  //DIRECTION
  public abstract int getDirection();
  
  public abstract void setDirection(int newDirection);
  
  ////RANGE
  //public int[] getRange(){
  //  return range;
  //}
  
  //public void setRange(int[] newRange){
  //  range = newRange;
  //}
  
  //LOCATION
  public abstract int[] getLocation();
  
  public abstract void setLocation(int[] newLocation);
  
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
