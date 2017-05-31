import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import codeanticode.syphon.SyphonServer; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_170524a extends PApplet {


PGraphics canvas ;
SyphonServer server;

public void setup() {
  
  canvas = createGraphics(400,400, P3D);
  
server = new SyphonServer(this, "Processing Syphon");
}

public void draw() {
canvas.beginDraw();
canvas.background(mouseY);
canvas.line(50, 50, mouseX, mouseY);
canvas.endDraw();
image(canvas, 0, 0);

server.sendImage(canvas);
}
  public void settings() {  size(400,400, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_170524a" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
