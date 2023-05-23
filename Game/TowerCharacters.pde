public class TowerCharacters implements LivingObjects{
  public int[] location;  
  public int[] range;
  public int attack;
  public int direction;
  public int defense;
  public int health;
  public int ticks;
  
  public int[] getLocation(){
    return location;
  }
  public void setLocation(int[] newLocation){
    location = newLocation;
  }

  public int[] getRange(){
    return range;
  }
  public void setRange(int[] newRange){
    range = newRange;
  }
  
  public int getAttack(){
    return attack;
  }
  public void setAttack(int newAttack){
    attack = newAttack;
  }
  
  public int getDirection(){
    return direction;
  }
  public void setDirection(int newDirection){
    direction = newDirection;
  }
  
  public int getDefense(){
    return defense;
  }
  public void setDefense(int newDefense){
    defense = newDefense;
  }
  
  public int getHealth(){
    return health;
  }
  public void setHealth(int newHealth){
    health = newHealth;
  }
  
  public void toAttack(Enemies other){
    enemy.setHealth(this.getAttack() - enemy.getDefense());
  }
}
