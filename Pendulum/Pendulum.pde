float l1 = 180, l2 = 200;   // length
float a1 = PI/2, a2 = PI/2; // theta
float a1_v = -0.001, a2_v = -0.002;   // velocity
float a1_a = 0, a2_a = 0;   // acceleration
float m1 = 20, m2 = 20;          // mass
float g = 1.5;                // gravity
float x1, x2, y1, y2, preX2, preY2;       // position

PGraphics canvas;

void setup(){
  size(900,600);
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(10, 10, 0,200);
  canvas.endDraw();
  x1 = l1*sin(a1);
  y1 = l1*cos(a1);
  x2 = x1 + l2*sin(a2);
  y2 = y1 + l2*cos(a2);
  preX2 = x2;
  preY2 = y2;
  
}

void draw(){
  background(50, 50, 150);
  imageMode(CORNER);
  image(canvas, 0, 0, width, height);
  // calculate the theta acceleration
  // equations from myphysicslab
  float num1 = -g * (2 * m1 + m2) * sin(a1);
  float num2 = -m2 * g * sin(a1-2*a2);
  float num3 = -2*sin(a1-a2)*m2;
  float num4 = a2_v*a2_v*l2+a1_v*a1_v*l1*cos(a1-a2);
  float den = l1 * (2*m1+m2-m2*cos(2*a1-2*a2));
  float a1_a = (num1 + num2 + num3*num4) / den;

  num1 = 2 * sin(a1-a2);
  num2 = (a1_v*a1_v*l1*(m1+m2));
  num3 = g * (m1 + m2) * cos(a1);
  num4 = a2_v*a2_v*l2*m2*cos(a1-a2);
  den = l2 * (2*m1+m2-m2*cos(2*a1-2*a2));
  float a2_a = (num1*(num2+num3+num4)) / den;
  
  // update theta, theta velocity
  a1_v += a1_a;
  a2_v += a2_a;
  //a1_v = constrain(a1_v, -0.01, 0.01);
  //a2_v = constrain(a2_v, -0.02, 0.02);
  a1 += a1_v;
  a2 += a2_v;
  
  // calculate the position
  x1 = l1*sin(a1);
  y1 = l1*cos(a1);
  x2 = x1 + l2*sin(a2);
  y2 = y1 + l2*cos(a2);
  
  // draw m1 m2
  color c = color(100, 100, 150);
  translate(width/2, 100);
  stroke(c);
  strokeWeight(2);
  
  line(0, 0, x1, y1);
  fill(c);
  ellipse(x1, y1, m1, m1);
  
  line(x1, y1, x2, y2);
  fill(c);
  ellipse(x2, y2, m2, m2);
  
  canvas.beginDraw();
  canvas.translate(width/2, 100);
  canvas.stroke(100,100,map(noise(frameCount*0.01),0,1,150,255),200);
  canvas.strokeWeight(3);
  canvas.line(preX2, preY2, x2, y2);
  canvas.endDraw();
  
  // update pre pos
  preX2 = x2;
  preY2 = y2;
  //noLoop(); 
}
