import at.mukprojects.console.*;
Console console;
boolean showConsole=true;

int guiX=1080;
float consoleY=(1080/4)*3.0;

PImage redCross;
boolean showPool=true;

void setupGUI() {
  redCross=loadImage("cursor20.png");
  setupConsole();
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
  drawConsole();
  
  //always at end
  drawCursor();
}
void drawConsole() {
  console.draw(guiX, consoleY, width, height, 16, 14, 2, 0, color(220), color(0), color(255));
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
