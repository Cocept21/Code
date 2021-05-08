import netP5.*;
import oscP5.*;

OscP5 osc5;
NetAddress supercollider;

float position_x = 250;
float position_y = 250;
float size = 200;

void setup() {
  size(500,500);
  OscProperties osc_properties = new OscProperties();
  osc_properties.setListeningPort(47120);
  osc5 = new OscP5(this, osc_properties);
}

void oscEvent(OscMessage msg) {
  if (msg.checkAddrPattern("/change_position")) {
    position_x = msg.get(0).floatValue();
    position_y = msg.get(1).floatValue();
    size = msg.get(2).floatValue();
  }
}

void draw() {
  background(0);
  fill(255);
  rect(position_x,position_y);
}
