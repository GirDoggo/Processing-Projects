class ATP_synthase_components{
  float[] location = new float[3];
  float i = 0;
  float x = 0;
  
  ATP_synthase_components(float[] location){
    this.location = location;
  }
  
  void drift(){
    x = lerp(-30, 150, (cos(i+PI/2)+1)*0.5);
    i += 0.01;
    //pushMatrix();
    translate(x, 0, 0);
    //popMatrix();
  }
  
  float get_drift(){
    return x;
  }
}
