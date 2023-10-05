class c_ring extends ATP_synthase_components{
  float rot = 0;
  
  c_ring(float[] location){
    super(location);
  }
  
  void display(){
    fill(#DE9219);
    pushMatrix();
    this.drift();
    //drawCylinder(8, 50, 130, location[0], location[1], location[2]);
    translate(location[0], location[1]+30, location[2]);
    rotateY(rot);
    drawCylinder(8, 50, 270, 0, 0, 0);
    for (int i = 0; i < 12; i++){
      pushMatrix();
      translate(50*cos(i*PI/6),20,50*sin(i*PI/6));
      sphere(5);
      popMatrix();
    }
    popMatrix();
    rot += PI/20;
  }
}
