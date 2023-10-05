class stationary_Butterfly{
  
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
  float fallTime;
  float flapTime;
  float fallSpeed;
  float flapSpeed;
  
  stationary_Butterfly(color c){
    //int i = int(random(0, 8));
    //this.c = colors[i];
    //this.fallTime = 0.0;
    //this.flapTime = 0.0;
    //this.fallSpeed = 5.0;
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
    this.c = c;
  }
  
  color get_c(){
    return this.c;
  }
  
  //void butterflyFall(){
  //  float ctrl = .01*(this.fallTime);
  //  float ogy1 = this.p1.y;
  //  float ogy2 = this.p2.y;
  //  float ogy3 = this.p3.y;
  //  float ogy4 = this.p4.y;
  //  float ogy5 = this.p5.y;
  //  float ogy6 = this.p6.y;
  //  float ogy7 = this.p7.y;
  //  float ogy8 = this.p8.y;
  //  float ogy9 = this.p9.y;
  //  this.p1.y = lerp(ogy1, 700, ctrl) + this.fallSpeed;
  //  this.p2.y = lerp(ogy2, 700 + 20, ctrl) + this.fallSpeed;
  //  this.p3.y = lerp(ogy3, 700 - 20, ctrl) + this.fallSpeed;
  //  this.p4.y = lerp(ogy4, 700 - 30, ctrl) + this.fallSpeed;
  //  this.p5.y = lerp(ogy5, 700 - 40, ctrl) + this.fallSpeed;
  //  this.p6.y = lerp(ogy6, 700 + 20, ctrl) + this.fallSpeed;
  //  this.p7.y = lerp(ogy7, 700 - 20, ctrl) + this.fallSpeed;
  //  this.p8.y = lerp(ogy8, 700 - 30, ctrl) + this.fallSpeed;
  //  this.p9.y = lerp(ogy9, 700 - 40, ctrl) + this.fallSpeed;
  //}
  
  void wingFlap(){
    float ctrl = .5*(sin(this.flapTime*this.flapSpeed+1)+1);
    float ctrl2 = .5*(sin(this.flapTime*this.flapSpeed)+1);
    float ogy2 = this.p1.y - 50;
    float ogy3 = this.p1.y - 40;
    float ogy4 = this.p1.y - 25;
    float ogy5 = this.p1.y - 10;
    this.p2.y = lerp(ogy2, this.p6.y, ctrl);
    this.p3.y = lerp(ogy3, this.p7.y, ctrl);
    this.p4.y = lerp(ogy4, this.p8.y, ctrl2);
    this.p5.y = lerp(ogy5, this.p9.y, ctrl2);

    this.flapTime += 0.01;
  }
  
  void resetFlap(){
    this.flapTime = 0.0;
  }
  
  void butterflyFly(){
    float ctrl = -.01*(this.fallTime);
    this.p1.y = lerp(this.p1.y, this.p1.y - 700, ctrl);
    this.p2.y = lerp(this.p2.y, this.p2.y - 700, ctrl);
    this.p3.y = lerp(this.p3.y, this.p3.y - 700, ctrl);
    this.p4.y = lerp(this.p4.y, this.p4.y - 700, ctrl);
    this.p5.y = lerp(this.p5.y, this.p5.y - 700, ctrl);
    this.p6.y = lerp(this.p6.y, this.p6.y - 700, ctrl);
    this.p7.y = lerp(this.p7.y, this.p7.y - 700, ctrl);
    this.p8.y = lerp(this.p8.y, this.p8.y - 700, ctrl);
    this.p9.y = lerp(this.p9.y, this.p9.y - 700, ctrl);
    
    //this.fallTime -= 0.01;
  }
  
  void display(){
    noStroke();
    fill(this.c);
    triangle(this.p1.x, this.p1.y, this.p2.x, this.p2.y, this.p3.x, this.p3.y);
    triangle(this.p1.x, this.p1.y, this.p4.x, this.p4.y, this.p5.x, this.p5.y);
  } 
}
