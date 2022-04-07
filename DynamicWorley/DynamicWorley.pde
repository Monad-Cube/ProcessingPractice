PVector[][] ftrPoints;
int tileX, tileY;
float tileXSize, tileYSize;

void setup(){
  size(600,600);
  //smooth();
  frameRate(60);
  tileX = 6;
  tileY = 6;
  tileXSize = width / tileX;
  tileYSize = height / tileY;
  ftrPoints = new PVector[tileY][tileX];
  
  // intitialize the feature points' positions
  for(int j=0; j<tileY; j++){
    for(int i=0; i<tileX; i++){
      ftrPoints[j][i] = new PVector(0,0);
      ftrPoints[j][i].x = random(i*tileXSize+1, (i+1)*tileXSize-1);
      ftrPoints[j][i].y = random(j*tileYSize+1, (j+1)*tileYSize+1-1);
      //println(ftrPoints[j][i].x + "  " + ftrPoints[j][i].y);
    }
  }
  
}

void draw(){
  background(0);
  int gridX, gridY;
  
  
  loadPixels();
  for(int v=0; v<height; v++){
    for(int u=0; u<width; u++){
      // find the closet distance
      
      float dist = 100;
      gridX = floor(u/tileXSize);
      gridY = floor(v/tileYSize);
      
      for(int j=-1; j<2; j++){
        for(int i=-1; i<2; i++){
          int indexX=gridX+i, indexY=gridY+j;
          // avoid 
          if(indexX < 0)              indexX = 0;
          else if(indexX > (tileX-1)) indexX = tileX-1;
          if(indexY < 0)              indexY = 0;
          else if(indexY > (tileY-1)) indexY = tileY-1;
          
          float d = pow(pow(ftrPoints[indexY][indexX].x - u, 2) + pow(ftrPoints[indexY][indexX].y - v, 2), 0.5);
          if(d < dist) dist=d;
        }
      }
      
      //pixels[v*width+u] = color(int(noise(frameCount*0.01)*map(dist, 0, 100, 0, 255)), 200*noise(frameCount*0.01+1000), 150*noise(frameCount*0.01+1000));//255*noise(frameCount*0.1+dist*0.001+u*0.0001),255*noise(frameCount*0.001+dist*0.001+1000+v*0.0001));
      pixels[v*width+u] = color(map(dist, 0, 200, 0, 255));//, 80, 60);
    }
  }
  updatePixels();
  
  // draw feature points
  for(int j=0; j<tileY; j++){
    for(int i=0; i<tileX; i++){
      stroke(255);
      strokeWeight(3);
      //point(ftrPoints[j][i].x, ftrPoints[j][i].y);
      ftrPoints[j][i].x += map(noise(frameCount*0.1*(i+1)*(j+1)+1000), 0, 1, -2, 2);
      ftrPoints[j][i].y += map(noise(frameCount*0.1*(i+1)*(i+1)*(j+1)*(j+1)*0.1), 0, 1, -2, 2);
      ftrPoints[j][i].x = constrain(ftrPoints[j][i].x, i*tileXSize+1, (i+1)*tileYSize-1);
      ftrPoints[j][i].y = constrain(ftrPoints[j][i].y, j*tileYSize+1, (j+1)*tileYSize-1);
    }
  }
  //noLoop();
}
