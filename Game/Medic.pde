//public class Medic extends TowerCharacters {
//  public Queue<TowerCharacters> blocked;

//  public Medic() {
//    super();
//  }

//  public Medic(int hp, int spd, int atk, int hit, String[] img, int[]frami, int blk, int optype, int deploymentCost) {
//    super(hp, spd, atk, hit, img, frami, blk, optype, deploymentCost);
//    blocked = new LinkedList<TowerCharacters>();
//  }

//  public void toAttack(LivingObjects other) {
//    if (other.getMaxHP() > other.getHealth()) {
//      if (other.getHealth() + this.getAttack() > other.getMaxHP()) {
//        other.setHealth(other.getMaxHP());
//      } else {
//        other.setHealth(other.getHealth() + this.getAttack());
//      }
//    }
//    println(other.getHealth());
//  }

//  public LivingObjects checkRange() { //returns first value of blocked
//    if (charMap[this.getLocation()[1]][this.getLocation()[0]] > -1) {
      
//      if (!blocked.contains(inventory[charMap[this.getLocation()[1]][this.getLocation()[0]]]) && inventory[charMap[this.getLocation()[1]][this.getLocation()[0]]].getHealth() < inventory[charMap[this.getLocation()[1]][this.getLocation()[0]]].getMaxHP()  ) {
//        blocked.add(inventory[charMap[this.getLocation()[1]][this.getLocation()[0]]]);
//      }
//    }
//    if (this.getRange() == 1) {
//      rangeOne();
//    }
//    if (this.getRange() == 2) {
//      rangeOne();
     
//    }

//    for (int i = 0; i < blocked.size(); i++) {
//      if (blocked.peek().getHealth() == blocked.peek().getMaxHP()) {
//        blocked.remove();
//      }
//    }
//    return blocked.peek();
//  }

//  void rangeOne() {
//    int x = this.getLocation()[0];
//    int y = this.getLocation()[1];
//    if (this.getDirection() == T) {
//      if (y - 1 > 0) {
//        if (charMap[y - 1][x] > -1 && inventory[charMap[y-1][x]].getMaxHP() > inventory[charMap[y-1][x]].getHealth() ) {
//          if (!blocked.contains(inventory[charMap[y - 1][x]])) {
//            blocked.add(inventory[charMap[y - 1][x]]);
//          }
//        }
//      }
//    }
//    if (this.getDirection() == R) {
//      if (x + 1 < charMap[0].length) {
//        if (charMap[y][x+1] > -1) {
//          if (!blocked.contains(inventory[charMap[y][x + 1]]) && inventory[charMap[y][x + 1]].getMaxHP() > inventory[charMap[y][x + 1]].getHealth() ) {
//            blocked.add(inventory[charMap[y][ x + 1]]);
//          }
//        }
//      }
//    }
//    if (this.getDirection() == D) {
//      if (y + 1 < charMap.length) {
//        if (charMap[y +1][x] > -1 && inventory[charMap[y+1][x]].getMaxHP() > inventory[charMap[y+1][x]].getHealth() ) {
//          if (!blocked.contains(inventory[charMap[y + 1][x]])) {
//            blocked.add(inventory[charMap[y + 1][x]]);
//          }
//        }
//      }
//    }
//    if (this.getDirection() == L) {
//      if (x - 1 > 0) {
//        if (charMap[y][x - 1] > -1) {
//          if (!blocked.contains(inventory[charMap[y][x - 1]]) && inventory[charMap[y][x - 1]].getMaxHP() > inventory[charMap[y][x - 1]].getHealth()) {
//            blocked.add(inventory[charMap[y][ x - 1]]);
//          }
//        }
//      }
//    }
//  }
//}
