PImage testCard;
PImage blackShark;
PImage whiteShark;

void setupTest() {
  testCard=loadImage("testCard.png");
  blackShark=loadImage("blackShark.bmp");
  whiteShark=loadImage("whiteShark.bmp");
}
int currTestCard=0;
void showTest(int input) {
  input=input%4;
  imageMode(CORNERS);
  switch(input) {
  case 0:
    break;
  case 1:
    image(testCard, 0, 0, poolX, poolX);
    break;
  case 2:
    image(blackShark, 0, 0, poolX, poolX);
    break;
  case 3:
    image(whiteShark, 0, 0, poolX, poolX);
    break;
  default:
    break;
  }
  imageMode(CORNER);
}
