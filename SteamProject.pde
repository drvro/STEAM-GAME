import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// A reference to our box2d world
boolean isShownfb1=true;
boolean isShownfb2=true;
boolean isShownsb1=true;


Box2DProcessing box2d;
ArrayList<Object> objects;
Car b;
Obstacle b2;
Obstacle b3;
Obstacle b4;
Obstacle b5;
Obstacle b6;
Obstacle b7;
Obstacle b8;
Obstacle b9;
Obstacle b10;
Obstacle b11;
Obstacle b12;
Obstacle b13;
Obstacle b14;
Obstacle b15;
Obstacle b16;
Obstacle b17;
Obstacle b18;
Obstacle b19;
Obstacle b20;
Obstacle b21;
Obstacle b22;
Obstacle b23;
Obstacle b24;
Obstacle b25;

FreezeBomb fb1;
FreezeBomb fb2;
SpeedBoost sb1;

AICar d3;
ArrayList<AICar> enemies = new ArrayList<AICar>();
void setup() {
  size(600,600);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, 0);
  objects = new ArrayList<Object>();
  objects.add(new Car(420, 120));
  objects.add(new Obstacle(50, 50));
  objects.add(new Obstacle(50, 150));
  objects.add(new Obstacle(50, 250));
  objects.add(new Obstacle(50, 350));
  objects.add(new Obstacle(50, 450));
  b7 = new Obstacle(50, 550);
  b8 = new Obstacle(150, 50);
  b9 = new Obstacle(250, 50);
  b10 = new Obstacle(350, 50);
  b11 = new Obstacle(450, 50);
  b12 = new Obstacle(550, 50);
  b13 = new Obstacle(550, 150);
  b14 = new Obstacle(550, 250);
  b15 = new Obstacle(550, 350);
  b16 = new Obstacle(550, 450);
  b17 = new Obstacle(550, 550);
  //b18 = new Obstacle(250, 250);
  //b19 = new Obstacle(250, 350);
  //b20 = new Obstacle(350, 250);
  //b21 = new Obstacle(350, 350);
  b22 = new Obstacle(150, 550);
  b23 = new Obstacle(250, 550);
  b24 = new Obstacle(350, 550);
  b25 = new Obstacle(450, 550);
  fb1 = new FreezeBomb((int)(300*Math.random()+150),150);
  fb2 = new FreezeBomb((int)(300*Math.random()+150),450);
  sb1 = new SpeedBoost(450,(int)(300*Math.random()+150));
  for (int i = 0; i < 3; i++) {
    enemies.add(new AICar(150, random(150, 450)));
  }
  
}

void draw() {
   background(255);
  
  // We must always step through time!
  box2d.step();
  
  b.display();
  b2.display();
  b3.display();
  b4.display();
  b5.display();
  b6.display();
  b7.display();
  b8.display();
  b9.display();
  b10.display();
  b11.display();
  b12.display();
  b13.display();
  b14.display();
  b15.display();
  b16.display();
  b17.display();
  b18.display();
  b19.display();
  b20.display();
  b21.display();
  b22.display();
  b23.display();
  b24.display();
  b25.display();

  
  if (isShownfb1)
    fb1.display();
  if (isShownfb2)
    fb2.display();
  if (isShownsb1)
    sb1.display();
  for (AICar d3 : enemies) {
    d3.display(b);
  }

  if(isShownfb1 && b.intersect(fb1))
  {
    for (AICar d3 : enemies) {
    d3.stop();
    isShownfb1=false;
    }
  }
  if(isShownfb2 && b.intersect(fb2))
  {
    for (AICar d3 : enemies) {
    d3.stop();
    isShownfb2=false;
    }
  }
  if(isShownsb1 && b.intersect(sb1))
  {
    b.boost();
    isShownsb1=false;
  }
}