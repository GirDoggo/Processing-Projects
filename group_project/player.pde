//want to rotate shape when "flies" how to do

class Player {

  PShape s;
  PVector vel;
  PVector accel;
  PVector pos;
  float size;

  Player(PShape shape) {
    this.s = shape;
    this.vel = new PVector(0, -3);
    this.accel = new PVector(0, 0.1);
    this.pos = new PVector(200, 350);
    this.size = 30;
  }

  void playerFall() {
    PVector delta = this.vel.add(this.accel);
    this.vel = this.vel.add(this.accel);
    this.pos = this.pos.add(delta);
  }

  void playerFly() {
    this.vel = new PVector(0, -5);
  }

  void display() {
    shapeMode(CENTER);
    shape(this.s, this.pos.x, this.pos.y, this.size, this.size);
  }

  PVector getPos() {
    return this.pos;
  }

  boolean isOffscreen() {
    if (this.pos.y <= 0 || this.pos.y >= 700) {
      return true;
    }
    return false;
  }
}
