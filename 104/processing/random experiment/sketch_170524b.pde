import processing.video.*;
Movie myMovie;

void setup() {
  size(200, 200);
  myMovie = new Movie(this, "A Day In The Life - Vlog #2.mov");
  myMovie.loop();
}

void draw() {
  tint(255, 20);
  image(myMovie, mouseX, mouseY);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}