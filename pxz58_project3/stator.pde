class stator extends ATP_synthase_components{
  stator(float[] location){
    super(location);
  }
  
  void display(){
    fill(#087E50);
    pushMatrix();
    this.drift();
    pushMatrix();
    translate(location[0]-108, location[1]-120, location[2]);
    drawCylinder(8,10,570,0,0,0);
    translate(0,-300,0);
    sphere(20);
    popMatrix();
    
    pushMatrix();
    translate(location[0]-50, location[1]-420, location[2]);
    rotateZ(PI/2);
    drawCylinder(8,10,120,0,0,0);
    translate(20,-50,10);
    scale(0.3,1.9,2.6);
    sphere(40);
    popMatrix();
    
    popMatrix();
  }
}
