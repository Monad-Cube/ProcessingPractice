float objectX, objectY, noiseX, noiseY;

void setup(){
  objectX = width/2;
  objectY = height/2;
  size(600,600);
  smooth();
}

void draw(){
  background(255);
  //draw
  Yang(width/2, height/2, 1);
  //update Noise Coordinate
  noiseX = noiseX + 0.1;
  noiseY = noiseY + 0.1;
  objectX = objectX + map(noise(noiseX), 0, 1, -3, 3);
  objectY = objectY + map(noise(noiseY+1000), 0, 1, -3, 3);
}

void Yang(int drawCenterX, int drawCenterY, int gridLevel){
  if(gridLevel < 6){
    //color(gridLevel*20);
    //fill(gridLevel*10);
    //circle(drawCenterX, drawCenterY, 10);
    
    if((abs(objectX-drawCenterX) + abs(objectY-drawCenterY)) < 50)
    {
      line(objectX, objectY, drawCenterX, drawCenterY);
    }
    
    gridLevel++;
    int level = int(pow(2,gridLevel));
    //draw sub central line
    Yang(drawCenterX - width/level, drawCenterY - height/level, gridLevel);
    Yang(drawCenterX - width/level, drawCenterY + height/level, gridLevel);
    Yang(drawCenterX + width/level, drawCenterY - height/level, gridLevel);
    Yang(drawCenterX + width/level, drawCenterY + height/level, gridLevel);
  }
}
