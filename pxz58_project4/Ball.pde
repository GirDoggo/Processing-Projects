class Ball{
  PVector vel, pos, acc, drag, weight;
  float size, mass;
  color c;
  float dt = 0.01;
  PVector stor, app;
  boolean prev_OOB_X, prev_OOB_Y, prev_OOB_Z;
  int duration = 0;
  boolean freeze, is_dragged;
  
  Ball(){
    this.vel = new PVector(0,0,0);
    this.pos = new PVector(600,450,00);
    this.acc = new PVector(0,0,0);
    this.size = 50;
    this.c = #ff0000;
    this.mass = 5;
    this.drag = new PVector(0,0,0);
    this.weight = new PVector(0,grav_acc*mass,0);
    this.stor = new PVector(0,0,0);
    this.app = new PVector(0,0,0);
  }
  
  Ball(PVector pos){
    this.pos = pos;
    this.vel = new PVector(0,0,0);
    this.acc = new PVector(0,0,0);
    this.size = 30;
    this.c = #ff0000;
    this.mass = 5;
    this.drag = new PVector(0,0,0);
    this.weight = new PVector(0,grav_acc*mass,0);
    this.stor = new PVector(0,0,0);
    this.app = new PVector(0,0,0);
  }
  
  void setDuration(int d){
    duration = d;
  }
  
  boolean getDragged(){
    return is_dragged;
  }
  
  void setDragged(boolean d){
    is_dragged = d;
  }
  
  void setPos(PVector loc){
    this.pos.x = loc.x; this.pos.y = loc.y; this.pos.z = loc.z;
  }
  
  float getSize(){
    return this.size;
  }
  
  void freeze(){
    freeze = true;
    this.vel.mult(0);
    this.acc.mult(0);
  }
  
  void unfreeze(){
    freeze = false;
  }
  
  PVector getPos(){
    return this.pos;
  }
  
  void setApp(PVector a){
    app = a;
  }
  
  void applyForce(PVector force){
    stor.x = (force.x/this.mass)*(dt);
    stor.y = (force.y/this.mass)*(dt);
    stor.z = (force.z/this.mass)*dt;
    acc.add(stor);
  }
  
  void progress(){
    if (freeze){
      this.display();
      return;
    }
    this.applyDrag();
    this.applyGravity();
    this.collision();
    //simulates the impulse of any given force, which can be increased by increments
    //of 5 by the user by right clicking their mouse.
    if (duration > 0){
      this.applyForce(app);
      duration -= 1;
    } else {
      this.app.mult(0);
    }

    vel.add(acc);
    pos.add(vel);
    
    this.display();
    this.acc.mult(0);
  }
  
  void applyDrag(){
    drag.x = vel.x*(-1*friction);
    drag.y = vel.y*(-1*friction);
    drag.z = vel.z*(-1*friction);
    this.applyForce(drag);
  }
  
  void applyGravity(){
    this.applyForce(this.weight);
  }
  
  boolean checkOOBX(){
    return (pos.x > boundsX[1] || pos.x < boundsX[0]);
  }

  boolean checkOOBY(){
    return (pos.y > boundsY[1] || pos.y < boundsY[0]);
  }

  boolean checkOOBZ(){
    return (pos.z > boundsZ[1] || pos.z < boundsZ[0]);
  }
  
  void collision(){
    boolean OOB_X = pos.x > boundsX[1]-this.size/2 || pos.x < boundsX[0]+this.size/2;
    boolean OOB_Y = pos.y > boundsY[1]-this.size/2 || pos.y < boundsY[0]+this.size/2;
    boolean OOB_Z = pos.z > boundsZ[1]-this.size/2 || pos.z < boundsZ[0]+this.size/2;
    
    if (OOB_X){
      this.vel.x = -this.vel.x;
      this.acc.x = 0;

      if (prev_OOB_X){
        this.acc.x = 0;
        this.vel.x = 0;
      }
    }
    if (OOB_Y){
      this.vel.y = -this.vel.y;

      if (prev_OOB_Y){
        this.acc.y = 0;
        this.vel.y = 0;
      }
    }
    if (OOB_Z){
      this.vel.z = -this.vel.z;
      this.acc.x = 0;
      
      if (prev_OOB_Z){
        this.acc.z = 0;
        this.vel.z = 0;
      }
    }
    
    prev_OOB_X = OOB_X;
    prev_OOB_Y = OOB_Y;
    prev_OOB_Z = OOB_Z;
  }
  
  void display(){
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    fill(255);
    sphere(size);
    popMatrix();
  }
}
