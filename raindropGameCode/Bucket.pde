class Bucket {
  PVector loc; //create a PVector for location
  int diam; //initialize variable

  Bucket(int d) { //constructor
    //initialize starting values
    diam=d; 
    loc = new PVector(); 
  }

  void display() {
    //display the bucket
    fill(0);
    ellipse(loc.x, loc.y, diam,diam);
  }
  
  void update(){
    //update the bucket's location to move with the mouse
   loc.set(mouseX,mouseY); 
  }
}