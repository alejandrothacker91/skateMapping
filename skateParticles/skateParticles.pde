float fps=60.0;
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

boolean performance=true;

void settings() {
  setupLog();
  loadConfig();
  fullWin();
}

void showCoords() {
  //poolX=1+mouseX;
  //poolY=1+mouseY;
  if (frameCount%30==0) {
    println("Mouse X: "+mouseX);
    println("Mouse Y: "+mouseY);
    println(frameRate);
  }
}

void mousePressed() {
  //currTestCard++;
  //deLog(inf, loga, "Program finished on purpose.");
  //exit();
  //systems.add(new ParticleSystem(1, new PVector(mouseX, mouseY)));
  //systems.remove(0);
}

int lowResJump;
int lowResRadius;

boolean lowResFlag=false;
boolean lowResDepthFlag=false;

void runLowRes() {
  if (lowResFlag) {
    loadPixels();
    noStroke();
    fill(0, int(!lowResDepthFlag)*255);
    rect(0, 0, poolX, poolY);
    for (int i=0; i<poolX; i+=lowResJump) {
      for (int j=0; j<poolY; j+=lowResJump) {
        int loc = i + j*width;

        int locRed = (pixels [loc] >> 16) & 0xFF;
        if (locRed>128) {
          fill(255, 255);
          ellipse(i, j, lowResRadius, lowResRadius);
        }
      }
    }
    //updatePixels();
  }
}


//keys--


void keyPressed () {
  if (key == 'C') {
    calibrate = calibrate ? false : true;
    consOut("Toggled calibrate to: "+calibrate);
  } else if (key == 'T') {
    testFlag = testFlag ? false : true;
    consOut("Toggled testcard to: "+testFlag);
  } else if (key == 'L') {
    threshFlag = threshFlag ? false : true;
    consOut("Toggled threshold to: "+threshFlag);
  } else if (key == 'B') {
    blurFlag = blurFlag ? false : true;
    consOut("Toggled blur to: "+blurFlag);
  }
}

void keyPressed0() {
  if (key == 't') {
    //action, then console message
    currTestCard++;
    consOut("Toggle test card: "+currTestCard%maxCards);
  } else if (key=='d') {
    currPoolMode++;
    consOut("Toggle pool mode: "+currPoolMode+" - "+poolMod);
    //consOut("Toggle pool mode: "+currPoolMode+" - ");
  } else if (key=='P') {
    performance = performance ? false : true;
    consOut("Toggled performance mode to: "+performance);
  } else if (key=='p') {
    showPool = showPool ? false : true;
    consOut("Show pool: "+showPool);
  } else if (key=='E') {
    consOut("Exit on purpose.");
    exit();
  } else if (key=='S') {
    consOut("Set particles.");
    //setParticles();
  } else if (key=='L') {
    lowResFlag = lowResFlag ? false : true;
    consOut("Toggled lowRes to: "+lowResFlag);
  } else if (key=='l') {
    lowResDepthFlag = lowResDepthFlag ? false : true;
    consOut("Show depth on lowRes: "+lowResDepthFlag);
  }
}


//ONLY SETUP AND DRAW
void setup() {
  colorMode(HSB, 360, 255, 255, 255);
  frameRate(fps);
  setWin();
  setupGUI();
  setupRS();
  setupTest();
  setupParties();
}
void draw() {
  background(0);
  fetchDepth();
  cropDepth();
  //showTest(currTestCard);
  showPool();
  runLowRes();

  drawParties();
  showCalib();
  showTestcard();
  //always at end:
  runGUI();
}
