XML config;

boolean loadConfig() {

  config = loadXML("config.xml");

  if (config!=null) {


    performance=boolean(config.getInt("performance", 0));

    fps=config.getFloat("fps", 30.0);

    fullScr=boolean(config.getInt("fullscreen", 0));

    displayNum=config.getInt("displayNum", 0);

    windowX=config.getInt("windowX", 200);
    windowY=config.getInt("windowY", 100);

    viewportX=config.getInt("viewportX", 100);
    viewportY=config.getInt("viewportY", 100);

    poolX=config.getInt("poolX", 1080);
    poolY=config.getInt("poolY", 1080);

    partSize=config.getInt("partSize", 15);

    backHue=config.getInt("backHue", 15);
    backSat=config.getInt("backSat", 15);
    backBri=config.getInt("backBri", 15);
    backAlfa=config.getInt("backAlfa", 15);

    partHue=config.getInt("partHue", 15);
    partSat=config.getInt("partSat", 15);
    partBri=config.getInt("partBri", 15);
    partAlfa=config.getInt("partAlfa", 15);

    camResX=config.getInt("camResX", 640);
    camResY=config.getInt("camResY", 480);

    camFPS=config.getInt("camFPS", 30);

    minDepth=config.getInt("minDepth", 1000);
    maxDepth=config.getInt("maxDepth", 3000);

    setMinDepth=config.getInt("setMinDepth", 1000);
    setMaxDepth=config.getInt("setMaxDepth", 3000);
    //crop
    cropX1=config.getInt("cropX1", 100);
    cropY1=config.getInt("cropY1", 100);

    cropX2=config.getInt("cropX2", 0);
    cropY2=config.getInt("cropY2", 0);
    //depth corners
    depthX1=config.getInt("depthX1", 0);
    depthY1=config.getInt("depthY1", 0);

    depthX2=config.getInt("depthX2", 200);
    depthY2=config.getInt("depthY2", 200);

    calibrate=boolean(config.getInt("calibrate", 0));
    testFlag=boolean(config.getInt("testFlag", 0));
    threshFlag=boolean(config.getInt("threshFlag", 0));
    blurFlag=boolean(config.getInt("blurFlag", 0));

    currTestCard=config.getInt("currTestCard", 1);


    lowResJump=config.getInt("lowResJump", 50);
    lowResRadius=config.getInt("lowResRadius", 50);

    //end capture
    //start delog
    deLog(inf, cona, "config.xml file loaded.");

    deLog(inf, cona, "FPS: "+fps);
    deLog(inf, cona, "Fullscreen value: "+fullScr);

    deLog(inf, cona, "Selected display: "+displayNum);

    deLog(inf, cona, "Window width: "+windowX);
    deLog(inf, cona, "Window height: "+windowY);

    deLog(inf, cona, "Background HSBA: "+backHue+" , "+backSat+" , "+backBri+" , "+backAlfa);
    deLog(inf, cona, "Particles HSBA: "+partHue+" , "+partSat+" , "+partBri+" , "+partAlfa);

    deLog(inf, cona, "RealSense width: "+camResX);
    deLog(inf, cona, "RealSense height: "+camResY);
    deLog(inf, cona, "RealSense FPS: "+camFPS);

    return false;
  } else {
    deLog(err, cona, "Unable to load -config.xml- file. Program can't run without this. Please check documentation.");
    return true;
  }//end else
}

void fullWin() {  
  if (fullScr) {
    fullScreen(P3D, displayNum);
    deLog(inf, cona, "Fullscreen surface created on display "+displayNum);
  } else {
    size(windowX, windowY, P3D);
    deLog(inf, cona, "Window created with size: "+windowX+" , "+windowY);
  }
}

void setWin() {
  if (!fullScr) {
    surface.setLocation(viewportX, viewportY);
    surface.setResizable(false);
    surface.setTitle("SkateParticles by Voxel - FPS: "+fps);
    surface.setAlwaysOnTop(true);

    deLog(inf, cona, "Window placed on viewport: "+viewportX+" , "+viewportY);
  } else {
    deLog(inf, cona, "Fullscreen surface has size: "+width+" , "+height);
  }
}
