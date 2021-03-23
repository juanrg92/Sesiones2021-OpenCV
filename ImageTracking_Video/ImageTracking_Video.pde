import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;


PImage emoji;

import processing.video.*;

Movie movie;

void setup() {
  size(1104, 464);
  background(0);

  emoji = loadImage("emoji.png");

  // Load and play the video in a loop
  movie = new Movie(this, "video.mp4");
  movie.loop();
  opencv = new OpenCV(this, width, height);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {

  opencv.loadImage(movie);
  movie.loop();

  image(movie, 0, 0);

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  //println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    image(emoji, faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}
