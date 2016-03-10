void setup() {
  size(500, 500);
  background(0);
  stroke(255);
  strokeWeight(1);
  noLoop();
}

void draw() {
  for (int i = 50; i < width-50; i = i+100) {
    for (int j = 50; j < height-50; j = j+100) {
      pushMatrix();
      translate(i, j);
      pattern();
      popMatrix();

    }
  }
}

void pattern() {
  float x = 0;
  float y = 0;
  for (int i = 0; i < 10; i = i+1) {
    line(x, y, x, y+50);
    x = x+5;
  }
}