float fps=30.0;
boolean fullScr=false;
int displayNum=0;
int windowX=100;
int windowY=100;
int viewportX=100;
int viewportY=100;
int activeX=100;
int activeY=100;
int partSize=15;


void settings() {
  setupLog();
  loadConfig();
  fullScreen(1);
  //size(640, 480, P3D);
  //frameRate(fps);
}

void setup() {
  //size(640, 480, P3D);
  colorMode(HSB, 360, 255, 255, 255);
  frameRate(fps);

  //setupRS();
  //setupPS();
}
void draw() {
  background(0);
  fill(255);
  ellipse(mouseX, mouseY, 100, 100);
  //drawRS();
  //println(frameRate+"  "+ps.particles.size());
  //ps.run();
}


void mousePressed() {
  //systems.add(new ParticleSystem(1, new PVector(mouseX, mouseY)));
  //systems.remove(0);
}
