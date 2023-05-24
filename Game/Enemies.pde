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
  
  public void toAttack(LivingObjects other){
    other.setHealth(other.getHealth() - this.getAttack());
  }
  
  
}
