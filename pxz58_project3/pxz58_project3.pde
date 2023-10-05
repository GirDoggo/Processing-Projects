protons[] test_set = new protons[500];
//protons chan_prot;
protons[] chan_prot = new protons[5];
float[] bounds_x1 = new float[2]; float[] bounds_y1 = new float[2]; float[] bounds_z1 = new float[2];
float[] start_1 = new float[3];
float[] location = new float[3];
c_ring c; axle a; F1 F; half_channel h; stator s;

void setup(){
  size(800,1000,P3D);
  sphereDetail(8);
  bounds_x1[0] = -100; bounds_x1[1] = 900;
  bounds_y1[0] = 800; bounds_y1[1] = 1100;
  bounds_z1[0] = -300; bounds_z1[1] = 300;
  //start_1[0] = 500; start_1[1] = 900; start_1[2] = 0;
  
  camera();
  for (int i = 0; i < 500; i++){
    start_1[0] = (float)(800*Math.random());
    start_1[1] = (float)(180*Math.random())+820;
    start_1[2] = (float)(80*Math.random())-40;
    //start_1[2] = (float) Math.random();
    test_set[i] = new protons(bounds_x1, bounds_y1, bounds_z1, start_1, #ff0000);
  }
  
  bounds_y1[0] = -20; bounds_y1[1] = 1000;
    //float rand_x = (float)(400*Math.random()+100);
    //float rand_y = (float)(180*Math.random())+820;
    //float rand_z = (float)(400*Math.random())-200;
    ////println(rand_x, rand_y, rand_z);
    //float[] rand_start = {rand_x, rand_y, rand_z};
    //chan_prot = new protons(bounds_x1, bounds_y1, bounds_z1, rand_start, #ff0000);
    //chan_prot.set_j(0);
    for (int i = 0; i <5; i++){
    float rand_x = (float)(400*Math.random()+100);
    float rand_y = (float)(180*Math.random())+820;
    float rand_z = (float)(400*Math.random())-200;
    //println(rand_x, rand_y, rand_z);
    float[] rand_start = {rand_x, rand_y, rand_z};
    chan_prot[i] = new protons(bounds_x1, bounds_y1, bounds_z1, rand_start, #ff0000);
    chan_prot[i].set_j(0);}
  
  location[0] = 400; location[1] = 650; location[2] = 100;
  c = new c_ring(location);
  a = new axle(location);
  F = new F1(location);
  h = new half_channel(location);
  s = new stator(location);
  
  //frameRate(20);
}

void bilayer(){
  fill(#DB1414);
  pushMatrix();
  translate(-100,800);
  for (int i = 0; i<16; i++){
    translate(60, 0);
    sphere(50);
  }
  popMatrix();
  
  pushMatrix();
  translate(-100,600);
  for (int i = 0; i<16; i++){
    translate(60, 0);
    sphere(50);
    
    drawCylinder(10,18,266, (i), 100, 0);}
  popMatrix();
}

//Code taken from: 
//https://vormplus.be/full-articles/drawing-a-cylinder-with-processing
void drawCylinder(int sides, float r, float h, float x_offset, float y_offset, float z_offset)
{
    float angle = 360 / sides;
    float halfHeight = h / 2;
    // draw top shape
    beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r;
        float y = sin( radians( i * angle ) ) * r;
        vertex( x+x_offset, -halfHeight+y_offset, y+z_offset);    
    }
    endShape(CLOSE);
    // draw bottom shape
    beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r;
        float y = sin( radians( i * angle ) ) * r;
        vertex( x+x_offset, -halfHeight+y_offset, y+z_offset );    
    }
    endShape(CLOSE);
    
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < sides + 1; i++) {
      float x = cos( radians( i * angle ) ) * r;
      float y = sin( radians( i * angle ) ) * r;
      vertex( x+x_offset, halfHeight+y_offset, y+z_offset);
      vertex( x+x_offset, -halfHeight+y_offset, y+z_offset);    
  }
  endShape();
  //popMatrix();
}

void draw(){
  background(80,130,140);

  bilayer();
  fill(255,0,0);
  for (int i = 0; i < 500; i++){
    test_set[i].move();
  }
  c.display();
  a.display();
  F.display();
  h.display();
  s.display();
  
  //for (int i = 0; i < 1; i++){
  //  h.move_thru(chan_prot);
  //}
  for (int i = 0; i < 5; i++){
    h.move_thru(chan_prot[i]);
  }

  //saveFrame();
}
