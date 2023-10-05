//https://www.youtube.com/watch?v=c8sc_w-g3-A&t=524s
class Timer {
  float time;
  
  Timer(float set) {
    this.time = set;
  }
  
  float get_time() {
    return this.time;
  }
  
  void countUp() {
    this.time += 1/frameRate;
  }
  
}
