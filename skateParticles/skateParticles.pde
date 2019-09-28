float fps=30.0;
boolean fullScr=false;
int displayNum=0;
int windowX=100;
int windowY=100;
int viewportX=100;
int viewportY=100;
int poolX=100;
int poolY=100;
int partSize=15;

int backHue=0;
int backSat=255;
int backBri=255;
int backAlfa=255;

int partHue=180;
int partSat=255;
int partBri=255;
int partAlfa=255;


void settings() {
  setupLog();
  loadConfig();
  fullWin();
}

void setup() {
  //size(640, 480, P3D);
  colorMode(HSB, 360, 255, 255, 255);
  frameRate(fps);
  setWin();
  setupRS();
  //setupPS();
}
void draw() {
  //background(backHue, backSat, backBri, backAlfa);
  background(partHue, partSat, partBri, partAlfa);
  noStroke();
  fill(255);
  ellipse(mouseX, mouseY, 10, 10);
  drawDepth();
  //fillSpaces();
  fill(0, 0);
  stroke(255);
  rect(0, 0, poolX, poolY);
}


void mousePressed() {
  deLog(inf, loga, "Program finished on purpose.");
  exit();
  //systems.add(new ParticleSystem(1, new PVector(mouseX, mouseY)));
  //systems.remove(0);
}
