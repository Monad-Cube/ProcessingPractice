int frameC;
// gaussian function parameter
int miu,disX, disY;
float sigma;


void setup(){
  size(600,800,P2D);
  frameRate(60);
  smooth(8);
  frameC = 0;
  miu = width/2;
  sigma = 20;
  disX = 5;
  disY = 10;
  //b38tn1k_Func();
}

void draw(){
  background(0);
  fill(0);
  stroke(255);
  GaussianFunc();
  frameC++;
  //Tiny(); //<>//
  //b38tn1k_Func();
}

void GaussianFunc(){
  // posY range from 0 to 1
  //Re_posY = (1 / (pow((2*PI),0.5) * sigma));// * 
  int posY = 0;
  float Re_posY = height;
  
  for(int y=100; y<height; y+=disY) {
    beginShape();
    int x = 0;
    for(x=0; x<width; x+=disX){
      // add noise on miu
      float N_miu = miu + map(noise(pow(y,1)+frameC*0.0125),0,1,-100, 100); 
      
      Re_posY = exp(- (pow((x - N_miu),2) / (2*pow(sigma,2))) );
      posY = int(map(Re_posY, 0, 1, 0, height/5));
      //posY = posY*int(map(noise(y + x*0.5 + frameC*0.125), 0, 1, 15*disY, 5*disY));
      posY = int(posY*noise(y*0.1 + x*0.05 + frameC*0.002 + disX*0.125));
      vertex(x, y - posY);
    }
    vertex(x, y);
    endShape();
  }
}

void b38tn1k_Func() {
  float subDiv = height/75;  
  float xsub = subDiv/5;
  for (float y = subDiv*20; y <= height; y += 2*subDiv) {
    beginShape();
    // start
    vertex(0, y);
    for (float x = 0; x < width; x += xsub) {
      float posX=0, posY=0;
      //make it get taller in the middle! scale ranges from 0 to 1, when the x/width is 1/2, scale equals 1
      float scale = sin(PI/width * x);
      scale = pow(scale,4);
      // original offset
      //posX = random(x - (0.5*subDiv), x+ 0.5*subDiv);
      //posY = random(y- 15*subDiv * scale, y-5*subDiv* scale);
      
      // berlin noise
      posX = map(noise(y+x*0.05+frameC*0.0125),0,1,x - (0.5*subDiv), x+ 0.5*subDiv);
      posY = map(noise(y+x*0.05+frameC*0.0125),0,1,y- 15*subDiv * scale, y-2*subDiv* scale);
      vertex(posX, posY);
    }
    vertex(width, y);
    endShape();
  }
}

//void Tiny(){
//  for(int y=100;y<height;y+=50) {
//    beginShape();
//    int x;
//    for(x=0;x<height;x+=30){
//      //vertex(x,y-80/(1+pow(x-150,4)/8000000)*noise(x/30 + frameC/50 +y));
//    }
//    //vertex(x,10000);
//    endShape();
//  }
//}
