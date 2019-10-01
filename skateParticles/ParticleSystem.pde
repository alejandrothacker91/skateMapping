class ParticleSystem {
  ArrayList<Particle> particles;

  PShape particleShape;
  int emX;
  int emY;
  boolean emmitFlag=true;

  ParticleSystem(int n) {
    particles = new ArrayList<Particle>();
    particleShape = createShape(PShape.GROUP);

    for (int i = 0; i < n; i++) {
      Particle p = new Particle();
      particles.add(p);
      particleShape.addChild(p.getShape());
    }
  }

  ParticleSystem(int n, int inX, int inY) {
    particles = new ArrayList<Particle>();
    particleShape = createShape(PShape.GROUP);

    for (int i = 0; i < n; i++) {
      Particle p = new Particle();
      particles.add(p);
      particleShape.addChild(p.getShape());
    }
    emX=inX;
    emY=inY;
  }

  void update() {
    for (Particle p : particles) {
      p.update();
    }
  }


  void setEmitter() {
    for (Particle p : particles) {
      if (p.isDead()) {
        if (emmitFlag) {
          p.rebirth(emX, emY);
        }
      }
    }
  }

  void spawn() {
    for (Particle p : particles) {
      if (p.isDead()) {
        p.rebirth(emX, emY);
      }
    }
  }

  void setEmmitFlag(boolean input) {
    emmitFlag=input;
  }

  void display0() {
    shape(particleShape);
    if ((emX<mouseX)&&(emY<mouseY)) {
      spawn();
    }
  }  
  void display() {
    shape(particleShape);
    if (emmitFlag) {
      spawn();
    }
  }
}
