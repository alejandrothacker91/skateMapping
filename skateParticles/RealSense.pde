import ch.bildspur.realsense.*;

RealSenseCamera camera = new RealSenseCamera(this);

int camResX=640;
int camResY=480;
int camFPS=30;
boolean depStream=true;
boolean colStream=false;
int minDepth=0;
int maxDepth=3000;

int minThresh=50;
int depThresh=1500;

PImage currFrame;

void setupRS()
{
  // width, height, fps, depth-stream, color-stream
  //camera.start(640, 480, 30, true, false);
  camera.start(camResX, camResY, camFPS, depStream, colStream);
}
int biasX=0;
int biasY=135;

float scaleX=1.68750f;//1080
float scaleY=1.68750f;//810

int deadX=9;

void drawDepth() {
  camera.readFrames();
  //fill(255);
  for (int i=0; i<camResX; i+=10) {
    for (int j=0; j<camResY; j+=10) {
      if (i>deadX) {

        //systems.add(new ParticleSystem(1, new PVector(i, j)));
        int currDepth=camera.getDepth(i, j);
        fill(map(currDepth, 0, 5000, 0, 255));
        ellipse(biasX+i*scaleX, biasY+j*scaleY, 5, 5);
      }
    }
  }
}
void drawRS()
{
  background(0);

  // read frames
  camera.readFrames();

  // create grayscale image form depth buffer
  // min and max depth
  //--
  camera.createDepthImage(minDepth, maxDepth);
  //currFrame=camera.getDepthImage();

  //currFrame.filter(BLUR, 2.0f);

  // show color image
  //image(camera.getDepthImage(), 0, 0);

  //colorMode(RGB, 255, 255, 255, 255);
  //image(camera.getColorImage(), 0, 0);

  //colorMode(HSB, 360, 255, 255, 255);
  //--
  dep2Part(10);

  //image(currFrame, 0, 0);
  //println(frameRate);
}

void walkDepth(int jump) {
  for (int i=jump; i<width; i+=jump) {
    for (int j=jump; j<height; j+=jump) {
      //systems.add(new ParticleSystem(1, new PVector(i, j)));
      if (camera.getDepth(i, j)<depThresh) {
        noStroke();
        fill(255, 0, 0, 255);
        ellipse(i, j, 10, 10);
        //println("TRIGGERED AT  "+i+"  ,  "+j);
      }
    }
  }
}

void dep2Part(int jump) {
  for (int i=0; i<width; i+=jump) {
    for (int j=0; j<height; j+=jump) {
      //systems.add(new ParticleSystem(1, new PVector(i, j)));
      int currDepth=camera.getDepth(i, j);
      if ((currDepth<depThresh)&&(currDepth>minThresh)) {
        //noStroke();
        //fill(255, 0, 0, 255);
        //ellipse(i, j, 10, 10);

        ps.addParticle(i, j);
        //println("TRIGGERED AT  "+i+"  ,  "+j);
      }
    }
  }
}
