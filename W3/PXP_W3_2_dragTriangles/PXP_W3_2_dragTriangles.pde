// Modified based on Craig's sketch

ArrayList <Particle> particles = new ArrayList<Particle>(); // particles
ArrayList < Triangle > triangles = new ArrayList<Triangle>(); 

float angle;

void setup() {
  background(0);
  blendMode(ADD);
  size(1024, 768, P2D); 
  
  angle = 0; 
}

void draw() {
  background(100);

  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle part = particles.get(i);
    part.move();
    //part.render();
    part.dieing();
     if (part.life < 0) {
      particles.remove(i);
    }
  }
  
  Particle thisParticle, otherParticle;
  for (int i = 0; i < particles.size(); i++) {
    thisParticle = particles.get(i); 
    
    thisParticle.neighbours = new ArrayList<Particle>();
    thisParticle.neighbours.add(thisParticle);

    for (int j = 0; j < particles.size(); j++) {
      otherParticle = particles.get(j);
      
      float dist = PVector.dist( thisParticle.position, otherParticle.position);
      if ( dist > 0 && dist < thisParticle.maxDistance) thisParticle.neighbours.add(otherParticle);
    }

    if (thisParticle.neighbours.size() > 2) {
      addTriangle(thisParticle.neighbours);
    }
  }

  drawTriangles();
  triangles.clear(); 
  
  angle += 0.01;
}

void mouseDragged() {
  Particle tempParticle = new Particle();
  particles.add(tempParticle);
}


void addTriangle(ArrayList<Particle> neighboursList){
   int sizeOfList = neighboursList.size();
   if ( sizeOfList > 2) {
     for ( int i = 0; i < sizeOfList - 1; i++) {
       for (int j = i + 1; j < sizeOfList; j++){
         triangles.add(new Triangle(neighboursList.get(0).position, neighboursList.get(i).position, neighboursList.get(j).position ) );
       } 
     }     
   }  
} // end of addTriangle


void drawTriangles() {
  float r = abs(sin(angle)) * 255;
  float g = abs(cos(angle)) * 255;
  float b = abs(sin(angle)) * 255;
 
  color myColor = color(r,g,b, 1);
  noStroke();
  fill(myColor);
  
  beginShape(TRIANGLES);
    for (int i = 0; i < triangles.size(); i++){
      Triangle t = triangles.get(i);
      t.display();
    }
  endShape();
}

// -------------------- PARTICLE CLASS ----------------------- //
class Particle {
  float radius, 
        maxSpeed, 
        maxDistance,
        life;
        
  PVector velocity, acceleration, position;
  
  ArrayList<Particle> neighbours;
  
  Particle(){
   radius = 4;
   maxSpeed = 5;
   maxDistance = 200;
   life = 255;
   
   velocity = new PVector( random (-maxSpeed, maxSpeed), random (-maxSpeed, maxSpeed)  );
   acceleration = new PVector(0,0);
   position = new PVector( mouseX, mouseY );  
  }
  
  void move(){
    if (position.x < 0) position.x = width;
    if (position.x > width) position.x = 0;
    if (position.y > height) position.y = 0;
    if (position.y < 0 ) position.y = height;
    
    position.add(velocity);
  }
  
  void render() {
    fill(255);
    ellipse(position.x, position.y, 3,3);
  }
  
  void dieing() {
    life -= 5;
  }
}

// ----------------------- TRIANGLE CLASS -------------------------//

class Triangle {
 PVector a, b ,c;
 
 Triangle(PVector p1, PVector p2, PVector p3) {
  a = p1;
  b = p2;
  c = p3;
 }
 
  void display(){
   vertex(a.x, a.y);
   vertex(b.x, b.y);
   vertex(c.x, c.y);
  }
}