// Particles, by Daniel Shiffman.

ArrayList<ParticleSystem> systems;
PImage sprite;  


int iMax=0;
int jMax=0;
int numSystems=0;
int jump=40;

void setupParticles() {
  //orientation(LANDSCAPE);
  sprite = loadImage("sprite.png");
  systems = new ArrayList<ParticleSystem>();

  hint(DISABLE_DEPTH_MASK);
}

void setParticles() {
  //orientation(LANDSCAPE);
  sprite = loadImage("sprite.png");
  systems = new ArrayList<ParticleSystem>();

  for (int i=0; i<poolX; i+=scanJump) {
    //println("i rows:  "+iMax);
    for (int j=0; j<poolY; j+=scanJump) {
      //jMax++;
      systems.add(new ParticleSystem(10, i, j));
      //fill(255);
      //ellipse(i, j, 10, 10);
    }
  }
  for (int i=0; i<width; i+=jump) {
    iMax++;
  }
  for (int j=0; j<height; j+=jump) {
    jMax++;
  }

  println("i rows:  "+iMax);
  println("j columns:  "+jMax);
  println("Total systems:  "+systems.size());
} 
void runPartsij() {
  for (int i=0; i<iMax; i++) {
    for (int j=0; j<jMax; j++) {
      ParticleSystem curr=systems.get(i+j*iMax);
      curr.update();
      curr.display();
    }
  }
}
void runParts() {
  for (ParticleSystem ps : systems) {
    ps.update();
    ps.display();
  }
}
void drawParticles() {
  background(0);

  /*

   for (ParticleSystem ps : systems) {
   ps.update();
   ps.display();
   }
   
   
   */

  for (int i=0; i<iMax; i++) {
    for (int j=0; j<jMax; j++) {
      ParticleSystem curr=systems.get(i+j*iMax);
      if (i*jump>mouseX) {
        curr.emmitFlag=false;
      } else {
        curr.emmitFlag=true;
      }
    }
  }

  for (int i=0; i<iMax; i++) {
    for (int j=0; j<jMax; j++) {
      ParticleSystem curr=systems.get(i+j*iMax);
      curr.update();
      curr.display();
    }
  }

  fill(255);
  textSize(16);
  //text("Frame rate: " + int(frameRate)+"  Particles:  "+ps.particles.size(), 10, 20);
}
