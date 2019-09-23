// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

ParticleSystem ps;

PVector gOrigin = new PVector(0, 0);

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticle(int px, int py) {
    //particles.add(new Particle(gOrigin));
    particles.add(new Particle(px, py));
  }

  void run() {
    int count=0;
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
        count++;
        //exit();
        //println("X");
      }
    }
    println("KILLED:  "+count);
  }
}

void setupPS() {
  ps = new ParticleSystem(new PVector(100.0f, 100.0f));
}
