int level, count, limit; 
float d, n, inc;
boolean drawing;
void setup(){
  frameRate(10);
  size(300,300);
  smooth();
  level = 700;
  count = 0;
  limit = 70;
  drawing = false;
  n = 2; // n and d are odd, n petals, 2n petals otherwise
  d = 1; //
  inc = TWO_PI/level;
  //k = n / d;
}

void draw(){
  background(100);
  count = 0;
  startDraw();
  
  if(drawing){
    drawRoseCurve(n, d);
    n++;
    d++;
    if(n >= limit){
      n = limit;
    }
    if(d >= (limit-1)){
      d = limit-1;
      drawing = false;
    }
  }
  
  
}

void drawRoseCurve(float inN, float inD){
  float k = inN / inD;
  pushMatrix();
  translate(width/2,height/2);
  //rotateX(map(mouseY, 0, height, -PI/2, 3*PI/2));
  //rotateY(map(mouseX, 0, width, -PI/2, 3*PI/2));
  beginShape();
  stroke(180,170,170,200);
  strokeWeight(1);
  //noStroke();
  noFill();
  //fill(100,200,100);
  for(float i = 0; i < (TWO_PI*inD); i += inc){
      float r = 150*cos(k*i);//map(mouseX,0,width,0,50);
      float x = r*cos(i);
      float y = r*sin(i);
      vertex(x, y);
      count++;
    }
  endShape(CLOSE);
  popMatrix();
}

void startDraw(){
  if(keyPressed){
    if(key =='s'){
      n = 2;
      d = 1;
      drawing = true;
    }
  }
}
