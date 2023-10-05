class menu_text{
  float x, y;
  String stuff;
  float counter = 0;
  int size = 60;
  boolean adj_jig = false;
  boolean jig = false;
  float jig_counter = 0;
  
  menu_text(float x, float y, String stuff){
    this.x = x;
    this.y = y;
    this.stuff = stuff;
  }
  
  boolean get_adj(){
    return adj_jig;
  }
  
  void set_adj(boolean adj){
    this.adj_jig = adj;
  }
  
  void set_jig(boolean j){
    this.jig = j;
  }
  
  void set_counter(float c){
    this.counter = c;
  }
  
  void set_size(int s){
    this.size = s;
  }
  
  void set_string(String n){
    this.stuff = n;
  }
  
  void menu_animation(){
    if (this.jig){
      float lerpJig = lerp(0,20,0.5*(cos(PI/2.5*(jig_counter))+1));
      //println(lerpJig);
      pushMatrix();
      translate(0,lerpJig-50);
      this.display();
      popMatrix();
      jig_counter += 0.2;
      //jig_counter = 0.5*(cos(PI/3*(jig_counter))+1);
      if (jig_counter >= 5){
        jig_counter = 0;
        this.adj_jig = true;
      }
    } else{
    float lerpY = lerp(0, 50, counter);
    pushMatrix();
    translate(0,-lerpY);
    this.display();
    popMatrix();
    counter += 0.05;
    counter = constrain(counter, 0, 1);}
  }
  
  void display(){
    textSize(this.size);
    text(stuff, x, y);
  }
}
