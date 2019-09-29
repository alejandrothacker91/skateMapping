//cp5:

//Println console;

//console:
import at.mukprojects.console.*;
Console console;
boolean showConsole;

int showOnPool=0;

int guiStartX=1090;
int guiStartY=260;
int pad=20;

int consoleW=1920-1080;
float consoleY=(1080/4)*3.0;

PImage redCross;
boolean showPool=true;

//---------------------
void setupGUI() {
  redCross=loadImage("cursor20.png");
  setupConsole();
  setupP5();
}

void runGUI() {
  drawPoolBorder();
  drawConsole();
  drawSignals();
  if (frameCount%50==0) {
    consOut("FPS: "+frameRate+"-Mouse: "+mouseX+","+mouseY);
  }
  //always at end
  drawCursor();
}
//--------------------


void setupConsole() {
  console = new Console(this);
  // Start the console
  console.start();
  showConsole = true;
}



void consOut(String input) {
  println(input);
}
void drawConsole() {  // Draw the console to the screen.
  console.draw(guiStartX, height-200, width, height, 22, 20, 4, 4, color(128), color(30), color(255));

  showConsole = true;
  // Print the console to the system out.
  console.print();
}

void drawCursor() {
  if (performance) {
    noCursor();
  } else {
    imageMode(CENTER);
    image(redCross, mouseX, mouseY);
    imageMode(CORNER);
  }
}

void drawPoolBorder() { 
  if (performance) {
  } else {
    if (showPool) {
      fill(0, 0);
      stroke(0, 255, 255, 255);
      strokeWeight(1);
      rect(0, 0, poolX, poolY);
      strokeWeight(1);
    }
  }
}

int currPoolMode=3;
int poolModes=4;
String poolMod="";
void showPool() {
  if (performance) {
    //consOut("PERFORMANCE MODE");
  } else {
    currPoolMode=currPoolMode%poolModes;
    imageMode(CORNERS);
    switch(currPoolMode) {
    case 0:
      poolMod="DEPTH";
      break;
    case 1:
      depthOnPool();
      poolMod="DEPTH CROP";
      break;
    case 2:
      depthCropOnPool();
      poolMod="POST-CROP";
      break;
    case 3:
      postCropOnPool();
      poolMod="NO DEPTH SHOWN";
      break;
    case 4:
      poolMod="E";
      //postCropOnPool();
      break;
    default:
      break;
    }
    imageMode(CORNER);
  }
}

float depthScale=1.0f;

int depthBiasX=0;
int depthBiasY=0;

void depthOnPool() {
  imageMode(CORNER);
  float scale=poolX/depthStream.width;
  image(depthStream, depthBiasX, depthBiasY, depthStream.width*depthScale, depthStream.height*depthScale);
}

void depthCropOnPool() {
  imageMode(CORNER);
  //image(depthCrop, pinCropX1, pinCropY1, pinCropX2, pinCropY2);
  image(depthCrop, 0, 0);
}
void postCropOnPool() {
  imageMode(CORNERS);
  //image(depthCrop, pinCropX1, pinCropY1, pinCropX2, pinCropY2);
  image(postCrop, postCropX1, postCropY1, postCropX2, postCropY2);
}

int postCropX1=400;
int postCropY1=400;
int postCropX2=600;
int postCropY2=600;

void drawSignals() {
  imageMode(CORNER);
  image(depthStream, guiStartX, 0, camResX, camResY);
}
