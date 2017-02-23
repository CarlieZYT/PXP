ArrayList <Particle> particles = new ArrayList<Particle>();

void setup(){
  background(0);
  //blendMode(ADD);
  size(1000, 800);
}

void draw(){
  background(100);
  
  //particles
  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle part = particles.get(i);
    part.move();
    part.display();
    part.dieing();
     if (part.life < 0) {
      particles.remove(i);
    }
  }
}

void mouseDragged() {
  Particle tempParticle = new Particle();
  particles.add(tempParticle);
}

/*********************************Particle class*********************************/
class Particle {
  float maxDistance,
        radius,
        angle,
        rotation,
        life;
  
  PVector speed, position, oPosition;
  
  Particle() {
    maxDistance = 200;
    angle = 0;
    life = 255;
    rotation = random(-5, 5);
    radius = random(30, 500);
    
    position = new PVector(mouseX, mouseY);
    oPosition = new PVector(mouseX, mouseY);
  }
  
  void move() {
    speed = new PVector(radius * cos(radians(angle)), radius * sin(radians(angle)));
    position.set(oPosition.x + speed.x, oPosition.y + speed.y);
    
    //println(speed);
    angle += rotation;
  }
  
  void display() {
    fill(255, 100, 100, life);
    noStroke();
    ellipse(position.x, position.y, 3,3);
    noFill();
    stroke(255, 100, 100, life);
    strokeWeight(.5);
    line(position.x, position.y, oPosition.x, oPosition.y);
  }
  
  void dieing() {
    life -= 1;
  }
}