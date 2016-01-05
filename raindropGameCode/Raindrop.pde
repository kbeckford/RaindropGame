class Raindrop {
  PVector loc;
  PVector vel;
  float acc=.08;
  float diam=30;
  //add new arraylist to replace a usual array-delcare and initalize the array list
  

  Raindrop(float x, float y) {
    //initialize all starting values
    loc = new PVector(x, y);
    vel = new PVector(0, .5);
  }

  void display() {
    //display your raindrop
    fill(0, 153, 204);
    ellipse(loc.x, loc.y, diam, diam);
 
  }

  void fall() { 
    //make the raindrop fall, add acceleraltion to the velocity
    vel.y += acc;
    loc.add(vel);
  }

  void reset() {
    //return the raindrop back to the top of the scren at a random location.
    loc.set(random(width), 0);
    vel.set(0, .5);
    acc=.1;
  }

  boolean isInContactWith(PVector other) {
    //if the mouse is inside of the circle, the raindrop will return to the top
    if (loc.dist(other) <= diam/2) {
      return true;
    } else {
      return false;
    }
  }

  //void score(PVector other) {
   // if (loc.dist(other) <= diam/2) {
      //sc=sc+1;
    //}
  //}
}