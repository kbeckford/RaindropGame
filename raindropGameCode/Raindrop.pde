class Raindrop {
  PVector loc; //create a PVector for location of velocity
  PVector vel;
  float acc=.08; //initalize and define variables
  float diam=30;
  

  Raindrop(float x, float y) {
    //initialize all starting values
    loc = new PVector(x, y);
    vel = new PVector(0, .5);
  }

  void display() {
    //display your raindrop
    fill(128, 213, 204,300);
    ellipse(loc.x, loc.y, diam, diam);
 
  }

  void fall() { 
    //make the raindrop fall, add acceleraltion to the velocity
    vel.y += acc;
    loc.add(vel);
  }

  void reset() {
    //return the raindrop back to the top of the screen at a random location.
    loc.set(random(width), 0);
    vel.set(0, .5);
    acc=.1;
  }

  boolean isInContactWith(Bucket b) {
    //if the mouse is inside of the bucket, the raindrop will return to the top
    if (loc.dist(b.loc) <= diam/2+b.diam/2) {
      return true;
    } else {
      return false;
    }
  }

}