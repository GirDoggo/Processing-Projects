float friction = 0.2;
float grav_acc = 9.8;
float[] boundsX = {0,1200}; float[] boundsY = {0,900}; float[] boundsZ = {0,800};
//int click_count = 0;

PVector ball_pos, start;
PVector set, prev_set, tracer_loc;
PVector app_force;
boolean init = true;

Ball ball;

void setup(){
  size(1200,900,P3D);
  camera(600,450,1500,600,450,400,0,1,0);
  sphereDetail(8);
  
  start = new PVector(600,450,400);
  ball = new Ball();
  set = new PVector();
  prev_set = new PVector(0,0,0);
  tracer_loc = new PVector(0,0,0);
  ori_set = new PVector(0,0,0);
  app_force = new PVector(0,0,0);
}

void draw(){
  drawBackground();
  if (trace){
    z_displace = set.z - ori_set.z;
    x_displace = set.x - ori_set.x;
    y_displace = set.y - ori_set.y;
    app_force.x = x_displace; app_force.y = y_displace; app_force.z = z_displace;
    ball.setDuration(app_duration);
    app_duration = 0;
    trace = false;
    ball.setApp(app_force);
  }
  ball.progress();
  
  //this is commented out, so you don't accidentally download several hundred 
  //kilobytes of .tif files when you run the program.
  //saveFrame();
}
