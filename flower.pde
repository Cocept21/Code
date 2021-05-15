//The flower is rotating anf changes position according to the beat in superCollider



//import library
import netP5.*;
import oscP5.*;

Shape2D flower = new Shape2D(20);
float position_x =450;//starting position x of the flower 
float position_y=450;//starting position x of the flower 
float fill = 255;
OscP5 osc5;


void setup(){
  size(600,600);
  OscProperties osc_properties = new OscProperties();
  osc_properties.setListeningPort(47120);
  osc5 = new OscP5(this ,osc_properties );
  }

float rot_angle;
float angle = 0;
float speed = 0.03;
float amplitude = 200;

void oscEvent(OscMessage msg ) {
  if (msg.checkAddrPattern("/change_position")) {//if message change position received
  position_x = random (400);//choose a random number for position_x from 0-400
  position_y = random (400);//choose a random number for position_x from 0-400
  }
 
}

void draw(){
  fill(255,30);
  rect(0,0,width,height);
  
  float x = cos(angle) * amplitude;
  float y = sin(angle) * amplitude;
  angle += speed;
  rot_angle = radians(frameCount *3);
  translate(position_x/2,position_y/2);
  flower.update_pos(x,y,rot_angle);
  flower.draw();
  
  
}
