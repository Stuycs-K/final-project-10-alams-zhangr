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
  //public int[] getRange(){
  //  return range;
  //}
  
  //public void setRange(int[] newRange){
  //  range = newRange;
  //}
  
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
  
  public void moveLeft(int step){
    int[] coords = this.getLocation();
    this.setLocation(new int[]{coords[0], coords[1] - step);
  }
  
  public void moveRight(int step){
    int[] coords = this.getLocation();
    this.setLocation(new int[]{coords[0], coords[1] + step);
  }
  
  public void moveUp(int step){
    int[] coords = this.getLocation();
    this.setLocation(new int[]{coords[0] - step, coords[1]);
  }
  
  public void moveDown(int step){
    int[] coords = this.getLocation();
    this.setLocation(new int[]{coords[0] + step, coords[1]);
  }
  
  public void movePath(ArrayList<int[]> path){
    if (path.size() = 0){
      
}
