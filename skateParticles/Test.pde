PImage testCard;
PImage blackShark;
PImage whiteShark;
int maxCards=4;//n+1 because of modulo
int currTestCard=2;
boolean testFlag=false;

void setupTest() {
  testCard=loadImage("testCard.png");
  blackShark=loadImage("blackShark.bmp");
  whiteShark=loadImage("whiteShark.bmp");
}

void showTestcard() {
  if (testFlag) {
    imageMode(CORNERS);
    image(blackShark, 0, 0, poolX, poolY);
    imageMode(CORNER);
  }
}

void showTest0(int input) {
  if (performance) {
    //consOut("PERFORMANCE MODE");
  } else {
    input=input%maxCards;
    imageMode(CORNERS);
    switch(input) {
    case 0:
      break;
    case 1:
      image(testCard, 0, 0, poolX, poolY);
      break;
    case 2:
      image(blackShark, 0, 0, poolX, poolY);
      break;
    case 3:
      image(whiteShark, 0, 0, poolX, poolY);
      break;
    default:
      break;
    }
    imageMode(CORNER);
  }
}
