PVector mouse;   //declare a P
ArrayList <Raindrop> raindrops =new ArrayList<Raindrop>(); //create an Array list for the
int count=10; 

Bucket b;
PImage dogbowl;
PImage petshop;

int sc=0; //delcare and italize variable for scoring 
String time="32";
int t;
int interval=32;

void setup() {
  size(1200, 800);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  //r = new Raindrop(random(width), 0);   //Initialize r. The parameters used are the initial x and y position
  for (int i=0; i <count; i++) {
    raindrops.add(new Raindrop(random(width), random(-height, 0)));
  }
  b = new Bucket(100);

  petshop=loadImage("petshop.jpg");
  dogbowl= loadImage("dogbowl.png");
  dogbowl.resize(160, 100);
  imageMode(CENTER);
}



  void draw() { 
    mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
   // background(0);
    //image(petshop,width/2,height/2);

    //create a welcome screen
    noStroke();
    fill(255);
    rect(0, 0, 1200, 800);
    fill(0, 202, 204);
    rect(300, 250, 600, 250);
    fill(255);
    textAlign(CENTER);
    textSize(45);
    text("PUPPIES ARE THIRSTY!", 600, 350);
    textSize(30);
    text("fill up their water bowls before", 600, 400);
    text("time runs out!", 600,430);
    
    if(t<=30){
      background(0);
    image(petshop,width/2,height/2);
    }


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
    text("Time Remaining:", 550, 730);
    fill(255, 0, 0);
    textSize(45);
    text(t, 645, 730);

    t = interval-int(millis()/1000);
    time = nf(t, 3);

    b.update();
    b.display();

    for (int i=0; i<count; i++) {
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
    image(dogbowl, mouseX, mouseY);

    if(t<=0) {
      count=0;
      noStroke();
      fill(255);
      rect(0, 0, 1200, 800);
      fill(0, 202, 204);
      rect(300, 250, 600, 250);
      fill(255);
      textAlign(CENTER);
      textSize(55);
      text("GAME OVER!", 600, 350);
    }
  }