// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// Box2DProcessing example

class SpeedBoost extends PowerUp{

  SpeedBoost(float x, float y) {
    super(x ,y );
    colorR = 38;
    colorG = 224;
    colorB = 69;
    type = 'b';// b for boost
  }
}