Mover[] movers = new Mover[10];
Mover centerPoint;
float g = 1;

void setup() {
  size(800,800);
  frameRate(20);
  // draw galaxy
  for (int i = 0; i < movers.length; i++) {
    PVector pos = PVector.random2D();
    pos.setMag(random(100, 150)); 
    PVector vel = pos.copy();
    vel.setMag(random(10, 15));
    vel.rotate(-PI/2);   // make the velocity's direction is tangent of radius.
    // mass, posX, posY, vx, vy
    movers[i] = new Mover(random(10,15), pos.x, pos.y, vel.x, vel.y); 
  }
  centerPoint = new Mover(500, 0, 0, 0, 0); 
  // draw line
  //movers[0] = new Mover(20, 600, 300, 0, -5); 
  //movers[1] = new Mover(20, 400, 100, -5, 0);
  //movers[2] = new Mover(20, 200, 300, 0, 5);
  //movers[3] = new Mover(20, 400, 500, 5, 0);
  background(0);
}

void draw() {
  //background(0, 10);
  fill(0, 40);
  noStroke();
  rect(0, 0, width, height);
  
  pushMatrix();
  translate(width/2, height/2);
  
  for (int i = 0; i < movers.length; i++) {
    movers[i].attracted(centerPoint);
    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        movers[i].attracted(movers[j]);
        stroke(230,100);
        line(movers[i].position.x, movers[i].position.y, movers[j].position.x, movers[j].position.y);
      }
    }
    movers[i].update();
    movers[i].display();
  }
  //centerPoint.display();
  popMatrix();
}
