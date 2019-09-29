import ch.bildspur.realsense.*;

RealSenseCamera camera = new RealSenseCamera(this);

PImage depthStream;
PImage depthCrop;
PImage error;

boolean camReady=false;

int camResX=640;
int camResY=480;
int camFPS=30;
boolean depStream=true;
boolean colStream=false;
int minDepth=500;
int maxDepth=3000;

int minThresh=50;
int depThresh=1500;

int cropX1=0;
int cropY1=0;
int cropX2=0;
int cropY2=0;

PImage currFrame;

void setupRS()
{
  // width, height, fps, depth-stream, color-stream
  //camera.start(640, 480, 30, true, false);
  error=loadImage("errorX.png");
  depthStream=error;
  consOut("Searching for RealSense camera.");
  if (camera.isCameraAvailable()) {
    consOut("Camera detected.");
    consOut("Attempting to start RealSense camera.");
    camera.start(camResX, camResY, camFPS, depStream, colStream);
    if (camera.isRunning()) {
      consOut("RealSense camera started.");
      camReady=true;
    } else {
      depthStream=error;
      camReady=false;
      consOut("Unable to start RealSense camera.");
    }
  } else {
    depthStream=error;
    camReady=false;
    consOut("Camera NOT detected.");
  }

  scaleX=poolX/camResX;//1080
  scaleY=poolY/camResY;//1080
}
int biasX=0;
int biasY=135;

//float scaleX=1.68750f;//1080
//float scaleY=1.68750f;//810
float scaleX=1.0;
float scaleY=1.0;

int deadX=9;

int partJump=10;

void drawDepth() {
  camera.readFrames();
  //fill(255);
  for (int i=0; i<camResX; i+=partJump) {
    for (int j=0; j<camResY; j+=partJump) {
      if (i>deadX) {
        int currDepth=camera.getDepth(i, j);

        if ((currDepth>1000)&&(currDepth<1500)) {
          fill(backHue, backSat, backBri, backAlfa);
        } else {
          fill(partHue, partSat, partBri, partAlfa);
        }

        //fill(map(currDepth, 0, 5000, 0, 255));
        ellipse(biasX+i*scaleX, biasY+j*scaleY, partSize, partSize);
      }//only values out of the dead pixels zone
    }
  }
}
float scalaX=2.890f;

void fetchDepth() {
  if (camReady) {
    camera.readFrames();
    camera.createDepthImage(minDepth, maxDepth);
    depthStream=camera.getDepthImage();
    //imageMode(CORNER);
    //image(depthStream, 0, 0);
  } else {
  }
}

void cropDepth() {
  depthCrop=depthStream.get(cropX1, cropY1, cropX2-cropX1, cropY2-cropY1);
}

void showDepth0() {
  camera.readFrames();
  camera.createDepthImage(2000, 2400);
  image(camera.getDepthImage(), -1179, -966, poolX*scalaX, poolY*scalaX);
  filter(THRESHOLD, 0.20f);
  //filter(INVERT);
}

void fillSpaces() {
  for (int i=partJump/2; i<poolX; i+=partJump*scaleX) {
    for (int j=partJump/2; j<poolY; j+=partJump*scaleY) {
      if (j<(biasY-partJump)) {
        //fill(0, 255, 255, 255);
        fill(partHue, partSat, partBri, partAlfa);
        ellipse(i, j, partSize, partSize);
      }
      if (j>=(biasY-partJump)+camResY*scaleY) {
        //fill(0, 255, 255, 255);
        fill(partHue, partSat, partBri, partAlfa);
        ellipse(i, j, partSize, partSize);
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
  //dep2Part(10);

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
