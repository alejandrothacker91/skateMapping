XML config;

boolean loadConfig() {

  config = loadXML("config.xml");

  if (config!=null) {

    deLog(inf, cona, "config.xml file loaded.");

    //fullScr=boolean(config.getInt("fullscreen", 0));
    //deLog(inf, cona, "Fullscreen value: "+fullScr);

    fps=config.getFloat("fps", 30.0);
    deLog(inf, cona, "FPS: "+fps);

    //udpTargetIP=config.getString("targetIP", "255.255.255.255");
    //deLog(inf, cona, "UDP target IP address: "+udpTargetIP);

    return false;
  } else {
    deLog(err, cona, "Unable to load -config.xml- file. Program can't run without this. Please check documentation.");
    return true;
  }//end else
}
