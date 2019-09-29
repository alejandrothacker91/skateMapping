import controlP5.*;
ControlP5 cp5;
int myColor = color(0, 0, 0);

Knob myKnobA;
Range range;

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
    .setRange(0, camResX-1)
    .setValue(120)
    .setPosition(guiStartX+13*pad, guiStartY)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;


  myKnobA = cp5.addKnob("cropY1")
    .setRange(0, camResY-1)
    .setValue(24)
    .setPosition(guiStartX+18*pad, guiStartY)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;

  myKnobA = cp5.addKnob("cropX2")
    .setRange(0, camResX-1)
    .setValue(313)
    .setPosition(guiStartX+24*pad, guiStartY)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;

  myKnobA = cp5.addKnob("cropY2")
    .setRange(0, camResY-1)
    .setValue(206)
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
    .setRange(minDepth, maxDepth)
    .setRangeValues(1490, 1520)
    // after the initialization we turn broadcast back on again
    .setBroadcast(true)
    .setColorForeground(color(255, 40))
    .setColorBackground(color(255, 40))  
    ;

  //--POST CROP

  myKnobA = cp5.addKnob("postCropX1")
    .setRange(0, poolX-2)
    .setValue(100)
    .setPosition(guiStartX+13*pad, guiStartY+9*pad)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;

  myKnobA = cp5.addKnob("postCropY1")
    .setRange(0, poolY-2)
    .setValue(100)
    .setPosition(guiStartX+18*pad, guiStartY+9*pad)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;

  myKnobA = cp5.addKnob("postCropX2")
    .setRange(0, poolX)
    .setValue(200)
    .setPosition(guiStartX+24*pad, guiStartY+9*pad)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;

  myKnobA = cp5.addKnob("postCropY2")
    .setRange(0, poolY)
    .setValue(200)
    .setPosition(guiStartX+29*pad, guiStartY+9*pad)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;

  //blur+thresh
  myKnobA = cp5.addKnob("postCropBlur")
    .setRange(0.0f, 12.0f)
    .setValue(0.0f)
    .setPosition(guiStartX+13*pad, guiStartY+15*pad)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;

  myKnobA = cp5.addKnob("postCropThresh")
    .setRange(0.0f, 1.0f)
    .setValue(0.0f)
    .setPosition(guiStartX+18*pad, guiStartY+15*pad)
    .setRadius(40)
    .setDragDirection(Knob.VERTICAL)
    ;
  //end of setup
}

void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.isFrom("rangeController")) {
    // min and max values are stored in an array.
    // access this array with controller().arrayValue().
    // min is at index 0, max is at index 1.
    minDepth = int(theControlEvent.getController().getArrayValue(0));
    maxDepth = int(theControlEvent.getController().getArrayValue(1));
    println("range update, done.");
  }
}
