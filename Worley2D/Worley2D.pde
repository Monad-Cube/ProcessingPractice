PVector[] ftrPoints;

void setup(){
  size(600,600);
  frameRate(30);
  ftrPoints = new PVector[100];
  for(int i=0; i<ftrPoints.length; i++){
    ftrPoints[i] = new PVector(random(width), random(height));
  }
  
  
}

void draw(){
  background(0);
  
  loadPixels();
  for(int j=0; j<height; j++){
    for(int i=0; i<width; i++){
      // find the closest distance
      float dist = 1000;
      for(PVector p : ftrPoints){
        float d = pow(pow(abs(p.x-i),2)+pow(abs(p.y-j),2),0.5);        
        if( d<dist ){
          dist = d;
        }
      }

      if(dist  < 2){
        // draw feature points
        pixels[i+j*width] = color(map(dist, 0,200, 78, 255),0,0);
      }
      else{
        pixels[i+j*width] = color(map(dist, 0,200, 80, 255),0,0);
      }
    }  
  } 
  updatePixels();
  
  //for(PVector p : ftrPoints){
  // p.x += map(noise(p.x*100+frameCount), 0, 1, -1, 1);
  // p.y += map(noise(p.y*1000+frameCount), 0, 1, -1, 1);
  // //println(p.x + "  " + p.y);
  //}
  
  noLoop();
}
