PShape pac;
float[] OOB = {-500,500};

fluid_object[] solutes = new fluid_object[160];
RBC[] R = new RBC[7];
//float[] locations = new
RBC[] colliders_1 = new RBC[19];
RBC[] colliders_2 = new RBC[19];
RBC[] colliders_3 = new RBC[19];
RBC[] colliders_4 = new RBC[19];
alligator[] hunters = new alligator[7];

void setup(){
  shapeMode(CENTER);
  pac = loadShape("pacman-svgrepo-com.svg");
  size(1300,350);
  int[] bounds = {80,190};
  
  //R_placeholder = new RBC(0,bounds,0,place,0);
  //placeholder = new alligator(0, bounds, 0, place, 0, R_placeholder);

  for (int i=0; i<=159; i++){
    float randY = (float)(110*Math.random());
    float randX = (float)(1300*Math.random());
    float[] location = {randX, randY+80};
    
    solutes[i] = new fluid_object(3, bounds, 6, location);
  }
  for (int i=0; i<=18; i++){
    float randY = (float)(110*Math.random());
    float randX = (float)(i*60*Math.random());
    float[] location = {randX, randY+80};
    
    int rot_rand = (int)(10*Math.random());
    int rot = (int)(constrain(rot_rand,0,8));
    colliders_1[i] = new RBC(1, bounds, 30, location, rot);
  }
  for (int i=0; i<=18; i++){
    int randY = (int)(110*Math.random());
    int randX = (int)(1300-((i*50)*Math.random()));
    float[] location = {randX, randY+80};
    
    int rot_rand = (int)(10*Math.random());
    int rot = (int)(constrain(rot_rand,0,8));
    colliders_2[i] = new RBC(1, bounds, 30, location, rot);
  }
  for (int i=0; i<=18; i++){
    int randY = (int)(110*Math.random());
    int randX = (int)(630-((i*40)*Math.random()));
    float[] location = {randX, randY+80};
    
    int rot_rand = (int)(10*Math.random());
    int rot = (int)(constrain(rot_rand,0,8));
    colliders_3[i] = new RBC(1, bounds, 30, location, rot);
  }
  for (int i=0; i<=18; i++){
    int randY = (int)(110*Math.random());
    int randX = (int)(1000-((i*50)*Math.random()));
    float[] location = {randX, randY+80};
    
    int rot_rand = (int)(10*Math.random());
    int rot = (int)(constrain(rot_rand,0,8));
    colliders_4[i] = new RBC(1, bounds, 30, location, rot);
  }
  for (int i=0; i<=6; i++){
    int randY = (int)(55*Math.random());
    float[] location = {i*200, randY+80};
    R[i] = new RBC(2,bounds,30,location,0);
    
    int Y = (int)(160-(40*Math.random()));
    float[] location_2 = {i*16, Y};
    hunters[i] = new alligator(1, bounds, 50, location_2, 4, R[i]);
    
    //OOB_keeper[i] = placeholder;
  }
  //colliders[0] = R1[0];
  //colliders[1] = r1;
  //a1 = new alligator(2, bounds, 50, location4, 1, colliders_1);
}

void animation_play(alligator a, float t){
  float[] loc = a.getLoc();
  pushMatrix();
  float lerpY = lerp(0, 5, t/6);
  translate(loc[0], loc[1]-lerpY);
  //float lerpS = lerp(1, 0, 0.5*(sin(t)+1));
  float lerpR = lerp(0,1,0.5*(sin(t)+1));
  scale(1, sin(1.5*t));
  rotate(PI/14*lerpR);
  fill(#C61818);
  ellipse(25, 0, 60, 25);
  fill(#860B0B);
  ellipse(25,0,30,12);
  a.display();
  popMatrix();
  
  if (t >= PI){
    a.play_animation_set(false);
    a.locSet(OOB);
    a.is_OOB_set(true);
    a.add_time(-t);
  }
}

void chase_anim(alligator a, boolean is_OOB_H, boolean is_OOB_T){
  if (!a.play_animation_get()){
    if (!is_OOB_T){
      if (!is_OOB_H){
        a.move();
      } else {
        a.getRBC().respawner(1300);
        if ((int)(1800*Math.random()%1700) == 0){
          float[] spawnpoint = {0,(float)(90*Math.random())};
          a.locSet(spawnpoint);
          a.is_OOB_set(false);
      }
      }
      a.getRBC().move();
    }
  } else{
    animation_play(a, a.get_time());
    a.add_time(0.05);
  }
  
  if (a.collision()){
    a.getRBC().locSet(OOB);
    a.getRBC().is_OOB_set(true);
    a.play_animation_set(true);
  }
}

void collision_detection(RBC[] colliders){
  for (int e = 0; e < 18; e++){
    for(int j = 0; j < 18; j++){
      if (e != j){
        colliders[e].collision(colliders[j]);
      }
    }
  }
}

void draw(){
  background(#D8473F);
  beginShape();
  fill(#A72019);
  vertex(0,0);
  vertex(0,80);
  vertex(1400,80);
  vertex(1400,0);
  endShape(CLOSE);
  
  beginShape();
  fill(#A72019);
  vertex(0,190);
  vertex(1300,190);
  vertex(1300,290);
  vertex(0,290);
  endShape();

  collision_detection(colliders_1);
  collision_detection(colliders_2);
  collision_detection(colliders_3);
  collision_detection(colliders_4);

  for (int i=0; i<=159; i++){
    solutes[i].move();
    solutes[i].respawner(1300);
  }
  for (int i=0; i<=18; i++){
    colliders_1[i].move();
    colliders_2[i].move();
    colliders_3[i].move();
    colliders_4[i].move();
    colliders_1[i].respawner(1300);
    colliders_2[i].respawner(1300);
    colliders_3[i].respawner(1300);
    colliders_4[i].respawner(1300);
  }
  for (int i=0; i<=6; i++){
      chase_anim(hunters[i], hunters[i].is_OOB_get(), hunters[i].getRBC().is_OOB_get());
      if (((int)(100*Math.random())%99 == 0)&hunters[i].getRBC().is_OOB_get()){
        float[] spawnpoint = {0,(float)(90*Math.random())};
        hunters[i].getRBC().locSet(spawnpoint);
        hunters[i].getRBC().is_OOB_set(false);
        hunters[i].getRBC().respawner(1300);
      }
  }
  
  //String frames = String.valueOf(frameCount)+".jpg";
  saveFrame();
}
