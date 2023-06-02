public abstract class LivingObjects {

  //HEALTH
  
  public abstract int getMaxHP();
  
  public abstract int getHealth();

  public abstract void setHealth(int newHealth);

  //ATTACK
  public abstract int getAttack();

  public abstract void setAttack(int newAttack);

  //DIRECTION
  public abstract int getDirection();

  public abstract void setDirection(int newDirection);

  ////RANGE
  public abstract int getRange();

  //LOCATION
  public abstract int[] getLocation();

  public abstract void setLocation(int[] newLocation);


  ////////////////METHODS////////////////////////////////////
  public abstract void toAttack(LivingObjects other);


}
