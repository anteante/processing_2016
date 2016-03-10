Concentric conc; // Declare the object
void setup() {
  size(1200, 1200);
  smooth();
  strokeWeight(1);
  
  // Presets
  // Presets
  
  float xpos = width / 2;
  float ypos = height / 2;
  int initialCircleSize = 0;
  int numberOfPoints = 10;
  int iterations = 50;
  float rangeLow = 10;
  float rangeHigh = 40;
  
//  String s = current + "_" + numberOfPoints + "_" + iterations + "_" + rangeLow + "_" + rangeHigh; 
  conc = new Concentric(xpos, ypos, initialCircleSize, numberOfPoints, iterations, rangeLow, rangeHigh); // Construct the object
  
   background(255);
   stroke(0);
   noFill();
  
  conc.calculate();
}

void draw() {    
//  fill(0, 10);
//  rect(0, 0, width, height);
  noFill();

  conc.grow();
  conc.display();
  
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
        //setup();
        //redraw();
        background(255);
        calculate();
      }
  }
  
  void display() {
      
//      println("Display");
//     background(255);
      beginShape();
      for (int i = 0; i < numberOfPoints; i++) {
        curveVertex(xPoints[shapeNumber][i], yPoints[shapeNumber][i]);
      }  
      endShape();
    
    }
    
}