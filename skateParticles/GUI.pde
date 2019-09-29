PImage redCross;
boolean showPool=true;

void setupGUI() {
  redCross=loadImage("cursor20.png");
}

void consOut(String input) {
  println(input);
}
void runGUI() {
  drawCursor();
  drawPool();
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
