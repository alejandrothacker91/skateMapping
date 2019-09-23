/**
 * Multiple Particle Systems
 * by Daniel Shiffman.
 *
 * Click the mouse to generate a burst of particles
 * at mouse position.
 *
 * Each burst is one instance of a particle system
 * with Particles and CrazyParticles (a subclass of Particle)
 * Note use of Inheritance and Polymorphism here.
 */
void settings() {
  setupLog();


  size(640, 480, P3D);
  //exitFlag=loadConfig();
  //exitFlag=loadZone();
  //setWindow();
  //partSettings();
  //smooth(0);// now on setup GUI
}

void setup() {
  //size(640, 480, P3D);
  colorMode(HSB, 360, 255, 255, 255);
  frameRate(30);
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
