public abstract class LivingObjects{
  private int health;
  private int ticks;
  private int attack;
  private int direction;
  private int[] range;
  
  public abstract void toAttack(LivingObjects other);
  
  public abstract void leftRange();
  public abstract void rightRange();
  public abstract void topRange();
  public abstract void bottomRange();
  
  
  
  
}
