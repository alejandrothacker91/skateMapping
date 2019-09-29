PImage testCard;
PImage blackShark;
PImage whiteShark;
int maxCards=4;//n+1 because of modulo

void setupTest() {
  testCard=loadImage("testCard.png");
  blackShark=loadImage("blackShark.bmp");
  whiteShark=loadImage("whiteShark.bmp");
}
int currTestCard=0;
void showTest(int input) {
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
