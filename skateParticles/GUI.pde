import at.mukprojects.console.*;
Console console;
boolean showConsole=true;

int guiX=1080;
int pad=20;

int consoleW=1920-1080;
float consoleY=(1080/4)*3.0;

PImage redCross;
boolean showPool=true;

void setupGUI() {
  redCross=loadImage("cursor20.png");
  //setupConsole();
}
void setupConsole() {
  console = new Console(this);
  console.start();
}

void consOut(String input) {
  println(input);
}
void runGUI() {
  drawPool();
  //drawConsole();

  //always at end
  drawCursor();
}
void drawConsole() {
  rectMode(CORNER);
  stroke(255);
  console.draw(1100, 0, 600, 300);
  //  console.draw(guiX+pad, consoleY, 800, 300, 16, 14, 2, 0, color(220), color(0), color(255));
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
