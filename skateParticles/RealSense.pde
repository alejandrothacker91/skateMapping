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

void setupRS() {
  // width, height, fps, depth-stream, color-stream
  //camera.start(640, 480, 30, true, false);
  camera.start(camResX, camResY, camFPS, depStream, colStream);
}

int biasX=0;
int biasY=135;

float scaleX=1.68750f;//1080
float scaleY=1.68750f;//810

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
          avoids.add(new Avoid(biasX+i*scaleX, biasY+j*scaleY));
        } else {
          fill(partHue, partSat, partBri, partAlfa);
        }

        //fill(map(currDepth, 0, 5000, 0, 255));
        ellipse(biasX+i*scaleX, biasY+j*scaleY, partSize, partSize);
      }//only values out of the dead pixels zone
    }
  }
}
