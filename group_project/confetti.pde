//https://processing.org/examples/simpleparticlesystem.html

class Confetti {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float gravity;
  PShape f;
  int size;
  
  PShape flower1;
  PShape flower2;
  PShape flower3;
  PShape flower4;
  PShape flower5;

  Confetti(PVector l) {
    //Confetti
    flower1 = loadShape("cherry-blossom-spring-svgrepo-com.svg");
    flower2 = loadShape("flower2-svgrepo-com.svg");
    flower3 = loadShape("daffodil-svgrepo-com.svg");
    flower4 = loadShape("jonquil-svgrepo-com.svg");
    flower5 = loadShape("nymphea-svgrepo-com.svg");
    
    this.acceleration = new PVector(0, 0.05);
    this.velocity = new PVector(random(-3, 3), random(-5, 0));
    this.position = l.copy();
    int i = int(random(0, 5));
    if (i == 0) {
      this.f = flower1;
    } else if (i == 1) {
      this.f = flower2;
    } else if (i == 2) {
      this.f = flower3;
    } else if (i == 3) {
      this.f = flower4;
    } else {
      this.f = flower5;
    }
    this.size = int(random(10, 31));
    this.gravity = 0.05;
  }
  
  void setPos(PVector pos) {
    this.position = pos.copy();
  }
  
  void setPos(int x, int y) {
    this.position.x = x;
    this.position.y = y;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    this.velocity.add(this.acceleration);
    this.velocity.y += this.gravity;
    this.position.add(this.velocity);
  }

  // Method to display
  void display() {
    shapeMode(CENTER);
    shape(this.f, this.position.x, this.position.y, this.size, this.size);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (this.position.y > height + 30) {
      return true;
    } else {
      return false;
    }
  }
}
