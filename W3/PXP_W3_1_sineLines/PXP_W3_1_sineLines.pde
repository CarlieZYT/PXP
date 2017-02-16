float scrollX= 0, scrollY=0;
float xoff = 0;
float yoff = 0;

void setup() {
  size(1000, 800);  
}  

void draw() {
  background (0);
  loadPixels();
  
  scrollX= scrollX + map(noise(xoff), 0, 1, 10, 15);
  scrollY= (map(noise(yoff), 0, 1, 10, 15))% height;

  //for (int x= mouseX; x< width; x++) {
  //  for (int y= 0; y< height; y++) {
  //    int thisPixel = x+y*width;
  //    float sinX = sin((x+scrollY)/(float)(mouseX+1+y/10));         
  //    sinX =map (sinX, -1, 1, 0, 255);
  //    pixels[thisPixel]= color(x, y, sinX);
  //  }
  //}
  
  for (int x= 0; x< width; x++) {   
    for (int y= 0; y< height; y++) {
      int thisPixel = x+y*width; 
      float sinY = sin((y+scrollX)/(float)(mouseX-200+x/10));         
      sinY =map (sinY, -1, 1, 0, 255);
      //println(thisPixel);
      pixels[thisPixel]= color(x/4, sinY, mouseY/4);
    }
  }
  updatePixels();
  println(frameRate);
  
  xoff += 0.2;
  yoff += 0.2;
}