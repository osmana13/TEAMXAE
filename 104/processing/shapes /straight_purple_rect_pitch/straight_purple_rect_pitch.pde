import processing.serial.*;

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

PImage img;  
Serial myPort;

void setup() {
  
  //set these to the size of the image
  size(512,512);
  
  //this is the name of your image file saved in the data folder in your
  //processing folder see processing.org for help
  
  img = loadImage("RGBR.png");
  
  //the [0] may be [another number] on your computer
  myPort = new Serial(this, Serial.list()[2], 9600);
  
    /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12000);
  oscP5.plug(this, "dosomethingwithpitch","wii/pitch");



  myRemoteLocation = new NetAddress("127.0.0.1",57120);
}

float redx;

int r = 255;
int g = 255;

public void dosomethingwithpitch(float theValueA) {
   redx = int(theValueA*255);
   Pitch = theValueA;
   println(int(r));
   
   myPort.write("CL");
   myPort.write(r);
   myPort.write(g); 
   myPort.write(int(0)); 
   
   println("accelerometer pitch = "+theValueA+"");  
}


Float Pitch = 0.4;




void draw() {

  rect(Pitch*width,60, 60, 60, 60);
  fill(200,100,255);
  stroke(100);
  
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  if(theOscMessage.isPlugged()==false) {
  /* print the address pattern and the typetag of the received OscMessage */
  println("### received an osc message.");
  println("### addrpattern\t"+theOscMessage.addrPattern());
  println("### typetag\t"+theOscMessage.typetag());
  println(theOscMessage.get(0).floatValue());
  
  
  }
  
}

void mousePressed() 
{
  println(img.pixels[mouseX+mouseY*img.width]);
 myPort.write("CL");
 myPort.write(int(red(img.pixels[mouseX+mouseY*img.width])));
 myPort.write(int(green(img.pixels[mouseX+mouseY*img.width]))); 
 myPort.write(int(blue(img.pixels[mouseX+mouseY*img.width]))); 
}