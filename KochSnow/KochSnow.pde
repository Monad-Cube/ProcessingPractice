ArrayList<KochLine> snowLinesTop, snowLinesLeft, snowLinesRight;

void setup() {
  size(600, 600);
  smooth();

  snowLinesTop = new ArrayList<KochLine>();
  snowLinesLeft = new ArrayList<KochLine>();
  snowLinesRight = new ArrayList<KochLine>();
  // 
  int posY = int(((500-100)/2) * pow(3, 0.5)) + 150;
  snowLinesTop.add(new KochLine(new PVector(100,150), new PVector(500,150)));
  snowLinesLeft.add(new KochLine(new PVector(300,posY), new PVector(100,150)));
  snowLinesRight.add(new KochLine(new PVector(500,150), new PVector(300,posY)));
  // caculate KochSnow
  for(int i=0; i<5; i++){
    snowLinesTop = iterate(snowLinesTop);
    snowLinesLeft = iterate(snowLinesLeft);
    snowLinesRight = iterate(snowLinesRight);
  }
}

void draw() {
  background(0);
  // Draws  KochSnow
  for(KochLine l : snowLinesTop) {
      l.display();
  }
  for(KochLine l : snowLinesLeft) {
      l.display();
  }
  for(KochLine l : snowLinesRight) {
      l.display();
  }
}


ArrayList iterate(ArrayList<KochLine> before) {
    ArrayList now = new ArrayList<KochLine>();    // Create emtpy list
    for(KochLine l : before) {
      // Calculate 5 koch PVectors (done for us by the line object)
      PVector a = l.start();                 
      PVector b = l.kochleft();
      PVector c = l.kochmiddle();
      PVector d = l.kochright();
      PVector e = l.end();
      // Make line segments between all the PVectors and add them
      now.add(new KochLine(a,b));
      now.add(new KochLine(b,c));
      now.add(new KochLine(c,d));
      now.add(new KochLine(d,e));
    }
    return now;
}
