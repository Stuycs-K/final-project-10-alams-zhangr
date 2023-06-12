public class Medic extends TowerCharacters {
  public Queue<TowerCharacters> blocked;

  public Medic() {
    super();
  }

  public Medic(int hp, int spd, int atk, int hit, String[] img, int[]frami, int blk, int optype, int deploymentCost) {
    super(hp, spd, atk, hit, img, frami, blk, optype, deploymentCost);
    blocked = new LinkedList<TowerCharacters>();
  }

  public void toAttack(LivingObjects other) {
    if (other.getMaxHP() > other.getHealth()) {
      if (other.getHealth() + this.getAttack() > other.getMaxHP()) {
        other.setHealth(other.getMaxHP());
      } else {
        other.setHealth(other.getHealth() + this.getAttack());
      }
    }
  }

  public void checkRange() {
    
  }
}
