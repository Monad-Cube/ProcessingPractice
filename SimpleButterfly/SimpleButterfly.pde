int level = 100, count=0;
void setup(){
  size(600,600);
  stroke(150);
  strokeWeight(3);
}

void draw(){
  background(200);
  fill(200);
  float inc = round(PI/level*1000)/1000.0;
  float nPosX = 100.0f, nPosY = 0;
  count = 0;
  pushMatrix();
  translate(width/2,height/2);
  rotate(-PI/2);
  // right wing
  for(float i = -PI/2; i <= PI/2.0; i +=inc){
    float radius = sin(2*i) * map(noise(nPosX, nPosY), 0, 1, 100, 200);
    float x = cos(i)*radius;
    float y = sin(i)*radius * map(sin(frameCount*0.1),0,1,0.7,1);
    // draw color
    //stroke(200 * map(sin(frameCount*0.01),0,1,0.1,1),200*map(sin(frameCount*0.01),0,1,0.9,1),200*map(sin(frameCount*0.1),0,1,0.7,1));
    color c = lerpColor(color(200,200,100,50),color(100,100,200,200),map(count,0,level,0.6,1));
    stroke(c);
    line(0,0,x,y);
    // draw outline
    //stroke(150);
    //vertex(x, y);
    nPosX += 0.1;
    count++;
  }
  nPosX -= 0.1;
  count--;
  // left wing
  for(float i = 3*PI/2 - (level-1)*inc; i <= 3*PI/2.0+0.1; i +=inc){
    float radius = sin(2*i) * map(noise(nPosX, nPosY), 0, 1, 100, 200);
    float x = cos(i)*radius;
    float y = sin(i)*radius * map(sin(frameCount*0.1),0,1,0.7,1);
    color c = lerpColor(color(200,200,100,50),color(100,100,200,200),map(count,0,level,0.6,1));
    stroke(c);
    line(0,0,x,y);
    //vertex(x, y);
    nPosX -=0.1;
    count--;
  }
  noStroke();
  fill(50,50,100);
  circle(0,0,10);
  popMatrix();
  //noLoop();
}
