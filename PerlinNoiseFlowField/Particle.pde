class Particle{
  PVector pos = new PVector(0,0), 
          vel = new PVector(0,0), 
          acc = new PVector(0,0),
          pre = new PVector(0,0);
  float   m = 1.0, maxSpeed = 1.0;
  
  Particle(float inX, float inY){
    pos.x = inX;
    pos.y = inY;
  }
  
  void update(){
    updatePre();
    pos.add(vel);
    vel.add(acc);
    vel.limit(maxSpeed);
    acc.mult(0);
  }
  
  void updatePre(){
    pre.x = pos.x;
    pre.y = pos.y;
  }
  
  void matchField(){
    int x = floor(pos.x / gridX);
    int y = floor(pos.y / gridY);
    int index = x + y*column;
    //println(column + " " + row + " " + "x: " + x + " y: " + y + " " + index);
    applyForce(flowfield[index]); //<>//
  }
  
  void applyForce(PVector force){
    acc.x = force.x/m;
    acc.y = force.y/m;
  }
  
  void display(){
    //stroke(200,0,0,10);
    stroke(0,10);
    strokeWeight(noise(pos.x,pos.y)*3);
    //point(pos.x, pos.y);
    line(pre.x, pre.y, pos.x, pos.y);
  }
  
  void wrap(){
    if(pos.x < 0){      
       pos.x = width -1;
       updatePre();
    }
    if(pos.x >= width){
      pos.x = 0;
      updatePre();
    } 
      
    if(pos.y < 0){
      pos.y = height -1;
      updatePre();
    }
    if(pos.y >= height){
      pos.y = 0;
      updatePre();
    }
  }
}
