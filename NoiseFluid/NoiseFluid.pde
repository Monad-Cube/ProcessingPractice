FluidPoint[] FluidSuf;
int frameC;
void setup(){
  size(600,600);
  background(255);
  frameRate(30);
  frameC = 0;
  initFlower();
}

void draw(){
  drawFlower();
  frameC++;
}

void initFlower(){
  FluidSuf = new FluidPoint[500];
  for(int i=0; i<500; i++){
    FluidSuf[i] = new FluidPoint(width/2, height/2, 200.0, 2*PI*i*0.002);
  }
}

void drawFlower(){
  fill(200,200,200);
  stroke(0);
  int i=0;
  beginShape();
  for (FluidPoint p : FluidSuf) {
    p.boundary(frameC, i);
    vertex(p.GetPos().x, p.GetPos().y);
    //println("(" + p.GetPos().x + " " + p.GetPos().y + ")");
    i++;
  }
  endShape(CLOSE);
}
