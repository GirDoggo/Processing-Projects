void mousePressed(){
  float x = mouseX;
  float y = mouseY;
  if (mouseButton == LEFT){
    //click_count += 1;
    //click_count = constrain(click_count, 0, 30);
    //fill(255);
    //pushMatrix();
    //translate(0,0,900);
    //ellipse(mouseX,mouseY,click_count,click_count);
    //popMatrix();
    
    ball_pos = ball.getPos();
    //z_mod is used to slightly increase or decrease the area on which
    //the ball can be clicked, based on how far away it is from the camera.
    float z_mod = 1+((ball_pos.z-400)/400*0.3333);
    
    //pers_adj and the two mouseX and mouseY adj variables are calculated
    //in order to shift the position of the mouse when trying to grab a ball
    //that is further or closer to the camera. The distance of the mouse
    //from the center of the camera screen is taken as a percentage and multiplied
    //by the adjusted size (from your perspective) of the xy plane 
    //the ball resides in. 1.33 is used in mouse_adjX to account for the ratio
    //of the screen length to the screen width's effect on perspective adjustment.
    float pers_adj = 0.5*(800-ball_pos.z);
    float mouse_adjX = ((x-600)/600)*pers_adj*1.33;
    float mouse_adjY = ((y-450)/450)*pers_adj;

    //checks if the ball is ever out of bounds and resets it to the center
    //of the screen if it is.
    boolean x_touch = (x+mouse_adjX) > (ball_pos.x-(ball.getSize()*z_mod)) & (x+mouse_adjX) < (ball_pos.x+(ball.getSize()*z_mod));
    boolean y_touch = (y+mouse_adjY) > (ball_pos.y-(ball.getSize()*z_mod)) & (y+mouse_adjY) < (ball_pos.y+(ball.getSize()*z_mod));
    if (x_touch && y_touch){
      ball.setDragged(true);
      ball.freeze();
    }
  }
}

boolean activate;
//pressing the left button initializes the process that would apply force,
//which is why ori_set is reset by copying start at this step and why
//init is set to true, so that the next time the mouseDragged function is entered,
//it can record a new ori_set. Finally, trace is activated if the right mouse button
//was clicked before, allowing force vectors to be applied to the ball.
void mouseReleased(){
  if (mouseButton == LEFT){
    init = true;
    ori_set = start.copy();
    //click_count = 0;
    ball.unfreeze();
    ball.setDragged(false);
    if (activate){
      trace = true;
      activate = false;
    }
  }
}

boolean trace;
int app_duration = 0;
//activate is used to trigger application of force upon release of the ball,
//but only if the mouse has been clicked on the right mouse button, which
//ratchets up the force. 
void mouseClicked(){
  if (mouseButton == RIGHT){
    activate = true;
    app_duration += 5;
  }
}

float x_displace, y_displace, z_displace;
PVector ori_set;
void mouseDragged(){
  // why doesn't this work???
  //if (mousePressed & mouseButton == RIGHT){
  //  activate = true;
  //}
  if (ball.getDragged()){
    set.x = ball.getPos().x; set.y = ball.getPos().y; set.z = ball.getPos().z;

    //this is the same adjustment for perspective that is used in mousePressed.
    float y = mouseY;
    float x = mouseX;
    float pers_adj = 0.5*(800-set.z);
    float mouse_adjX = ((x-600)/600)*pers_adj*1.33;
    float mouse_adjY = ((y-450)/450)*pers_adj;
    x += mouse_adjX;
    y += mouse_adjY;
    
    //this code is necessary to prevent when initially moving the ball
    if (init){
      x_displace = 0;
      y_displace = 0;
      //init = false;
    } else{
      x_displace = x - prev_set.x;
      y_displace = y - prev_set.y;
    }
    
    //this calculates the z-displacement of the ball while dragging it, based
    //on the x and y displacements.
    set.x = x;
    set.y = y;
    if (y_displace < 0){
      float step_1 = (float) Math.pow(x_displace,2);
      float step_2 = (float) Math.pow(y_displace, 2)*0.5;
      set.z -= (float)Math.pow(step_1+step_2, 0.5);
    } else {
      float step_1 = (float) Math.pow(x_displace,2);
      float step_2 = (float) Math.pow(y_displace, 2);
      set.z += (float)Math.pow(step_1+step_2, 0.5);
    }
    ball.setPos(set);
    
    //in order to trigger out of bounds reset of the ball properly, a boolean
    //called is_dragged in the ball object is used to enter the code in mouseDragged.
    prev_set.x = x; prev_set.y = y; prev_set.z = set.z;
    if (ball.checkOOBX() || ball.checkOOBY() || ball.checkOOBZ()){
      ball.setDragged(false);
      ball.setPos(start);
      init = true;
    }
    
    if (init){
      init = false;
      ori_set = prev_set.copy();
    }
  }
}

void drawBackground(){
  blendMode(MULTIPLY);
  background(#698093);
  beginShape();
  fill(100);
  vertex(0,0,0);
  vertex(1200,0,0);
  vertex(1200,900,0);
  vertex(0,900,0);
  endShape(CLOSE);
  beginShape();
  fill(150);
  vertex(0,0,0);
  vertex(0,0,800);
  vertex(0,900,800);
  vertex(0,900,0);
  endShape(CLOSE);
  beginShape();
  fill(150);
  vertex(1200,0,0);
  vertex(1200,0,800);
  vertex(1200,900,800);
  vertex(1200,900,0);
  endShape(CLOSE);
  beginShape();
  fill(200);
  vertex(0,0,0);
  vertex(0,0,800);
  vertex(1200,0,800);
  vertex(1200,0,0);
  endShape(CLOSE);
  beginShape();
  fill(200);
  vertex(0,900,0);
  vertex(0,900,800);
  vertex(1200,900,800);
  vertex(1200,900,0);
  endShape(CLOSE);
  blendMode(BLEND);
}
