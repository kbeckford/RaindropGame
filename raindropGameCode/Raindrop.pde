class Raindrop {
  PVector loc;
  PVector vel;
  float acc=.1;
  float diam=30;
  //PImage raindrop;

  Raindrop(float x, float y) {
    //initialize all starting values
    loc = new PVector(x, y);
    vel = new PVector(0, .5);
  }

  void display() {
    //display your raindrop
    background(0);
    ellipse(loc.x, loc.y, diam, diam);
    fill(204, 243, 255);
   // raindrop=loadImage("raindrop.png");
  }

  void fall() { 
    //make the raindrop fall
    vel.y += acc;
    loc.add(vel);
  }

  void reset() {
    //return the raindrop back to the top of the screen
    //loc.set
    //vel.set
   // acc
  }

    boolean isInContactWith(PVector other) {
    if (loc.dist(other) <= diam/2) {
      return true;
    } else {
      return false;
    }
  }
}