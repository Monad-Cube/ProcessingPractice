PImage img;
float gridSize, gridX, gridY;

void setup(){
  size(600,600,P3D);
  //frameRate(10);
  img = loadImage("discus-thrower-2000.jpg");
  img.resize(0,600);
  gridSize = 10;
  gridX = width / gridSize;
  gridY = height/ gridSize;
  sphereDetail(3);
}

void draw(){
  background(#f1f1f1);
  pushMatrix();
  translate(width/2, height/2);
  rotateY(radians(frameCount*0.8));
  for(int j = 0; j < gridY; j++){
    for(int i = 0; i < gridX; i++){
      color pixelColor = img.get(int(i*gridSize), int(j*gridSize));
      float b = map(brightness(pixelColor), 0, 255, 0, 1);
      float z = map(b, 0, 1, -120, 120)*sin(frameCount*0.05);
      pushMatrix();
      translate(i*gridSize - width/2, j*gridSize - height/2, z);
      //translate(i*gridSize, j*gridSize);
      //noStroke();
      fill(0);
      //ellipse(0, 0, gridSize*b, gridSize*b);
      sphere(gridSize*b*0.3);
      popMatrix();
    }  
  }
  popMatrix();
  
}
