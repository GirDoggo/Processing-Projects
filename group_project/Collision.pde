class Collision {
  float[] hit_box;
  Pipe p;
  
  void update_class(float[] hb, Pipe p) {
    this.hit_box = hb;
    this.p = p;
  }
  
  
  boolean collision(PVector player_pos, PVector player_dim, PVector pipe_pos, PVector pipe_dim) {
    boolean col = false;
    
    float player_radX = player_dim.x/2;
    float player_radY = player_dim.y/2;
    float pipe_w = pipe_dim.x/2;
    float pipe_h = pipe_dim.y/2;
    
    float dist_x = pipe_pos.x - player_pos.x;
    boolean x_overlap = dist_x > -(pipe_w+player_radX) & dist_x < (pipe_w+player_radX);
    float dist_y = pipe_pos.y - player_pos.y;
    boolean y_overlap = dist_y > -(pipe_h+player_radY) & dist_y < (pipe_h+player_radY);
    if (x_overlap & y_overlap){
      col = true;
    }
    
    return col;
  }
  
  
  boolean pipe_collision(float[] player_hit_box, Pipe p) {
    PVector top_pos = p.get_top_pos();
    PVector bot_pos = p.get_bottom_pos();
    PVector pipe_dim = p.get_dimensions();  //x - width  y - height
    
    PVector player_pos = new PVector(player_hit_box[0], player_hit_box[1]);
    
    PVector player_dim = new PVector(player_hit_box[2], player_hit_box[3]);
    
    boolean top_collide = collision(player_pos, player_dim, top_pos, pipe_dim);
    boolean bot_collide = collision(player_pos, player_dim, bot_pos, pipe_dim);
    
    return top_collide || bot_collide;
  }
  
  
  void show_hitbox(float[] player_hit_box, Pipe p) {
    PVector top_pos = p.get_top_pos();
    PVector bot_pos = p.get_bottom_pos();
    PVector pipe_dim = p.get_dimensions();  //x - width  y - height
    
    PVector player_pos = new PVector(player_hit_box[0], player_hit_box[1]);
    PVector player_dim = new PVector(player_hit_box[2], player_hit_box[3]);
    
    noFill();
    stroke(color(255, 0, 0));
    strokeWeight(2);
    rectMode(CENTER);
    
    rect(top_pos.x, top_pos.y, pipe_dim.x, pipe_dim.y);
    rect(bot_pos.x, bot_pos.y, pipe_dim.x, pipe_dim.y);
    ellipse(player_pos.x, player_pos.y, player_dim.x, player_dim.y);
    
    stroke(0);
    strokeWeight(1);
    rectMode(CORNER);
  }

  
  boolean check_collision() {
    //show_hitbox(this.hit_box, this.p);
    boolean pipe_collide = pipe_collision(this.hit_box, this.p);
    return pipe_collide;
  }
  
}
