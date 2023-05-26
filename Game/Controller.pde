class Controller{
  static final int num1 = 0;
  static final int num2 = 1;
  boolean[] inputs;
  
  public Controller(){
    inputs = new boolean[2];
  }
  
  boolean isPressed(int code){
    return inputs[code];
  }
  
  void press(int code){
    if(code == '1'){
      inputs[num1] = true;
    }
    if(code == '2'){
      inputs[num2] = true;
    }
  }
  
  void release(int code){
    if(code == '1'){
      inputs[num1] = false;
    }
    if(code == '2'){
      inputs[num2] = false;
    }
  }
}
