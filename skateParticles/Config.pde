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


    deLog(inf, cona, "config.xml file loaded.");
    
    deLog(inf, cona, "FPS: "+fps);
    deLog(inf, cona, "Fullscreen value: "+fullScr);
    
    deLog(inf, cona, "Selected display: "+displayNum);
    
    deLog(inf, cona, "Window width: "+windowX);
    deLog(inf, cona, "Window height: "+windowY);
    
    return false;
  } else {
    deLog(err, cona, "Unable to load -config.xml- file. Program can't run without this. Please check documentation.");
    return true;
  }//end else
}
