class PlayGame {
  //Pipes
  AllPipes pipes;
  
  //Butterfly
  color[] colors;
  Butterfly b;
  boolean flap;
  boolean dead, offscreen;
  
  //Collision
  Collision col;
  
  //confetti
  ConfettiSystem cs;
  
  float game_over_frame;
  boolean hit;
  
  Timer timer;
    
  PlayGame() {
    //Pipes
    pipes = new AllPipes(500);
  
    //Butterfly
    flap = false;
    colors = new color[]{#FF9999, #FFCC99, #FFFF99, #CCFF99, #9999FF, #CC99FF, #FF99FF, #FF99CC};
    b = new Butterfly(colors);
    
    //Collision
    col = new Collision();
    
    //cs = null;
    cs = new ConfettiSystem(b.getPos());
    cs.run();
    
    //Other misc variables
    dead = false;
    game_over_frame = 10000000.0;
    hit = false;
    
    timer = new Timer(0);
  }
  
  float get_time() {
    return timer.get_time();
  }
  
  float get_game_over_frame() {
    return game_over_frame;
  }
  
  void keyPressed() {
    if (this.hit == false) {
      if (key == ' ') {
        b.resetFlap();
      }
    } 
  }
  
  void run_confetti() {
    if (offscreen == true && dead == false) {
      PVector deadPos = b.getPos();
      //Update position of confetti
      cs.update_pos(deadPos);
      dead = true;
      //Get frame_count to stop play_game and sets hit to true
      game_over_frame = frameCount;
      hit = true;
      
      //Stops moving pipe
      for (int t = 0; t < pipes.get_all_pipes().size(); t++) {
        pipes.get_all_pipes().get(t).stop_pipe();
      }
    }
    //If dead, run code to make confetti
    if (dead) {
      cs.run();
    }
  }
  
  
  void play() {
     game_background();
    //Pipes
    pipes.draw();
    Pipe p = pipes.get_all_pipes().get(0);
    
    //Butterfly
    offscreen = b.isOffscreen();    
    
    if (offscreen == false) {
      b.display();
      if (hit == false) {
        b.wingFlap();
      }
      b.butterflyFall();
    }
    
    //Checks for offscreen, if so, run confetti
    this.run_confetti();
    
    float[] hit_box = b.get_hitbox();  //Player hitbox
    
    col.update_class(hit_box, p);
    boolean pipe_collide = col.check_collision();
    //col.show_hitbox(hit_box, p);
    if (pipe_collide) {
      //Stops moving pipe
      for (int t = 0; t < pipes.get_all_pipes().size(); t++) {
        pipes.get_all_pipes().get(t).stop_pipe();
      }
      
      hit = true;
    }
    
    if (hit == false) {
      timer.countUp();
    }
  }
  
}
