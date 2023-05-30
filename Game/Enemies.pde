public class Enemies extends LivingObjects{
  private int health;
  private int speed;
  private int attack;
  private int direction;
  private int range;
  private int[] location;
  private String sprite;
  
  public Enemies(){ //default
    
  }
  
  public Enemies(int hp, int spd, int atk, int hit, int[] position, String img){
    health = hp;
    speed = spd;
    attack = atk;
    direction = 1;
    range = hit;
    location = position;
    sprite = img;
  }
  
  ////////////////////////////////////////////
  public int getHealth(){
    return health;
  }
  
  public void setHealth(int newHealth){
    health = newHealth;
  }
  
  //ATTACK
  public int getAttack(){
    return attack;
  }
  
  public void setAttack(int newAttack){
    attack = newAttack;
  }
  
  //DIRECTION
  public int getDirection(){
    return direction;
  }
  
  public void setDirection(int newDirection){
    direction = newDirection;
  }
  
  ////RANGE
  public int getRange(){
    return range;
  }
  
  //LOCATION
  public int[] getLocation(){
    return location;
  }
  
  public void setLocation(int[] newLocation){
    location = newLocation;
  }
  
  public String getSprite(){
    return sprite;
  }
  
  ////////////////////////////////////////////
  public void toAttack(LivingObjects other){
    other.setHealth(other.getHealth() - this.getAttack());
  }
  
<<<<<<< HEAD
  public void move(int step){
    int[] coords = this.getLocation();
    if (this.getDirection() == 1){ //up
      this.setLocation(new int[]{coords[0] - step, coords[1]});
    }
    else if (this.getDirection() == 2){ //right
      this.setLocation(new int[]{coords[0], coords[1] + step});
    }
    else if (this.getDirection() == 3){ //down
      this.setLocation(new int[]{coords[0] + step, coords[1]});
    }
    else if (this.getDirection() == 4){ //left
      this.setLocation(new int[]{coords[0], coords[1] - step});
    }
  }
  
  public boolean nextStepOnPath(ArrayList<int[]> path, int step, int SQUARE_SIZE){
    int[] block = path.get(path.size() - 1);
    int[] coords = this.getLocation();
    if (this.getDirection() == 1){ //up
      if ((coords[0] - step)/SQUARE_SIZE != block[1]){
        return false;
      }
    }
    else if (this.getDirection() == 2){ //right
      if ((coords[1] + step)/SQUARE_SIZE != block[0]){
        return false;
      }
    }
    else if (this.getDirection() == 3){ //down
      if ((coords[0] + step)/SQUARE_SIZE != block[1]){
        return false;
      }
    }
    else if (this.getDirection() == 4){ //left
      if ((coords[1] - step)/SQUARE_SIZE != block[0]){
        return false;
      }
    }
    return true;
  }
     
  
  public void movePath(ArrayList<int[]> path, int step, int SQUARE_SIZE){
    if (path.size() == 0){
      int[] coords = path.get(path.size() - 1);
      this.setDirection(coords[3]);
      if (this.getDirection() == coords[3] && nextStepOnPath(path, step, SQUARE_SIZE)){
        move(step);
      }
      else {
        path.remove(path.size() - 1);
        this.setDirection(coords[3]);
        if (this.getDirection() == coords[3] && nextStepOnPath(path, step, SQUARE_SIZE)){
          move(step);
        }
      }
    }
  } 
  public int checkRange(){ //returns first value of blocked
    if(this.getRange() == 1){
      rangeOne();
    }
    if(this.getRange() == 2){
      rangeTwo();
    }
    return 0;
  }
  
  void rangeOne(){
    
  }
  
  void rangeTwo(){
 
  }
  
  

}
