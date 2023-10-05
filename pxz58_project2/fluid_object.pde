class fluid_object{
  float speed;
  int[] bounds; 
  float size;
  float vessel_width;
  float[] location;
  float midline;
  float newline;
  float drift;
  int vessel_length;
  
  //fluid_object(){
  //  speed = 10;
  //  location = new float[2];
  //  bounds = new int[2];
  //  size = 10;
  //  //vessel_length = 2400;
  //}
  
  fluid_object(float speed, int[] bounds, float size, float[] location){
    this.speed = speed;
    this.location = location;
    this.bounds = bounds;
    this.size = size;
    //this.vessel_length = vessel_length;
    //ori_loc = location[0];
    vessel_width = (bounds[1]-bounds[0]);
    midline = (bounds[1]-bounds[0])/2;
    newline = 0;
  }
  
  float accelerate_thru_vessel(float speed, float diameter){
    speed = speed * diameter / vessel_width;
    vessel_width = diameter;
    return speed;
  }
  
  void display(){
    fill(#ffffff);
    ellipse(0, 0, size, size);
    //println("***", location[0], location[1], speed);
  }
  
  void move(){
    //if (location[0] % 1000 == 0){println(1111111111);}
    drift = drift();
    //newline += drift;
    drift = constrain(drift,(int)(bounds[0]-location[1]),(int)(bounds[1]-location[1]));
    location[1] = constrain(location[1]+drift, bounds[0], bounds[1]);
    pushMatrix();
      translate(location[0], location[1]);
    this.display();
    popMatrix();
    location[0] += speed;
  }
  
  float drift(){
    if ((int)(10*Math.random())%2==0){
      drift = (float)(vessel_width/50*Math.random());
    } else{
      drift = (float)(-1*vessel_width/50*Math.random());
    }
    //println(drift);
    return drift;
  }
  
  void respawner(int vessel_length){
    //println(location[0], ori_loc);
    if (location[0] > (vessel_length+size/2)){
      //println("&", ori_loc);
      location[0] = 0;
    }
  }
}
