public class Enemies extends LivingObjects{
  private int health;
  private int speed;
  private int attack;
  private int direction;
  private int range;
  private int[] location;
  private String sprite;
  private int xCoord;
  private int yCoord;
  private int ticks;
  private float sqSize;
  private int ms;
  public Enemies(){ //default
    
  }
  
  public Enemies(int hp, int spd, int atk, int hit, String img, int moveSpeed){
    health = hp;
    speed = spd;
    attack = atk;
    direction = 1;
    range = hit;
    sprite = img;
    ticks = 0;
    ms = moveSpeed;
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
  
  public int getXCoord(){
    return xCoord;
  }
   
  public void setXCoord(int newX){
    xCoord = newX;
  }
  
  public int getYCoord(){
    return yCoord;
  }
   
  public void setYCoord(int newY){
    yCoord = newY;
  }
  
  public int getMS(){
    return ms;
  }
  
  
  ////////////////////////////////////////////
  public void toAttack(LivingObjects other){
    other.setHealth(other.getHealth() - this.getAttack());
  }
  
  public void move(int step){
    if (this.getDirection() == 1){ //up
      this.setYCoord(this.getYCoord() - step);
    }
    else if (this.getDirection() == 2){ //right
      this.setXCoord(this.getXCoord() + step);
    }
    else if (this.getDirection() == 3){ //down
      this.setYCoord(this.getYCoord() + step);
    }
    else if (this.getDirection() == 4){ //left
      this.setXCoord(this.getXCoord() - step);
    }
  }
  
  
  //public boolean nextStepOnPath(ArrayList<int[]> path, int step, int SQUARE_SIZE){
  //  int[] block = path.get(path.size() - 1);
  //  if (this.getDirection() == 1){ //up
  //    if ((this.getYCoord() - step)/SQUARE_SIZE != block[1]){
  //      return false;
  //    }
  //  }
  //  else if (this.getDirection() == 2){ //right
  //    if ((this.getXCoord() + step)/SQUARE_SIZE != block[0]){
  //      return false;
  //    }
  //  }
  //  else if (this.getDirection() == 3){ //down
  //    if ((this.getYCoord() + step)/SQUARE_SIZE != block[1]){
  //      return false;
  //    }
  //  }
  //  else if (this.getDirection() == 4){ //left
  //    if ((this.getXCoord() - step)/SQUARE_SIZE != block[0]){
  //      return false;
  //    }
  //  }
  //  return true;
  //}
     
  
  //public void movePath(ArrayList<int[]> path, int step, int SQUARE_SIZE){
  //  if (path.size() == 0){
  //    int[] coords = path.get(path.size() - 1);
  //    this.setDirection(coords[3]);
  //    if (this.getDirection() == coords[3] && nextStepOnPath(path, step, SQUARE_SIZE)){
  //      move(step);
  //    }
  //    else {
  //      path.remove(path.size() - 1);
  //      this.setDirection(coords[3]);
  //      if (this.getDirection() == coords[3] && nextStepOnPath(path, step, SQUARE_SIZE)){
  //        move(step);
  //      }
  //    }
  //  }
  //} 
  
  //public void movePath(String path, float SQUARE_SIZE, int step, int stepCounter){
    
  //}
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
