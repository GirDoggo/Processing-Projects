class AllPipes {
  float pipe_distance;
  ArrayList<Pipe> all_pipes;
  
  float x = 1100;
  
  AllPipes(float dist) {
    this.pipe_distance = dist;
    all_pipes = new ArrayList<Pipe>();
    
    for (int i = 0; i < 3; i++) {
      Pipe p = new Pipe(x, (int) random(250, 600), 5, dist);  //x, y, speed, distance
      all_pipes.add(p);
      x += dist;
    }
  }
  
  ArrayList<Pipe> get_all_pipes() {
    return all_pipes;
  }
  
  void draw() {
    for (Pipe p : all_pipes) {
      p.set_all_pipes((ArrayList<Pipe>) all_pipes.clone());
      p.draw_pipe_set();
      all_pipes = p.get_all_pipes();
    }
    
  }
}
