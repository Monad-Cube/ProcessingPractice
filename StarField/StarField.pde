Star[] stars = new Star[400];
float centerX, centerY;

void setup(){
  size(600, 600);
  centerX = width/2;
  centerY = height/2;
  for(int i = 0; i < stars.length; i++){
    stars[i] = new Star();
  }
}

void draw(){
  background(0);
  translate(map(centerX, 0, width, width/2-100, width/2+100), 
  map(centerY, 0, height, height/2-100, height/2+100));
  for(int i = 0; i < stars.length; i++){
    stars[i].update();
    stars[i].display();
  }  
}
