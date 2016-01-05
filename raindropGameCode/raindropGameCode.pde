PVector mouse;   //declare a P
int count=10; 
ArrayList <Raindrop> raindrops =new ArrayList<Raindrop>(); //create an Array list for the
Bucket b;
int sc=0; //delcare and italize variable for scoring 

String time="60";
int t;
int interval=60;


void setup() {
  size(1200, 800);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  //r = new Raindrop(random(width), 0);   //Initialize r. The parameters used are the initial x and y position
  for(int i=0; i <count; i++){
   raindrops.add(new Raindrop(random(width),random(-height,0))); 
  }
  b = new Bucket(100);
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
  text("Time Remaining:", 530, 730);
  fill(255, 0, 0);
  textSize(45);
  text(t, 625, 730);
  
  t = interval-int(millis()/1000);
  time = nf(t , 3);

  b.update();
  b.display();

  for(int i=0;i<count;i++){
    Raindrop r=raindrops.get(i);
    r.fall();                             //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    r.display();                         //display the raindrop
    if (r.isInContactWith(b)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      r.reset(); //if it is, reset the raindrop
      sc=sc+1;  //if the catcher catches a raindrop, the score increases by one
    }
    if (r.loc.y > height + r.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      r.reset();                           //if it does, reset the raindrop
      sc=sc-1; //if the raindrop hits the bottom of the screen, the score decreases by one
    }
  }
}