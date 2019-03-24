class Sun {
  color sun;
  color inside;
  float x;
  float y;
  float radius1;
  float radius2;
  int npoints;
  float alpha_size;

  Sun() {
    sun = #FFA805;
    inside = #FFB700;
    this.x = 0;
    this.y = 0;
    this.radius1 = 50;
    this.radius2 = 70;
    this.npoints = 10;
    this.alpha_size = 0.1;
  }
  
  void add_alpha(float add){
    this.alpha_size += add;
  }
  
  
  void draw_sun() {


    pushMatrix();
    translate(width*0.8, height*0.1);
    rotate(frameCount / 100.0);
    noStroke();
    star(); 

    popMatrix();

    //yellow sun interior
    fill(sun, alpha_size);
    ellipse(width*0.8, height*0.1, 80, 80);
  }

  void star() {
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      vertex(sx, sy);
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);

      fill(inside, alpha_size);
    }

    endShape(CLOSE);
  }
}