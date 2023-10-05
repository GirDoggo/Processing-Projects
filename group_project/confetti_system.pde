//https://processing.org/examples/simpleparticlesystem.html

class ConfettiSystem {
  //ArrayList<Confetti> confettis;
  Confetti[] confettis;
  PVector origin;

  ConfettiSystem(PVector position) {
    this.origin = position.copy();
    //this.confettis = new ArrayList<Confetti>();
    
    this.confettis = new Confetti[50];
    
    for (int i = 0; i < 50; i++) {
      //this.addConfetti();
      this.confettis[i] = (new Confetti(this.origin));
      //this.confettis[i].setPos(new PVector{-1000, -1000});
    }
  }
  
  void update_pos(PVector p) {
    for (int i = 0; i < 50; i++) {
      this.confettis[i].setPos(p);
    }
    this.origin = p;
  }
  
  /*
  void addConfetti() {
    this.confettis.add(new Confetti(this.origin));
  }
  */

  void run() {
    for (int i = this.confettis.length-1; i >= 0; i--) {
      Confetti c = this.confettis[i];
      c.run();
      if (c.isDead()) {
        c.setPos(-1000, -1000);
      }
    }
  }
}
