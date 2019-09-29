import controlP5.*;
ControlP5 cp5;
Textarea myTextarea;
//Println console;

//console:
import at.mukprojects.console.*;
Console console;
boolean showConsole;

int guiStartX=1090;
int pad=20;

int consoleW=1920-1080;
float consoleY=(1080/4)*3.0;

PImage redCross;
boolean showPool=true;

//---------------------
void setupGUI() {
  redCross=loadImage("cursor20.png");
  setupConsole();
  //setupP5();
}

void runGUI() {
  drawPool();
  drawConsole();
  drawSignals();
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

void setupP5() {
  cp5 = new ControlP5(this);
  cp5.enableShortcuts(); 
  myTextarea = cp5.addTextarea("txt")
    .setPosition(1200, 700)
    .setSize(600, 300)
    .setFont(createFont("", 14))
    .setLineHeight(14)
    .setColor(color(255))
    .setColorBackground(color(0))
    .setColorForeground(color(255, 100));
  ;

  //console = cp5.addConsole(myTextarea);///
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

void drawPool() { 
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

void drawSignals() {
  imageMode(CORNER);
  image(depthStream, guiStartX, 0, camResX, camResY);
}
