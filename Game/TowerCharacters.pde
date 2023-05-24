public class TowerCharacters extends LivingObjects{
  private int health;
  private int speed;
  private int attack;
  private int direction;
  private int range;
  private int[] location; 
  private int block;
  //public int defense;
  
  //INSTANTIATE
  public TowerCharacters(){ //default
  }
  
  public TowerCharacters(int hp, int spd, int atk, int hit){
    health = hp;
    speed = spd;
    attack = atk;
    direction = 1;
    range = hit;
    location = new int[]{0, 0};
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////
  public void toAttack(LivingObjects other){
    other.setHealth(other.getHealth() - this.getAttack());
  } 
}
