public abstract class LivingObjects{
  private int health;
  private int ticks;
  private int attack;
  private int direction;
  private int range;
  private int[] location;
  
  public abstract void toAttack(LivingObjects other);
  
  public abstract void leftRange(int[][] map, location);
  public abstract void rightRange(int[][] map, location);
  public abstract void topRange(int[][] map, location);
  public abstract void bottomRange(int[][] map, location);

}
