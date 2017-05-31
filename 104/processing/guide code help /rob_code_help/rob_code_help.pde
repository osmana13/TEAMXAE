import processing.serial.*;

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(400,400);
  oscP5 = new OscP5(this,12001); // listen on port  12000
  oscP5.plug(this, "pythonLink","/some/osc/path/1", "sf");
  myRemoteLocation = new NetAddress("127.0.0.1",12001); // send to port 57120
}

void draw() {
  background(0);  
}

// below is the function which is triggered because the message is plugged "oscP5.plug" above
public void pythonLink(String theValueA, Float theValueB)
 {
 println(theValueA);
 println(theValueB); 
}

// this allows us to send an OSC message internally within Processing as a test
void mousePressed() {
  OscMessage myMessage = new OscMessage("/some/osc/path/1");
  myMessage.add("123"); /* add an float to the osc message */
  myMessage.add(45.6); /* add an FLoat to the osc message */
  /* send the message */
  oscP5.send(myMessage, myRemoteLocation); 
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* with theOscMessage.isPlugged() you check if the osc message has already been
   * forwarded to a plugged method. if theOscMessage.isPlugged()==true, it has already 
   * been forwared to another method in your sketch. theOscMessage.isPlugged() can 
   * be used for double posting but is not required. */
   
  if(theOscMessage.isPlugged()==false) {
  /* print the address pattern and the typetag of the received OscMessage */
  println("### received an osc message.");
  println("### addrpattern\t"+theOscMessage.addrPattern());
  println("### typetag\t"+theOscMessage.typetag());
  println(theOscMessage.get(0).stringValue());

  }
}