class protons{
  float[] start, location = new float[3];
  float[] drift = new float[3];
  float[] bounds_x = new float[2]; float[] bounds_y = new float[2]; float[] bounds_z = new float[2];
  color c;
  int speed = 5;
  float j = 0;
  boolean in_tunnel = false;
  
  protons(float[] bounds_x, float[] bounds_y, float[] bounds_z, float[] start, color c){
    this.bounds_x = bounds_x;
    this.bounds_y = bounds_y;
    this.bounds_z = bounds_z;
    this.start = start;
    this.location[0] = start[0]; this.location[1] = start[1]; this.location[2] = start[2];
    this.c = c;
  }
  
  boolean is_in_tunnel(){
    return in_tunnel;
  }
  
  void set_in_tunnel(boolean t){
    in_tunnel = t;
  }
  
  float[] get_loc(){
    return location;
  }
  
  void set_loc(float[] loc){
    this.location = loc;
  }
  
  void set_j(float num){
    j = num;
  }
  
  float get_j(){
    return j;
  }
  
  //this code was adjusted from the code in Method 10. Polar of this website:
  //https://extremelearning.com.au/how-to-generate-uniformly-random-points-on-n-spheres-and-n-balls/
  float[] drift(){
    float u   = (float)(2*Math.random()-1);
    float phi = (float)(2* PI * Math.random());
    //println(phi, u);
    float x = (float)(cos(phi)*(Math.pow((float)(1-(u*u)), 0.5)));
    //println(x);
    float y = (float)(sin(phi)*(Math.pow((float)(1-u*u), 0.5)));
    //println(y);
    float z = u;
    //println(z);
    drift[0] = x;
    drift[1] = y;
    drift[2] = z;
    
    return drift; 
  }
  
  void display(){
    //println("***");
    fill(c);
    sphere(8);
  }
  
  void move(){
    pushMatrix();
    if (!in_tunnel){
      drift = drift();
      this.location[0] += speed*drift[0];
      this.location[1] += speed*drift[1];
      this.location[2] += speed*drift[2];
      //println(location);
      
      boolean X_OOB = (this.location[0]>bounds_x[1] || this.location[0]<bounds_x[0]);
      boolean Y_OOB = (this.location[1]>bounds_y[1] || this.location[1]<bounds_y[0]);
      boolean Z_OOB = (this.location[2]>bounds_z[1] || this.location[2]<bounds_z[0]);
      //println(X_OOB);println(Y_OOB);println(Z_OOB);
      if (X_OOB || Y_OOB || Z_OOB){
        location[0] = start[0];
        location[1] = start[1];
        location[2] = start[2];
      }
    }
    translate(this.location[0],this.location[1],this.location[2]);
    this.display();
    popMatrix();
  }
}
