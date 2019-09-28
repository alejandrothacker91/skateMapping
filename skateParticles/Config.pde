XML config;

boolean loadConfig() {

  config = loadXML("config.xml");

  if (config!=null) {
    fps=config.getFloat("fps", 30.0);

    fullScr=boolean(config.getInt("fullscreen", 0));

    displayNum=config.getInt("displayNum", 0);

    windowX=config.getInt("windowX", 200);
    windowY=config.getInt("windowY", 100);

    viewportX=config.getInt("viewportX", 100);
    viewportY=config.getInt("viewportY", 100);

    activeX=config.getInt("activeX", 100);
    activeY=config.getInt("activeY", 100);

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
