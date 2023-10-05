class EndScreen {

  
  EndScreen() {
    fill(100, 150);
    rect(0, 0, 1000, 700);
  }
  
  void draw_screen(float time) {
    pushMatrix();
    textAlign(CENTER);
    
    fill(255);
    translate(500, 150);
    textSize(100);
    text("GAME OVER", 0, 0);
    
    text(String.format("Time: %.2fs", time), 0, 220);
    
    textSize(50);
    text("Main Menu (SPACE)", 0, 450);
    
    popMatrix();
    textAlign(LEFT);
  }
  
  
}
