import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// A reference to our box2d world

Box2DProcessing box2d;
ArrayList<Obstacle> obstacles;
ArrayList<PowerUp> powerUps;
Car b;

AICar d3;
ArrayList<AICar> enemies = new ArrayList<AICar>();
void setup() {
  size(600,600);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, 0);
  obstacles = new ArrayList<Obstacle>();
  b = new Car(420, 120);
  obstacles.add(new Obstacle(50, 50));
  obstacles.add(new Obstacle(50, 150));
  obstacles.add(new Obstacle(50, 250));
  obstacles.add(new Obstacle(50, 350));
  obstacles.add(new Obstacle(50, 450));
  obstacles.add(new Obstacle(50, 550));
  obstacles.add(new Obstacle(150, 50));
  obstacles.add(new Obstacle(250, 50));
  obstacles.add(new Obstacle(350, 50));
  obstacles.add(new Obstacle(450, 50));
  obstacles.add(new Obstacle(550, 50));
  obstacles.add(new Obstacle(550, 150));
  obstacles.add(new Obstacle(550, 250));
  obstacles.add(new Obstacle(550, 350));
  obstacles.add(new Obstacle(550, 450));
  obstacles.add(new Obstacle(550, 550));
  obstacles.add(new Obstacle(250, 250));
  obstacles.add(new Obstacle(250, 350));
  obstacles.add(new Obstacle(350, 250));
  obstacles.add(new Obstacle(350, 350));
  obstacles.add(new Obstacle(150, 550));
  obstacles.add(new Obstacle(250, 550));
  obstacles.add(new Obstacle(350, 550));
  obstacles.add(new Obstacle(450, 550));
  powerUps.add(new FreezeBomb((int)(300*Math.random()+150),150));
  powerUps.add(new FreezeBomb((int)(300*Math.random()+150),450));
  powerUps.add(new SpeedBoost(450,(int)(300*Math.random()+150)));
  for (int i = 0; i < 3; i++) {
    enemies.add(new AICar(150, random(150, 450)));
  }
  
}

void draw() {
   background(255);
  
  // We must always step through time!
  box2d.step();
  
  b.display();
  for (Obstacle obs: obstacles) {
    obs.display();
  }

  
  for (PowerUp p:powerUps) {
    if(p.getIsShown()) {
      p.display();
    }
    if(p.getIsShown() && b.intersect(p)) {
      if(p.getType() == 'f') {
        for (AICar d3 : enemies) {
          d3.stop();
        }
        p.setIsShown(false);
      } else if (p.getType() == 'b') {
        b.boost();
        p.setIsShown(false);
      }
    }
  }
  for (AICar d3 : enemies) {
    d3.display(b);
  }

  
}