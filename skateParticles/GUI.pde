PImage redCross;
void setupGUI() {
  redCross=loadImage("cursor20.png");
}

void consOut(String input) {
  println(input);
}
void runGUI() {
  drawCursor();
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
