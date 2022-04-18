// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x, float y, float vx, float vy) {
    mass = m;
    position = new PVector(x, y);
    velocity = new PVector(vx, vy);
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(255);
    strokeWeight(2);
    //noStroke();
    noFill();
    ellipse(position.x, position.y, 24, 24);
    //ellipse(position.x, position.y, mass*24, mass*24);
  }
  
  void attracted(Mover m) {
    PVector force = PVector.sub(m.position, position);            // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance, 10.0, 30.0);                    // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction

    float strength = (g * mass * m.mass) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(strength);                                         // Get force vector --> magnitude * direction
    applyForce(force);
  }
}
