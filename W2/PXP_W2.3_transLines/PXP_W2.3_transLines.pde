int rotationAngle = 30;

float x1, y1;
float x2, y2;
float x3, y3;
float x4, y4;
float x5, y5;

float xoff = 0;
float yoff = 0;
float angle = 0;

void setup() {
  size(1000, 800);
  background(0);
  noStroke();
}

void draw() {
  translate(width/2, height/2);
  
  /*float d1 = map(noise(xoff), 0, 1, 0, 300);
  x1 = sin(angle) * d1;
  y1 = sin(angle) * d1;
  for (int i=0; i<360; i+=(rotationAngle/2)) {
    fill(200, 100);
    ellipse(x1, y1, 1, 1);
    rotate(radians(rotationAngle/2));
  }*/
  
  float d2 = map(noise(xoff), 0, 1, 100, 300);
  x2 = sin(angle) * d2;
  y2 = cos(angle) * d2;
  for (int j=0; j<360; j+=rotationAngle) {
    fill(200, 100);
    ellipse(x2, y2, 1, 1);
    rotate(radians(rotationAngle));
  }
  
  float d3 = map(noise(xoff), 0, 1, 100, 150);
  x3 = sin(angle) * 50;
  y3 = cos(angle) * d3;
  for (int k=0; k<360; k+=rotationAngle) {
    fill(200, 100);
    ellipse(x3, y3, 1, 1);
    rotate(radians(rotationAngle));
  }
  
  float d4 = map(noise(xoff), 0, 1, 10, 50);
  x4 = sin(angle) * 50;
  y4 = cos(angle) * d4;
  for (int l=0; l<360; l+=rotationAngle) {
    fill(200, 100);
    ellipse(x4, y4, 1, 1);
    rotate(radians(rotationAngle));
  }
  
  float d5 = map(noise(xoff), 0, 1, 10, 100);
  x5 = sin(angle) * 50;
  y5 = sin(angle) * d5;
  for (int m=0; m<360; m+=rotationAngle) {
    fill(200, 100);
    ellipse(x5, y5, 1, 1);
    rotate(radians(rotationAngle));
  }
  
  angle += 0.01;
  xoff += 0.02;
}