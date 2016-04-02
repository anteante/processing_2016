void setup() {
  size(800, 800);
  background(0, 0, 255);
  fill(255);
  noLoop();
  noStroke();
}

void draw() {
  for (int x = 0; x<=width; x+=20) {
    for (int y=0; y<=height; y+=20) {
      ellipse(x, y, 10, 10);
    }
  }
}