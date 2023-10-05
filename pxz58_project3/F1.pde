class F1 extends ATP_synthase_components{
  float rot = 0;
  float j = 0;
  boolean ATP = false;
  float[] stor = new float[3];
  
  F1(float[] location){
    super(location);
  }
  
  void spawn(){
    j += 1;
    if (j % 100 == 0){
      j = 0;
      ATP = true;
    }
    if (ATP){
      fill(#2BC4DE);
      //stor[0] = lerp(location[0]-10, 1400, j);
      stor[0] = location[0] + 40*j+this.get_drift();
      //stor[1] = lerp(location[1]-320, -100, j);
      stor[1] = location[1]-320 - 40*j;
      //stor[2] = lerp(location[2]+50, -100, j);
      stor[2] = location[2]+50 -(40*j);
      pushMatrix();
      translate(stor[0], stor[1], stor[2]);
      sphere(60);
      popMatrix();
      j+=2;
      if (j == 6){
        j = 0;
        ATP = false;
      }
    }
  }
  
  void display(){
    pushMatrix();
    this.drift();
    translate(location[0], location[1]-280, location[2]);
    rotateY(rot);
    for (int i = 0; i < 6; i++){
      if (i%2 == 0) {
        fill(#2AC4A9);
      } else {
        fill(#2AC48A);
      }
      pushMatrix();
      translate(50*cos(i*PI/3), 0, 50*sin(i*PI/3));
      scale(1, 3.5, 1);
      sphere(35);
      popMatrix();
    }
    popMatrix();
    
    rot += PI/80;
    spawn();
  }
}
