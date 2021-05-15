import netP5.*;
import oscP5.*;

float[] x = new float[100];
float[] y = new float[100];
float[] speed = new float[100];

OscP5 osc5;

void setup() {
  size(800, 800);
  background(0);
  stroke(255);
  strokeWeight(5);

  OscProperties osc_properties = new OscProperties();
  osc_properties.setListeningPort(47120);
  osc5 = new OscP5(this ,osc_properties );
  
}

void oscEvent(OscMessage msg ) {
  if (msg.checkAddrPattern("/change_position")) {
  
  int i = 0;
  while(i < 100) {  
    x[i] = random(0, width);
    y[i] = random(0, height);
    speed[i] = random(1, 5);
    i = i + 1;
  }
}}

void draw() {
  background(0,0,0,0);
  translate(width/2,height/2);
  
  int i = 0;
  while(i < 100) {
    stroke(random(i),random(i),random(i));
    noFill();
    ellipse(20, 20,x[i], y[i]);
  
    x[i] = x[i] - speed[i];
    if(x[i] < 0) {
      x[i] = width;
    }
    i = i + 5;
  }
}
