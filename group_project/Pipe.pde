class Pipe {
  PVector pos;
  float speed;
  float dist;
  
  PImage pipe_sprite;
  
  float gap = 170;
  
  ArrayList<Pipe> all_pipes;
  
  Pipe(float x, float y, float s, float d) {
    this.pos = new PVector(x, y);
    this.speed = s;
    this.dist = d;
  }
  
  
  void set_all_pipes(ArrayList<Pipe> ap) {
    this.all_pipes = ap;
  }
  
  ArrayList<Pipe> get_all_pipes() {
    return this.all_pipes;
  }
  
  float get_x() {
    return this.pos.x;
  }
  
  PVector get_dimensions() {
    PVector dim = new PVector(88+2, 500+40+2); //width/height
    return dim;
  }
  
  PVector get_top_pos() {
    // Middle cord
    float new_x = this.pos.x + this.get_dimensions().x/2;
    float new_y = this.pos.y - gap - this.get_dimensions().y/2;
    
    // Get top left cord
    //new_x = this.pos.x + 1;
    //new_y = this.pos.y - gap - this.get_dimensions().y;
    
    PVector xy = new PVector(new_x, new_y);
    return xy;
  }
  PVector get_bottom_pos() {
    // Middle cord
    float new_x = this.pos.x + this.get_dimensions().x/2;
    float new_y = this.pos.y + this.get_dimensions().y/2;
    
    // Get top left cord
    //new_x = this.pos.x +1;
    //new_y = this.pos.y;
    
    PVector xy = new PVector(new_x, new_y);
    return xy;
  }
  
  void stop_pipe() {
    this.speed = 0;
  }
  
  void move() {
    // If out of screen, reset position to the end of the last arraylist
    if (this.pos.x <= -100) {
      float last_pos_x = this.all_pipes.get(this.all_pipes.size() - 1).get_x();
      Pipe first = this.all_pipes.remove(0);
      this.all_pipes.add(first);
      
      this.pos.x = last_pos_x + this.dist;
      this.pos.y = (int) random(250, 600);
    }
    this.pos.x -= this.speed;
  }
  
  void draw_top_pipe() {
    stroke(1);
    strokeWeight(3);
    pushMatrix();
    
    //Pipe
    fill(#54CB3A);
    translate(this.pos.x, this.pos.y - gap - 40);
    scale(1, -1);
    rect(0, 0, 80, 500);
    rect(-4, -40, 80+8, 40);
    
    //Shadowing
    noStroke();
    fill(#A6FF93);
    rect(80-5-1, 2, 5, 500);
    rect(88-5-5, -40+2, 5, 40-4);
    
    fill(#6BE850);
    rect(80-20-1-5, 2, 20, 500);
    rect(88-20-5-5, -40+2, 20, 40-4);
    
    fill(#3AB220);
    rect(2, 2, 10, 500);
    rect(-4+2, -40+2, 10, 40-4);
    
    popMatrix();
    stroke(1);
    strokeWeight(1);
  }
  
  void draw_bottom_pipe() {
    stroke(1);
    strokeWeight(3);
    pushMatrix();
    
    //Pipe
    fill(#54CB3A);
    translate(this.pos.x, this.pos.y + 40);
    rect(0, 0, 80, 500);
    rect(-4, -40, 80+8, 40);
    
    //Shadowing
    noStroke();
    fill(#A6FF93);
    rect(80-5-1, 2, 5, 500);
    rect(88-5-5, -40+2, 5, 40-4);
    
    fill(#6BE850);
    rect(80-20-1-5, 2, 20, 500);
    rect(88-20-5-5, -40+2, 20, 40-4);
    
    fill(#3AB220);
    rect(2, 2, 10, 500);
    rect(-4+2, -40+2, 10, 40-4);
    
    popMatrix();
    stroke(1);
    strokeWeight(1);
  }
  
  void draw_pipe_set() {
    this.draw_top_pipe();
    this.draw_bottom_pipe();
    this.move();
  }
  
  
}
