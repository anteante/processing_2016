float xloc = 0;
float yloc = 0;

void setup() {
  size(480, 480);
  background(0);
  stroke(255);
  strokeWeight(1);
  noLoop();
}

void draw() {
  translate(40,40);
  for (int j = 0; j < 3; j = j+1) { 
    for (int i = 0; i < 3; i = i+1) {
      pattern(xloc,yloc);
      xloc += 120;
    }
   yloc += 120;
  }
}

void pattern(float x, float y) {
  for (int i = 0; i < 20; i = i+1) {
    line(x, y, x, y+100);
    x = x+5;
  }
}