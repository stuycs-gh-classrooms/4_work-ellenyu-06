int movingX;
int movingY;
int radius;
void setup () {
  size (500,500);
  background (#d3b994);
  radius = width/10;
  movingX = radius;
  movingY = radius + (2 * radius);
  draw ();
}

void circleRow (int startX, int endX, int y, int d) {
  for (int x = startX; x <= endX; x = x + d) {
    fill (#8F0000);
    circle (x, y, d);
  }
}

void draw () {
  background (#d3b994);
  circleRow (radius, radius * 9, radius, 2 * radius);
  if (movingX < width - radius) {
    fill (#b35a20);
    circle (movingX, movingY, 2 * radius);
    movingX = movingX + 1;
  }
  else {
    movingX = radius;
    movingY = movingY + (2 * radius);
  }
  if (movingY > 500) {
    movingY = radius + (2*radius);
  }
}
