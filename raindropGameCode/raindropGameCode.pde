PVector mouse;   //declare a P

ArrayList <Raindrop> raindrops =new ArrayList<Raindrop>(); //create an Array list for the
Raindrop r;      //declare a new Raindrop called r
Bucket b;

int sc=0; //delcare and italize variable for scoring 




void setup() {
  size(1200, 800);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  r = new Raindrop(random(width), 0);   //Initialize r. The parameters used are the initial x and y position
  b = new Bucket(mouseX, mouseY);
}

void draw() { 
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  background(0);
  
  //create a scoreboard
  fill(255);
  textSize(15);
  textAlign(CENTER);
  text("Score:", 550, 765);
  textSize(45);
  text(sc, 610, 770);

  b.display();

  r.fall();                             //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
  r.display();                         //display the raindrop
  if (r.isInContactWith(mouse)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
    r.reset(); //if it is, reset the raindrop
    sc=sc+1;  //if the catcher catches a raindrop, the score increases by one
  }
  if (r.loc.y > height + r.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
    r.reset();                           //if it does, reset the raindrop
    sc=sc-1; //if the raindrop hits the bottom of the screen, the score decreases by one
  }
}