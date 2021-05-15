class Shape2D {
  
  int flower_size;
  float posx;
  float posy;
  float rot_angle;
  
  Shape2D(int size) {
    flower_size=size;
  }
  
  void update_pos(float x,float y, float angle) {
    posx=x;
    posy=y;
    rot_angle = angle;
  }
  
  void draw() {
    pushMatrix();
    translate(posx,posy);
    rotate(rot_angle);
    draw_flower();
    popMatrix();
  }
  
  void draw_flower() {
    for(int j=0; j<10; ++j) {
      scale(0.80); 
      fill(j*15,j*60,j*20);
      float size=flower_size;
      flower(size);
      
  
  }
  }
  //draw final shape
  void flower(float size) {
   
    beginShape();
    vertex(0,0);
    bezierVertex(8*size, 0*size, 5*size, -13*size, 0, 0);
    bezierVertex(-8*size, 0*size, -5*size, -13*size, 0, 0);
    bezierVertex(-8*size, 0*size, -5*size, 13*size, 0, 0);
    bezierVertex(8*size, 0*size, 5*size, 13*size, 0, 0);
    
    
    endShape(); 
    
  }
    
}    
  
