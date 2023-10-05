class RBC extends fluid_object{
  int rot_state;
  int collide = 0;
  boolean is_OOB = false;
  
  RBC(float speed, int[] bounds, float size, float[] location, int rot_state){
    super(speed, bounds, size, location);
    this.rot_state = rot_state;
    //this.grouped = grouped;
  }
  
  void is_OOB_set(boolean o){
    is_OOB = o;
  }
  
  boolean is_OOB_get(){
    return is_OOB;
  }
  
  void rotAdd(){
    this.rot_state += 1;
    constrain(rot_state, 0, 8);
  }
  
  void locSet(float[] loc){
    location = loc;
  }
  
  float getLocX(){
    return location[0];
  }
  
  float getLocY(){
    return location[1];
  }
  
  int getRot(){
    return rot_state;
  }
  
  int rotation(int rot_state){
    if ((int)(10*Math.random())%4==0){
      if ((int)(10*Math.random())%3==0){
        rot_state += 1;
      } else if ((int)(10*Math.random())%3==0){
        rot_state -= 1;
      }
    }
    rot_state = constrain(rot_state, 0, 8);
    return rot_state;
  }

  void display(){
    pushMatrix();
    rot_state = rotation(rot_state);
    if (rot_state == 1){
      scale(1, 0.9);
    } else if (rot_state == 2){
      scale(1, 0.83);
    } else if (rot_state == 3){
      scale(1, 0.75);
    } else if (rot_state == 4){
      scale(1,0.69);
    } else if (rot_state == 5){
      scale(1,0.6);
    } else if (rot_state == 6){
      scale(1, 0.5);
    } else if (rot_state == 7){
      scale(1, 0.4);
    } else if (rot_state == 8){
      scale(1, 0.3);
      fill(#931313);
      ellipse(0, 0, 2*size, size);
      popMatrix();
      return;
    }
    fill(#C61818);
    ellipse(0, 0, 2*size, size);
    fill(#860B0B);
    ellipse(0, 0, size, size/2);
    popMatrix();
    //println("&&&", location[0], speed);
  }
  
  float drift(){
    if ((int)(10*Math.random())%2==0){
      drift = (float)(vessel_width/80*Math.random());
    } else{
      drift = (float)(-1*vessel_width/80*Math.random());
    }
    if (collide == 2){
      //println("OOOO", collide);
      collide = 0;
      drift = abs(drift);
      //drift = size;
      //return drift;
    } else if (collide == 1){
      //println("IIII", collide);
      collide = 0;
      drift = -abs(drift);
      //drift = -size;
      //return drift;
    }
    //println(drift);
    return drift;
  }
  
  void collision(RBC compareR){
    float compareX = compareR.getLocX();
    float compareY = compareR.getLocY();
    //println(compare[0], compare[1]);
    float x_dist = (float)Math.pow((compareX - location[0]), 2);
    float y_dist = (float)Math.pow((compareY-location[1]), 2);
    float dist = (float)Math.pow(x_dist+y_dist, 0.5);
    //println(x_dist, "^", y_dist, "|", dist, size*2);
    
    if (dist <= size/2){
      //println("***");
      if (compareY < location[1]){
        //compare[1] -= size/80;
        //location[1] += size/80;
        //println(compare[1], location[1]);
        //compareR.locSet(compare);
        collide = 2;
      } else{
        //compare[1] += size/80;
        //location[1] -= size/80;
        //println(compare[1], location[1]);
        //compareR.locSet(compare);
        collide = 1;
      }
      
      rot_state += 1;
      constrain(rot_state, 0, 8);
      compareR.rotAdd();
    }
  }
}
