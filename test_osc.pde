import netP5.*;
import oscP5.*;

OscP5 oscP5 ;
NetAddress myRemoteLocation;

int red = 0;
int green = 0;
int blue = 0 ;
int s = 400 ;

void setup () {
 size (400,400) ;
 frameRate(25);
 oscP5 = new OscP5 ( this ,12000 ) ;
 myRemoteLocation =new NetAddress("127.0.0.1" ,12000);
 
}

void draw () {
  background(red,green,blue );
 fill (s);
  rect(s,s,s,s);
  
}

void oscEvent(OscMessage theOscMessage ) {
  red = theOscMessage.get(0).intValue();
  green = theOscMessage.get(1).intValue();
  blue = theOscMessage.get(2).intValue();
  s = theOscMessage.get(2).intValue();
  println(red, "  " , green , "  " , blue );
}

 
 
