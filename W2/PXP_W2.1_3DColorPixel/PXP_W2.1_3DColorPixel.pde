int cellSize = 30;
float centerX = 500;
float centerY = 400;
float goalX = 500;
float goalY = 400;
int speed = 1;

void setup() {
  size(1000, 800, P3D);
}

void draw() {
  lights();
  float bgColor = map(mouseY, 0, 800, 150, 200);
  background(bgColor);
  noStroke();
  
  //fill(255);
  //ellipse(goalX, goalY, 10, 10);
  for(int x = 0; x < width; x += cellSize) {
    for(int y = 0; y < height; y += cellSize) {
      float distanceToMouse = dist(x, y, centerX, centerY);
      pushMatrix();
      translate(x, y);
      fill(x/4, y/4, mouseX/4, 255 - distanceToMouse/1.4);
      rotateX(distanceToMouse/60.00);
      rect(0, 0, cellSize, cellSize);
      popMatrix();
    }
  }
  
  if ((centerX-goalX)<5 & (centerY-goalY)<5) {
    goalX = random(width);
    goalY = random(height);
  }
  float a = atan2(goalX-centerX, goalY-centerY);
  centerX += speed*sin(a);
  centerY += speed*cos(a);
  
  //if(centerX < 0){
  //  centerX += random(0,1);
  //} else if (centerX > width){
  //  centerX += random(-1,0);
  //} else if(centerY<0){
  //  centerY += random(0,1);
  //} else if(centerY>height){
  //  centerY += random(-1,0);
  //} else {
  //  centerX += random(-2,3);
  //  centerY += random(-2,3);
  //}
}