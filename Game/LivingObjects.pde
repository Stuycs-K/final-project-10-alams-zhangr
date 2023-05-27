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
  public abstract int getRange();
  
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
  
  public int checkRange(LivingObjects beep){
    if(beep.getRange() == 1){
      return rangeOne(beep);
    }
    if(beep.getRange() == 2){
      return rangeTwo(beep);
    }
    return -1;
  }
  
  public int rangeOne(LivingObjects boop){
    int x = boop.getLocation()[1];
    int y = boop.getLocation()[0];
    if(boop.getDirection() == TOP){
      if(y - 1 > 0){
        return eneMap[y - 1][x];
      }
    }
    if(boop.getDirection() == RIGHT){
      if(x + 1 < eneMap[0].length){
        return eneMap[y][x + 1];
      }
    }
    if(boop.getDirection() == DOWN){
      if(y + 1 < eneMap.length){
        return eneMap[y + 1][x];
      }
    }
    if(boop.getDirection() == LEFT){
      if(x - 1 > 0){
        return eneMap[y][x - 1];
      }
    }
    return -1;
  }
  
  public int rangeTwo(LivingObjects beep){
    return -1;
  }
}
