// The world pixel by pixel 2017 spring
// Carlie Yutong Zhang
// github.com/CarlieZYT/PXP
// Modified on Daniel Rozin's codes
import processing.video.*;

PxPixel bottomPixel = new PxPixel();
PxPixel topPixel = new PxPixel();
PImage myImage;
Capture myVideo;

void setup() {
  size(1280, 720);
  frameRate(120);
  //image
  myImage= loadImage("http://dreamatico.com/data_images/flowers/flowers-4.jpg");
  myImage.resize (width, height);
  myImage.loadPixels();
  
  //video
  myVideo = new Capture(this, width, height);
  myVideo.start();
  //noCursor();   
}

void draw() {
  if (myVideo.available())  myVideo.read(); 
  myVideo.loadPixels();
  loadPixels();
  for (int x = 0; x<width; x++) {
    for (int y = 0; y<height; y++) {
      bottomPixel.getPixel(x, y, myImage.pixels, width);      // get pixel of bottom layer
      topPixel.getPixel(x, y, myVideo.pixels, width);         // get pixel of top layer
      
      int R, G, B;
      
      // condition based on thresholdAmont
      int thresholdAmont = max(1, mouseX);            // set thresholdAmont
      thresholdAmont = int(map(thresholdAmont, 0, width, 0, 512));
      if ((topPixel.R+topPixel.R+topPixel.B)  <thresholdAmont) {              
        R = bottomPixel.R;
        G = bottomPixel.G;
        B = bottomPixel.B;
      } else {
        R = topPixel.R + mouseX;
        G = topPixel.G + mouseY;
        B = 255 - topPixel.B;
      }
      topPixel.setPixel(x, y, R, G, B, 255, pixels, width);
    }
  }
  updatePixels(); 
  println (frameRate);
}


class PxPixel {
  int R, G, B, A;

  void getPixel(int x, int y, int[] pixelArray, int pixelsWidth) {
    int thisPixel=pixelArray[x+y*pixelsWidth];
    A = (thisPixel >> 24) & 0xFF;                  // we need to shift and mask to get each component alone
    R = (thisPixel >> 16) & 0xFF;                  // this is faster than calling red(), green() , blue()
    G = (thisPixel >> 8) & 0xFF;   
    B = thisPixel & 0xFF;
  }

  void setPixel(int x, int y, int r, int g, int b, int a, int[] pixelArray, int pixelsWidth) {
    a =(a << 24);                       
    r = r << 16;                       // We are packing all 4 composents into one int
    g = g << 8;                        // so we need to shift them to their places
    color argb = a | r | g | b;
    pixelArray[x+y*pixelsWidth]= argb;    // finaly we set the int with te colors into the pixels[]
  }
}