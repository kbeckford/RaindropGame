class Raindrop {
  PVector loc;
  PVector vel;
  float acc=.2;
  float diam=30;

  Raindrop(float x, float y) {
    //initialize all starting values
    loc = new PVector(x, y);
    vel = new PVector(0, .5);
  }

  void display() {
    //display your raindrop
    background(0);
    ellipse(loc.x,loc.y, diam, diam);
    fill(204, 243, 255);
  }

  void fall() { 
    //display the raindrop
    vel.y += acc;
    loc.add(vel);
  }

boolean isInContactwith(){
  if(loc.dist(mouse) <= diam/2){
   return true;
  }else{
   return false; 
  }
}

}