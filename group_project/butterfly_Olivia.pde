class Butterfly{
  
  PVector p1;
  PVector p2;
  PVector p3;
  PVector p4;
  PVector p5;
  PVector p6;
  PVector p7;
  PVector p8;
  PVector p9;
  color c;
  float flapTime;
  float flapSpeed;
  PVector vel;
  PVector accel;
  
  Butterfly(color[] colors){
    int i = int(random(0, 8));
    this.c = colors[i];
    this.flapTime = 0.0;
    this.flapSpeed = 10.0;
    this.p1 = new PVector(200, 350);
    this.p2 = new PVector(this.p1.x + 20, this.p1.y - 50);
    this.p3 = new PVector(this.p1.x - 20, this.p1.y - 40);
    this.p4 = new PVector(this.p1.x - 30, this.p1.y - 25);
    this.p5 = new PVector(this.p1.x - 40, this.p1.y - 10);
    this.p6 = new PVector(this.p1.x + 20, this.p1.y + 50);
    this.p7 = new PVector(this.p1.x - 20, this.p1.y + 40);
    this.p8 = new PVector(this.p1.x - 30, this.p1.y + 25);
    this.p9 = new PVector(this.p1.x - 40, this.p1.y + 10);
    this.vel = new PVector(0, -5);
    this.accel = new PVector(0, 0.125);
  }
  
  void butterflyFall(){
    PVector delta = this.vel.add(this.accel);
    this.vel = this.vel.add(this.accel);
    this.p1 = this.p1.add(delta);
    this.p2 = this.p2.add(delta);
    this.p3 = this.p3.add(delta);
    this.p4 = this.p4.add(delta);
    this.p5 = this.p5.add(delta);
    this.p6 = this.p6.add(delta);
    this.p7 = this.p7.add(delta);
    this.p8 = this.p8.add(delta);
    this.p9 = this.p9.add(delta);
  }
  
  void wingFlap(){
    float ctrl = .5*(sin(this.flapTime*this.flapSpeed+1)+1);
    float ctrl2 = .5*(sin(this.flapTime*this.flapSpeed)+1);
    float ogy2 = this.p1.y + 50;
    float ogy3 = this.p1.y + 40;
    float ogy4 = this.p1.y + 25;
    float ogy5 = this.p1.y + 10;
    this.p6.y = lerp(ogy2, this.p2.y, ctrl);
    this.p7.y = lerp(ogy3, this.p3.y, ctrl);
    this.p8.y = lerp(ogy4, this.p4.y, ctrl2);
    this.p9.y = lerp(ogy5, this.p5.y, ctrl2);

    this.flapTime += 0.01;
  }
  
  void resetFlap(){
    this.flapTime = 0.0;
    this.vel = new PVector(0, -5);
  }
  
  void display(){
    //noStroke();
    fill(this.c); 
    triangle(this.p1.x, this.p1.y, this.p6.x, this.p6.y, this.p7.x, this.p7.y);
    triangle(this.p1.x, this.p1.y, this.p8.x, this.p8.y, this.p9.x, this.p9.y);
  }
  
  PVector getPos() {
    return this.p1;
  }

  boolean isOffscreen() {
    //add collided function
    if (this.p1.y <= 0 || this.p1.y >= 700) {
      return true;
    }
    return false;
  }
  
  boolean hit_ground() {
    //add collided function
    if (this.p1.y >= 700) {
      return true;
    }
    return false;
  }
  

  float[] get_hitbox() {
    
    float[] h_min_max = {this.p9.y, this.p8.y, this.p6.y, this.p1.y};
    h_min_max = sort(h_min_max);
    float x = this.p9.x;
    float y = h_min_max[0];
    float w = abs(this.p9.x - this.p6.x);
    float h = abs(h_min_max[3] - h_min_max[0]);
    float[] hit_box = {x+w/2, y+(h/2), w, h-4};
    
    /*
    // Displaying hitbox and specific points
    stroke(color(255, 0, 0));
    strokeWeight(5);
    
    point(this.p1.x, this.p1.y);  //CENTER OF BUTTERFLY
    point(this.p7.x, this.p7.y);
    point(this.p6.x, this.p6.y);  //FRONT WING MAX Y & MAX X
    point(this.p8.x, this.p8.y);  //BACK WING MAX Y
    point(this.p9.x, this.p9.y);  //BACK WING MAX X
    
    //point(x+w/2, y+h/2);  //Center Point of sphere
    
    stroke(0);
    strokeWeight(1);
    */
    
    return hit_box;
  }
}
