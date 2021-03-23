

import gab.opencv.*;
import java.awt.*;
import processing.video.*;


PImage miImagen;
PImage emoji;
Movie movie;
OpenCV opencv;

void setup() {
  size(900, 900);
  background(255);



  movie = new Movie(this, "video.mp4");
  movie.loop();

  miImagen = loadImage("fotin.jpg");
  emoji = loadImage("emoji.png");

  opencv = new OpenCV(this, width, height);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
}

void draw() {

  //background(255);
  movie.loop();
  opencv.loadImage(miImagen);
  image(miImagen, 0, 0);





  Rectangle[] faces = opencv.detect();



  for (int i = 0; i < faces.length; i++) {
    float x = faces[i].x;
    float y = faces[i].y;
    float ancho = faces[i].width;
    float alto = faces[i].height;

    strokeWeight(1);
    stroke(255, 0, 0);
    noFill();
    rect(x, y, ancho, alto);


    for (int j = 0; j<200; j+=10) {
      strokeWeight(20);
      float xVal = map(sin(frameCount*0.1+i+j*0.01), -1, 1, -j, j);
      copy(miImagen, int(x), int(y), int(ancho), int(alto), int(x+xVal), int(y), int(ancho), int(alto));
    }


    //copy(miImagen, int(x), int(y), int(ancho), int(alto), int(x), int(y), int(ancho), int(alto));
  }
}



void movieEvent(Movie m) {
  m.read();
}
