import peasy.*;
int DIM;
PeasyCam cam;
ArrayList<PVector> mandelbulb;

void setup(){
  size(600, 600, P3D);
  DIM = 64;
  cam = new PeasyCam(this, 500);
  mandelbulb = new ArrayList<PVector>();
  
  for(int i = 0; i < DIM; i++){
    for(int j = 0; j < DIM; j++){
      boolean edge = false;
      for(int k = 0; k < DIM; k++){
        // Cartesian Coordinate
        float x = map(i, 0, DIM, -1, 1);
        float y = map(j, 0, DIM, -1, 1);
        float z = map(k, 0, DIM, -1, 1);
        
        // Iteration formula
        PVector zeta = new PVector(0, 0, 0);
        int n = 8;
        int iteration = 0;
        int maxIterations = 10;

        while(iteration < maxIterations){

          // transform cartesian coord to spherical
          zeta = spherical(zeta.x, zeta.y, zeta.z);
          
          // caculate zeta's n-power
          float newX = pow(zeta.x, n) * cos(zeta.y*n) * cos(zeta.z*n);
          float newY = pow(zeta.x, n) * sin(zeta.y*n) * sin(zeta.z*n);
          float newZ = pow(zeta.x, n) * cos(zeta.y*n);
          
          // now zeta is cartesian
          zeta.x = newX + x;
          zeta.y = newY + y;
          zeta.z = newZ + z;
          iteration++;
          
          if(zeta.x > 2){
            if(edge){
              edge = false;
            }
            break;
          }
          
          // Determine whether zeta belongs to mandelbulb set and is the edge 
          if(iteration >= maxIterations){
            if(!edge){
              edge = true;
              mandelbulb.add(new PVector(x, y, z));
            }
            break;
          }
        } 
      }
    }
  }
}

void draw(){
  background(30,30,30);
  //int count = 0;
  for(PVector v : mandelbulb){
    fill(200, 200, 255);
    stroke(map(abs(v.x), 0, 1, 70, 150),map(abs(v.y), 0, 1, 150, 200), 
    map(abs(v.z), 0, 1, 220, 250));
    //point(v.x*100, v.y*100, v.z*100);
    drawLine(v.x, v.y, v.z);
    //count++;
  }
  //println(count);
}

void drawLine(float x, float y, float z){
  int len = 40;
  if(x<0 && y<0 && z<0){
    line(x*100, y*100, z*100, x*100+len, y*100+len, z*100+len);
    return;  
  }
  if(x<0 && y<0 && z>0){
    line(x*100, y*100, z*100, x*100+len, y*100+len, z*100-len);
    return;  
  }
  if(x<0 && y>0 && z<0){
    line(x*100, y*100, z*100, x*100+len, y*100-len, z*100+len);
    return;  
  }
  if(x<0 && y>0 && z>0){
    line(x*100, y*100, z*100, x*100+len, y*100-len, z*100-len);
    return;  
  }
  if(x>0 && y<0 && z<0){
    line(x*100, y*100, z*100, x*100-len, y*100+len, z*100+len);
    return;  
  }
  if(x>0 && y<0 && z>0){
    line(x*100, y*100, z*100, x*100-len, y*100+len, z*100-len);
    return;  
  }
  if(x>0 && y>0 && z<0){
    line(x*100, y*100, z*100, x*100-len, y*100-len, z*100+len);
    return;  
  }
  if(x>0 && y>0 && z>0){
    line(x*100, y*100, z*100, x*100-len, y*100-len, z*100-len);
    return;  
  }

    
}

PVector spherical(float x, float y, float z){
  // Spherical Coordinate
  float r = sqrt(x*x + y*y + z*z);
  float theta = atan2(sqrt(x*x + y*y), z);
  float phi = atan2(y, x);
  return new PVector(r, theta, phi);
}
