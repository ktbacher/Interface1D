
/* /////////////////////////////////////

  4.043 / 4.044 Design Studio: Advanced Interactions
  February  5, 2020
  Marcelo Coelho

  Note:
  - Don't forget to install gif library provided

*/ /////////////////////////////////////

import gifAnimation.*;                      // library for playing animated gifs

final static int displaySize = 30;          // how many pixels are visible in the game
final static int displayPixelSize = 20;     // how big should they look on screen


DisplayBuffer display = new DisplayBuffer(displaySize);    // aggregates our final visual output

Player playerOne = new Player(color(255,0,0), int(displaySize/4));             // Adding 2 players to the game
Player playerTwo = new Player(color(0,0,255), int(3*displaySize/4));

Target[] target1 = {new Target(color(255,0,250), int(displaySize/4)),};              // and one target for players to catch.
Target[] target2 = {new Target(color(0,255,255), int(3*displaySize/4)),};

Score score = new Score(color(0,0,0));   // Used to display winner's color                  
int scoreMax = 4;                        // Maximum number of points before game ends

Controller controller = new Controller();   // this is where the state machine and software logic lives
String gameState = "PLAY";

PImage[] animation;


int currentFrame = 0;
int appFramerate = 30;
int numFrames =  30;



void settings() {
  
  size((displaySize*displayPixelSize), displayPixelSize);    // dynamically sets canvas size

}


void setup() {
    
  frameRate(appFramerate);     //  important to lock the framerate, so animations are smooth
  
  animation = Gif.getPImages(this, "Animation.gif");
   
  startSerial();    // initiating the serial port so we can communicate with joystick
  
}


void draw() { 

   // Not used, but you might find helpful to count frames for animations or synchronization
   //currentFrame = (currentFrame+1) % numFrames; 
   //println(currentFrame);
  
    // Runs state machine at determined framerate
  	controller.update();
}
