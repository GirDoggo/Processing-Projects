class half_channel extends ATP_synthase_components{
  float[] stor = new float[3];
  
  half_channel(float[] location){
    super(location);
    //rand_x = (float)(Math.random()*500);
    //rand_y = location[1]+(float)(200*Math.random());
  }
  
  void display(){
    fill(#DEA919);
    pushMatrix();
    this.drift();
    translate(location[0]-80, location[1]+25, location[2]);
    drawCylinder(8,30,280,0,0,0);
    popMatrix();
  }
  
  void move_thru(protons p){
    float time = p.get_j();
    //println(time);
    if (p.is_in_tunnel()){
      //println(time);
      stor[1]= lerp(p.get_loc()[1], -10, time);
      
      time += 0.1;
      if (time >= 1){
        //time = 0;
        p.set_in_tunnel(false);
        float rand_x = (float)(400*Math.random()+100);
        float rand_y = (float)(180*Math.random())+820;
        float rand_z = (float)(400*Math.random())-200;
        float[] rand_start = {rand_x, rand_y, rand_z};
        float rand_j = (float)(0.0001*Math.random());
        
        p.set_loc(rand_start);
        p.set_j(rand_j);
        return;
      }
      
      p.set_j(time);
      pushMatrix();
      p.set_loc(stor);
      p.move();
      popMatrix();
    } else{
      float curr_x = location[0]-80+this.get_drift();
      
      stor[0] = lerp(p.get_loc()[0], curr_x, time);
      stor[1] = lerp(p.get_loc()[1], location[1]+160, time);
      stor[2] = lerp(p.get_loc()[2], location[2], time);
      //println(lerpX, lerpY, lerpZ);
      
      time += 0.1;
      if (time >= 1){
        //time = 0;
        p.set_j(0);
        p.set_in_tunnel(true);
        return;
      }
      p.set_j(time);
      pushMatrix();
      p.set_loc(stor);
      p.move();
      popMatrix();
    }
  }
}
