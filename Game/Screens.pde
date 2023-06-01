public class Screens {
  public Screens() {
  }

  void menu() {
    rect(325, 175, 350, 50);
    rect(325, 250, 350, 50);
    rect(325, 325, 350, 50);
    textSize(20);
    fill(0);
    text("Level One", 450, 210);
    text("Level Two", 450, 285);
    text("Level Three", 450, 360);
  }

  void win() {
    fill(0, 255, 0, 127);
    rect(0, 0, 1000, 550);
    fill(0);
    rect((map[0].length/2 - 1)*SQUARE_SIZE, 250, SQUARE_SIZE*3, 50);
    textSize(20);
    fill(255);
    text("MISSION ACCOMPLISHED", width/2 - SQUARE_SIZE* .85, 285);
  }

  void lose() {
    fill(255, 0, 0, 127);
    rect(0, 0, 1000, 550);
    fill(0);
    rect((map[0].length/2 - 1)*SQUARE_SIZE, 250, SQUARE_SIZE*3, 50);
    textSize(20);
    fill(255);
    text("MISSION FAILED", width/2 - SQUARE_SIZE/2 - 10, 285);
  }
}
