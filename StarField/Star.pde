class Star{
  float x;
  float y;
  float z;
  float curX;
  float curY;
  float postX;
  float postY;
  float cenX;
  float cenY;
  float radius;
  float speed;
  boolean drawline;
  
  Star(){
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
    curX = 0;
    curY = 0;
    postX = 0;
    postY = 0;
    cenX = width/2;
    cenY = height/2;
    radius = 8;
    speed = 0;
    drawline = true;
  }
  
  void update(){
    // numbers outside of the range are not clamped to the minimum and maximum parameters values
    curX = map(x/z, 0, 1, 0, width/2); // is equal to map(x/z, -1, 1, -width, width)
    curY = map(y/z, 0, 1, 0, height/2);
    radius = map(z, 0, width, 20, 0);
    drawline = true;
    speed = mouseX;
    z = z - map(speed, 0, width, 0, 50);
    if(z < 1){
      x = random(-width, width);
      y = random(-height, height);
      z = width;
      drawline = false;
    }
    
    postX = map(x/z, 0, 1, 0, width/2);
    postY = map(y/z, 0, 1, 0, height/2);
    reCenter();
  }
  
  void reCenter(){
    if(keyPressed && key == 32){
      centerX = mouseX;
      centerY = mouseY;
      cenX = centerX;
      cenY = centerY;
      return;
    }
    //centerX = width/2;
    //centerY = height/2;
  }
  
  
  void display(){
    fill(255); 
    noStroke();    
    //ellipse(curX, curY, radius, radius);
    
    stroke(map(noise(z*0.001),0,1,0,255), map(noise(z*0.001+100),0,1,0,255), map(noise(z*0.001+1000),0,1,0,255));
    strokeWeight(1);
    if(drawline){
      line(curX, curY, postX, postY);
    }
  }
  
}
