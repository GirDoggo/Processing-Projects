class axle extends ATP_synthase_components{
  float rot = 0;
  
  axle(float[] location){
    super(location);
  }
  
  void display(){
    fill(#087E50);
    pushMatrix();
    this.drift();
    translate(location[0], location[1]-200, location[2]);
    drawCylinder(8,20,300,0,0,0);
    rotateY(rot);
    popMatrix();
    rot += PI/30;
  }
}
