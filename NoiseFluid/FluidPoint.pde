class FluidPoint{
  PVector pos = new PVector();
  float theta, centerX, centerY, radius;
  
  
  FluidPoint(int inX, int inY, float inR, float inT){
    centerX = inX;
    centerY = inY;
    radius  = inR;
    theta   = inT;
    updatePos();
  }
  
  PVector GetPos(){
    return pos;
  }
  
  void updatePos(){
    pos.x = centerX + radius * cos(theta);
    pos.y = centerY + radius * sin(theta);
  }
  
  void boundary(int frameC, int i){
    radius = map(noise(pos.x*0.005, pos.y*0.005, frameC*0.05 ), 0, 1, - 0.4, 0.4 ) * radius + 200;
    updatePos();
  }
}
