// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// Box2DProcessing example

class SpeedBoost {

  // We need to keep track of a Body and a width and height
  Body body;
  float w;
  float h;
  float rotation;
  PVector pos, vel;
  float mag;
  float x;
  float y;
  int r = 20;

  // Constructor
  SpeedBoost(float x, float y) {
    w = 20;
    h = 20;
    // Add the box to the box2d world
    this.x=x;
    this.y=y;
    mag = 0;
    pos = new PVector(x,y);
    vel = new PVector(0.0,0.0);
  }

  // Drawing the box
  void display() {
    stroke(0);
    fill(500);
    ellipse(x, y, r*2, r*2);
  }
  
  void highlight() {
    fill(500);
  }
}