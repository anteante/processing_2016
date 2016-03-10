float rr = 0.5;

void setup() {
  size(800, 800);
  background(0);
  stroke(255);
  strokeWeight(0.5);
  noLoop();
  noFill();
}

void draw() {
  for (int i = 25; i < width; i = i+100) {
    for (int j = 25; j < height; j = j+100) {
      pushMatrix();
      translate(i, j);
      float r1 = random(-rr,rr);
      float r2 = random(-rr,rr);
      pattern(r1,r2);
      popMatrix();
      // rr = rr + 0.1;
    }
  }
}

void pattern(float r1, float r2) {
  float x1 = 0;
  float x2 = 0;
  float y = 0;
  for (int i = 0; i < 10; i = i+1) {
    float r3 = random(-5,5);
    line(x1, y+r3, x2+r3, y+50+r3);
    x1 = x1+5+r1;
    x2 = x2+5+r2;
  }
}