class Raindrop {
  PVector loc;
  PVector vel;
  float acc=.08;
  float diam=30;
  int sc=0;
  //PImage raindrop;

  Raindrop(float x, float y) {
    //initialize all starting values
    loc = new PVector(x, y);
    vel = new PVector(0, .5);
  }

  void display() {
    //display your raindrop
    background(0);
    fill(0, 153, 204,150);
    ellipse(loc.x, loc.y, diam, diam);
    // raindrop=loadImage("raindrop.png");

    //create a scoreboard
    fill(255);
    rect(1050, 720, 150, 80);
    fill(0);
    textSize(15);
    textAlign(CENTER);
    text("Score:", 1080, 765);
    textSize(35);
    text(sc, 1130,765);
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

  void score(PVector other) {
    if (loc.dist(other) <= diam/2) {
      sc=sc+1;
    }
  }
}