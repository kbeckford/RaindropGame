class Bucket {
  PVector loc;
  int diam;

  Bucket(int d) {
    diam=d;
    loc = new PVector();
  }

  void display() {
    fill(0);
    ellipse(loc.x, loc.y, diam,diam);
  }
  
  void update(){
   loc.set(mouseX,mouseY); 
  }
}