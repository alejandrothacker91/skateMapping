import controlP5.*;
ControlP5 cp5;
int myColor = color(0, 0, 0);

Knob myKnobA;

Range range;
Range rangeDX;
Range rangeDY;

Textlabel myTextlabelA;
Textlabel myTextlabelB;
Textlabel myTextlabelC;

void setupP5() {  
  noStroke();
  cp5 = new ControlP5(this);

  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  /*
  cp5.addSlider("depthScale")
   .setPosition(guiStartX, guiStartY)
   .setRange(1.0f, 3.0f)
   .setSize(16, 240)
   ;
   */
  myKnobA = cp5.addKnob("depthScale")
    .setRange(0.0010f, 3.0f)
    .setValue(1.50f)
    .setPosition(guiStartX+pad, guiStartY)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;

  myKnobA = cp5.addKnob("cropX1")
    .setRange(0, poolX)
    .setValue(config.getInt("cropX1", 0))
    .setPosition(guiStartX+13*pad, guiStartY)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;


  myKnobA = cp5.addKnob("cropY1")
    .setRange(0, poolY)
    .setValue(config.getInt("cropY1", 0))
    .setPosition(guiStartX+18*pad, guiStartY)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;

  myKnobA = cp5.addKnob("cropX2")
    .setRange(0, camResX-1)
    .setValue(config.getInt("cropX2", 0))
    .setPosition(guiStartX+24*pad, guiStartY)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;

  myKnobA = cp5.addKnob("cropY2")
    .setRange(0, camResY-1)
    .setValue(config.getInt("cropY2", 0))
    .setPosition(guiStartX+29*pad, guiStartY)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;

  cp5.addNumberbox("depthBiasX")
    .setPosition(guiStartX+6*pad, guiStartY+pad)
    .setSize(2*pad, pad)
    .setScrollSensitivity(1.1)
    .setValue(0)
    ;

  cp5.addNumberbox("depthBiasY")
    .setPosition(guiStartX+10*pad, guiStartY+pad)
    .setSize(2*pad, pad)
    .setScrollSensitivity(1.1)
    .setValue(0)
    ;

  range = cp5.addRange("rangeController")
    // disable broadcasting since setRange and setRangeValues will trigger an event
    .setBroadcast(false) 
    .setPosition(guiStartX, guiStartY+6*pad)
    .setSize(800, 40)
    .setHandleSize(20)
    //.setRange(setMinDepth, setMaxDepth)
    //.setRangeValues(minDepth, maxDepth)
    .setRange(minDepth, maxDepth)
    .setRangeValues(setMinDepth, setMaxDepth)
    // after the initialization we turn broadcast back on again
    .setBroadcast(true)
    .setColorForeground(color(255, 40))
    .setColorBackground(color(255, 40))  
    ;


  //--POST CROP

  myKnobA = cp5.addKnob("postCropX1")
    .setRange(0, poolX-2)
    .setValue(config.getInt("postCropX1", 0))
    .setPosition(guiStartX+13*pad, guiStartY+9*pad)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;

  myKnobA = cp5.addKnob("postCropY1")
    .setRange(0, poolY-2)
    .setValue(config.getInt("postCropY1", 0))
    .setPosition(guiStartX+18*pad, guiStartY+9*pad)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;

  myKnobA = cp5.addKnob("postCropX2")
    .setRange(0, poolX)
    .setValue(config.getInt("postCropX2", 1080))
    .setPosition(guiStartX+24*pad, guiStartY+9*pad)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;

  myKnobA = cp5.addKnob("postCropY2")
    .setRange(0, poolY)
    .setValue(config.getInt("postCropY2", 1080))
    .setPosition(guiStartX+29*pad, guiStartY+9*pad)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;

  //blur+thresh
  myKnobA = cp5.addKnob("postCropBlur")
    .setRange(0.0f, 12.0f)
    .setValue(config.getFloat("postCropBlur", 0.0f))
    .setPosition(guiStartX+13*pad, guiStartY+15*pad)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;

  myKnobA = cp5.addKnob("postCropThresh")
    .setRange(0.0f, 1.0f)
    .setValue(config.getFloat("postCropThresh", 0.60f))
    .setPosition(guiStartX+18*pad, guiStartY+15*pad)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;

  //txt labels
  myTextlabelA = cp5.addTextlabel("frmRt")
    .setText("FPS:  "+nf(frameRate, 2, 2))
    .setPosition(guiStartX, guiStartY+28*pad)
    .setColorValue(0xffffff00)
    .setFont(createFont("Arial", 20))
    ;

  myTextlabelB = cp5.addTextlabel("cursorPos")
    .setText("Cursor: ("+mouseX+","+mouseY+")")
    .setPosition(guiStartX+6*pad, guiStartY+28*pad)
    .setColorValue(color(255))
    .setFont(createFont("Arial", 20))
    ;


  myTextlabelC = cp5.addTextlabel("cursorRGB")
    .setText("RGB: ("+cursorRed+","+cursorGreen+","+cursorBlue+")")
    .setPosition(guiStartX+16*pad, guiStartY+28*pad)
    .setColorValue(color(255))
    .setFont(createFont("Arial", 20))
    ;

  //x and y ranges:

  rangeDX = cp5.addRange("rangeDepthX")
    // disable broadcasting since setRange and setRangeValues will trigger an event
    .setBroadcast(false) 
    .setPosition(guiStartX, guiStartY+19*pad)
    .setSize(800, 40)
    .setHandleSize(20)
    //.setRange(setMinDepth, setMaxDepth)
    //.setRangeValues(minDepth, maxDepth)
    .setRange(-1620, 2700)
    .setRangeValues(440, 640)
    // after the initialization we turn broadcast back on again
    .setBroadcast(true)
    .setColorForeground(color(255, 40))
    .setColorBackground(color(255, 40))  
    ;  

  rangeDY = cp5.addRange("rangeDepthY")
    // disable broadcasting since setRange and setRangeValues will trigger an event
    .setBroadcast(false) 
    .setPosition(guiStartX, guiStartY+23*pad)
    .setSize(800, 40)
    .setHandleSize(20)
    //.setRange(setMinDepth, setMaxDepth)
    //.setRangeValues(minDepth, maxDepth)
    .setRange(-1620, 2700)
    .setRangeValues(440, 640)
    // after the initialization we turn broadcast back on again
    .setBroadcast(true)
    .setColorForeground(color(255, 40))
    .setColorBackground(color(255, 40))  
    ;

  //end of setup
}

