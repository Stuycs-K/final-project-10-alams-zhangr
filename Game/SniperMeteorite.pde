<<<<<<< HEAD
public class SniperMeteorite{
  public int[] Location;
  public int[] 
=======
public class SniperMeteorite extends TowerCharacters{
  public int[] location;
  public int[] range;
  public int attack;
  public int direction;
  public int defense;
  public int health;
  
  public void toAttack(Enemies enemy){
    enemy.setHealth(this.getAttack() - enemy.getDefense());
  }
>>>>>>> 1f84bff21c4a4014d9e5555e7f753943b8446d37
}
