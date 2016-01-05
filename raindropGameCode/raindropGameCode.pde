PVector mouse;   //declare a P
int count=10; 

ArrayList <Raindrop> raindrops =new ArrayList<Raindrop>(); //create an Array list for the
Raindrop[] r=new Raindrop[count];      //declare a new Raindrop called r
Bucket b;

int sc=0; //delcare and italize variable for scoring 
int time=100;


void setup() {
  size(1200, 800);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  r[i] = new Raindrop(random(width), 0);   //Initialize r. The parameters used are the initial x and y position
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

  //create a timer
  fill(255);
  textSize(15);
  textAlign(CENTER);
  text("Time:", 550, 730);
  fill(255, 0, 0);
  textSize(45);
  text(time, 620, 730);

  b.display();

  for (int i=0; i> count; i++) {
    r[i].fall();                             //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    r[i].display();                         //display the raindrop
    if (r[i].isInContactWith(mouse)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      r[i].reset(); //if it is, reset the raindrop
      sc=sc+1;  //if the catcher catches a raindrop, the score increases by one
    }
    if (r[i].loc.y > height + r.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      r[i].reset();                           //if it does, reset the raindrop
      sc=sc-1; //if the raindrop hits the bottom of the screen, the score decreases by one
    }
  }
}