int cursorRed=0;
int cursorGreen=0;
int cursorBlue=0;

void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.isFrom("rangeController")) {
    // min and max values are stored in an array.
    // access this array with controller().arrayValue().
    // min is at index 0, max is at index 1.
    setMinDepth = int(theControlEvent.getController().getArrayValue(0));
    setMaxDepth = int(theControlEvent.getController().getArrayValue(1));
    println("Depth input update.");
  } else  if (theControlEvent.isFrom("rangeDepthX")) {
    // min and max values are stored in an array.
    // access this array with controller().arrayValue().
    // min is at index 0, max is at index 1.
    depthX1 = int(theControlEvent.getController().getArrayValue(0));
    depthX2 = int(theControlEvent.getController().getArrayValue(1));
    println("Depth X range is now: "+depthX1+" to "+depthX2);
  } else  if (theControlEvent.isFrom("rangeDepthY")) {
    // min and max values are stored in an array.
    // access this array with controller().arrayValue().
    // min is at index 0, max is at index 1.
    depthY1 = int(theControlEvent.getController().getArrayValue(0));
    depthY2 = int(theControlEvent.getController().getArrayValue(1));
    println("Depth Y range is now: "+depthY1+" to "+depthY2);
  }
}

void updateCP5() {
  getCursorRGB();
  myTextlabelA.setText("FPS:  "+nf(frameRate, 2, 2));
  myTextlabelB.setText("Cursor: ("+mouseX+","+mouseY+")");
  myTextlabelC.setText("RGB: ("+cursorRed+","+cursorGreen+","+cursorBlue+")");
}

void getCursorRGB() {
  color currCol=get(mouseX, mouseY);

  cursorRed = (currCol >> 16) & 0xFF;
  cursorGreen = (currCol >> 8) & 0xFF;
  cursorBlue = currCol  & 0xFF;
}
