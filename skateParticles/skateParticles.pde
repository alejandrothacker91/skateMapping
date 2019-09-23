float fps=30.0;

void settings() {
  setupLog();
  delay(100);
  loadConfig();
  
  size(640, 480, P3D);
  //frameRate(fps);
}

void setup() {
  //size(640, 480, P3D);
  colorMode(HSB, 360, 255, 255, 255);
  frameRate(fps);
  setupRS();
  setupPS();
}
void draw() {
  drawRS();
  println(frameRate+"  "+ps.particles.size());
  /*
  for (int i=0; i<10; i++) {
   
   gOrigin.x=int(random(0, width-1));
   gOrigin.y=int(random(0, height-1));
   
   ps.addParticle();
   }
   */
  /*
  for (int i=0; i<10; i++) {
   
   //gOrigin.x=int(random(0, width-1));
   //gOrigin.y=int(random(0, height-1));
   
   ps.addParticle(int(random(0, width-1)), int(random(0, height-1)));
   }
   */
  ps.run();
}


void mousePressed() {
  //systems.add(new ParticleSystem(1, new PVector(mouseX, mouseY)));
  //systems.remove(0);
}
