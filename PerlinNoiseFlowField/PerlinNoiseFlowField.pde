ArrayList<Particle> particles;
PVector[] flowfield;
int gridX, gridY, column, row; 
float noisePosX, noisePosY, noisePosZ, inc;

void setup(){
  size(600,600);
  // field data
  gridX  = 10;
  gridY  = 10;
  column = floor(width/gridX);
  row    = floor(height/gridY);
  noisePosX = 0;//random(3);
  noisePosY = 0;//random(3);
  inc = 0.1;
  flowfield = new PVector[column*row];

  // particle data
  particles = new ArrayList<Particle>();
  for(int i = 0; i < 1000; i++){
    particles.add(new Particle(random(0,width),random(0,height)));
  }
  //for(Particle p : particles){
  //  p.display
  //}
  background(255);
}

void draw(){
  //background(200);
  noisePosY = 0;
  
  // set fuild vector field
  setField();
  
  // draw particles
  for(Particle p : particles){
    p.update();
    p.wrap();
    p.matchField();
    p.display();
  }
  //noLoop();
}

void setField(){
  noisePosY = 0;
  for(int j=0; j<row; j++){
    noisePosX = 0;
    for(int i=0; i<column; i++){
      // draw grid
      //fill(noise(noisePosX, noisePosY)*255);
      //rect(i*gridX, j*gridY, i*gridX+gridX, j*gridY+gridY);
      
      // define the degree of curl 
      float theta = 2 * TWO_PI * noise(noisePosX, noisePosY, noisePosZ);
      
      PVector vector = new PVector(cos(theta), sin(theta));
      vector.setMag(1);
      flowfield[i+j*column] = vector; 
      
      // draw relative line
      //stroke(0,50);
      //strokeWeight(0.5);
      //pushMatrix();
      //translate(i*gridX, j*gridY);
      //rotate(vector.heading());
      //line(0,0,gridX,0);
      //popMatrix();
      
      noisePosX += inc;
    }
    noisePosY += inc;
  }
  noisePosZ += inc*0.1;
}
