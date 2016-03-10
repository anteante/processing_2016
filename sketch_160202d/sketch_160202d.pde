ArrayList <PVector> anchors = new ArrayList<PVector>();
 
void setup(){
  size(600, 600);
  setAnchors(); 
  renderAnchors();
  renderBez();
 
}
 
void setAnchors(){
  PVector tmp = new PVector();
  PVector orig = new PVector(width/2, height/2);
  PVector deltas = new PVector();
  float offset = 200;
  deltas.x = -offset;
  deltas.y = -offset;
  tmp = PVector.add(orig,deltas);
  anchors.add(tmp);
  deltas.x = offset;
  deltas.y = -offset;
  tmp = PVector.add(orig,deltas);
  anchors.add(tmp);
  deltas.x = offset;
  deltas.y = offset;
  tmp = PVector.add(orig,deltas);
  anchors.add(tmp);
  deltas.x = -offset;
  deltas.y = offset;
  tmp = PVector.add(orig,deltas);
  anchors.add(tmp);
  deltas.x = -offset;
  deltas.y = -offset;
  tmp = PVector.add(orig,deltas);
  anchors.add(tmp);
}
 
void renderAnchors(){
   for (PVector p: anchors){
    ellipse(p.x, p.y, 5, 5);
  }
}
 
void renderBez(){
   beginShape();  
    int pSize = anchors.size();
    PVector tmp1 = anchors.get(0);
    PVector tmp2 = anchors.get(pSize-1);
 
    PVector inBet = new PVector((tmp2.x + tmp1.x)/2, (tmp2.y + tmp1.y) / 2);
    vertex(inBet.x, inBet.y);
 
    for (int j = 0; j < pSize; j++){
    tmp1 = anchors.get(j%pSize);
    tmp2 = anchors.get((j+1)%pSize);
    inBet = new PVector((tmp2.x + tmp1.x)/2, (tmp2.y + tmp1.y) / 2);
    bezierVertex(tmp1.x, tmp1.y, tmp1.x, tmp1.y, inBet.x, inBet.y); 
    }
    endShape();
  }
 
 
 
void draw(){
}