class alligator extends fluid_object{
  RBC target;
  float hunting_speed, time;
  PShape pacman = loadShape("pacman-svgrepo-com.svg");
  int collide = 0;
  boolean play_animation, is_OOB, flip = false;
  float anim_time;
  
  alligator(float speed, int[] bounds, float size, float[] location, float hunting_speed, RBC target){
    super(speed, bounds, size, location);
    this.hunting_speed = hunting_speed;
    this.target = target;
    if (hunting_speed > 100){
      this.time = 1;
    } else {
      //println("&");
      this.time += hunting_speed/100;
    }
  }
  
  void flip(){
    flip = true;
  }
  
  boolean get_flip(){
    return flip;
  }
  
  void add_time(float num){
    anim_time += num;
  }
  
  float get_time(){
    return anim_time;
  }
  
  void is_OOB_set(boolean o){
    is_OOB = o;
  }
  
  boolean is_OOB_get(){
    return is_OOB;
  }
  
  void play_animation_set(boolean play_anim){
    play_animation = play_anim;
  }
  
  boolean play_animation_get(){
    return play_animation;
  }
  
  void locSet(float[] loc){
    location = loc;
  }
  
  RBC getRBC(){
    return target;
  }
  
  float[] getLoc(){
     return this.location;
  }
  
  float seekerX(float time){
    float target_loc = target.getLocX();
    //println("***",location[0]);
    float lerpX = lerp(0, target_loc-location[0], time);
    return lerpX;
  }

  float seekerY(float time){
    //println("***",location[1]);
    float target_loc = target.getLocY();
    float lerpY = lerp(0, target_loc-location[1], time);
    return lerpY;
  }
  
    void display(){
    fill(#ffffff);
    shape(pacman, 0, 0, size, size);
    //println("***", location[0], location[1], speed);
  }
  
  void move(){
    float huntingXspeed = seekerX(time);
    float huntingYspeed = seekerY(time);
    //println(huntingXspeed, huntingYspeed);
    //huntingSpeeds = seeker(time);
    
    drift = drift();
    //newline += drift;
    drift = constrain(drift,(int)(bounds[0]-location[1]),(int)(bounds[1]-location[1]));
    location[1] = constrain(location[1]+drift+huntingYspeed, bounds[0], bounds[1]);
    pushMatrix();
      translate(location[0], location[1]);
    this.display();
    popMatrix();
    location[0] += (speed + huntingXspeed);
  }
  
  boolean collision(){
    float compareX = target.getLocX();
    float compareY = target.getLocY();
    //println(compare[0], compare[1]);
    float x_dist = (float)Math.pow((compareX - location[0]), 2);
    float y_dist = (float)Math.pow((compareY-location[1]), 2);
    float dist = (float)Math.pow(x_dist+y_dist, 0.5);
    //println(x_dist, "^", y_dist, "|", dist, size*2);
    
    if (dist <= size){
      //println("***");
      //if (compareY < location[1]){
      //  collide = 2;
      //} else{
      //  collide = 1;
      //println("***");
      //speed = 0;
      //hunting_speed = 0;
      return true;
    }
    
    return false;
  }
  
  //void animation_play(){
  //  pushMatrix();
  //  translate(location[0], location[1]);
  //  ellipse(5, 0, size, size/2);
  //  shape(pacman, 0, 0, size+2, size+2);
  //  popMatrix();
  //}
}
