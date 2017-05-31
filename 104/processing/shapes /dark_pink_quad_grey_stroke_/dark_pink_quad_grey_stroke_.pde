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
  oscP5.plug(this, "dosomethingwithroll","wii/roll");
  oscP5.plug(this, "dosomethingwithroll","wii/yaw");
  //oscP5.plug(this, "dosomethingwithbuttonA","/wii/1/button/Right");


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

public void dosomethingwithroll(float theValueA) {
  println("accelerometer roll = "+theValueA+"");  
  Roll = theValueA;
}


Float Pitch = 0.2;
Float Roll = 0.2;
Float Yaw = 0.2;


void draw() {
  //background(0);
  //image(img,0,0);
  //img.loadPixels();
  quad(Pitch*width, Roll*width, Yaw*width,60,40,40,120,80);
  fill(255,150,158); 
  // dark pink
  stroke(150);
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