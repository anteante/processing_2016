Concentric[] conc; // Declare the object

int number = 5;
int bgColor = 255;
int sColor = 0;

void setup() {
  size(500, 500);
  frameRate(5);
  smooth();
  strokeWeight(1);
  
  // Presets
  // Presets
  
  
  conc = new Concentric[number];
  
  for (int i = 0; i < number; i++) {
//    float xpos = width / 2 + random(- width / 4, width / 4);
    float xpos = random(width);
//    float ypos = height / 2 + random(- height / 4, height / 4);
    float ypos = random(height);
    int initialCircleSize = 10;
    int numberOfPoints = 10;
    int iterations = 100;
    float rangeLow = 5;
    float rangeHigh = 15;

    conc[i] = new Concentric(xpos, ypos, initialCircleSize, numberOfPoints, iterations, rangeLow, rangeHigh); // Construct the object
    conc[i].calculate();
  }
  
  background(bgColor);
  stroke(sColor);
  noFill(); 
}

void draw() {    

// To create fade effect in animation.
  
//  fill(0, 10);
//  rect(0, 0, width, height);
//  noFill();
  for (int i = 0; i < number; i++) {
    conc[i].grow();
    conc[i].display();
  }
  
//  Date d = new Date();
//  long current = d.getTime()/1000;
//  
//  saveFrame(current + ".png");
  
}
class Concentric {
  
  float xpos;
  float ypos;
  int initialCircleSize;
  int numberOfPoints; 
  int iterations;
  float rangeLow;
  float rangeHigh;
  
  float[] circleRadius;
  float[] radiusChange;
  float[][] xPoints;
  float[][] yPoints;
  
  int shapeNumber = 0;
  // Constructor
  
  Concentric(float x, float y, int initCircleSize, int numOfPoints, int iter, float rLow, float rHigh) {
    xpos = x;
    ypos = y;
    initialCircleSize = initCircleSize;
    numberOfPoints = numOfPoints;
    iterations = iter;
    rangeLow = rLow;
    rangeHigh = rHigh;
    
    circleRadius = new float[numberOfPoints];
    radiusChange = new float[numberOfPoints];
    xPoints = new float[iterations][numberOfPoints];
    yPoints = new float[iterations][numberOfPoints];
    // println("Calculating");
    // First circle coordinates
  }
  
  void calculate() {
    
    for (int i = 0; i < numberOfPoints; i++) {
      circleRadius[i] = initialCircleSize;
    }
    for (int i = 0; i < numberOfPoints - 3; i++) {
      xPoints[0][i] = xpos + sin(i * TWO_PI / (numberOfPoints - 3)) * circleRadius[i];
      yPoints[0][i] = ypos + cos(i * TWO_PI / (numberOfPoints - 3)) * circleRadius[i];
    }
    for (int i = numberOfPoints - 3; i < numberOfPoints; i++) {
      xPoints[0][i] = xPoints[0][i - (numberOfPoints - 3)];
      yPoints[0][i] = yPoints[0][i - (numberOfPoints - 3)];
    }
    // Calculate Changes and Outer Circles
    for (int j = 1; j < iterations; j++) {
      for (int i = 0; i < numberOfPoints - 3; i++) {
        float a = random(rangeLow, rangeHigh);
        radiusChange[i] = circleRadius[i] + a;
        circleRadius[i] = radiusChange[i];
      }
      for (int i = numberOfPoints - 3; i < numberOfPoints; i++) {
        radiusChange[i] = radiusChange[i - (numberOfPoints - 3)];
      }
      for (int i = 0; i < numberOfPoints; i++) {
        xPoints[j][i] = xpos + sin(i * TWO_PI / (numberOfPoints - 3)) * radiusChange[i];
        yPoints[j][i] = ypos + cos(i * TWO_PI / (numberOfPoints - 3)) * radiusChange[i];
        //println(xPoints[j][i]);
      }
    }
  }
  
  void grow() {
      shapeNumber += 1;
      if (shapeNumber == iterations - 1) {
        shapeNumber = 0;
        setup();
        //redraw();
        //background(bgColor);
        //calculate();
      }
  }
  
  void display() {
      
//      println("Display");
//     background(255);
//     stroke(random(255), random(255), random(255));
      beginShape();
      for (int i = 0; i < numberOfPoints; i++) {
        curveVertex(xPoints[shapeNumber][i], yPoints[shapeNumber][i]);
      }  
      endShape();
    
    }
    
}