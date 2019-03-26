
class Sakura {
  float n, A, md, r, x, y;
  float xAmp, xspeed, xTheta, ox, oy, rotateT, size,xDef,xSpeed;
  float ySpeed, sizeYScale, sizeYT, sizeYSpeed, c, R,aa;
  color[] colors;
  Sakura() {
    colors = new color[3];
    colors[0] = color(291, 23, 97);
    colors[1] = color(310, 13, 99);
    colors[2] = color(291, 18, 97);
    n = 4;

    this.xDef = random(width);

    this.xAmp = random(0, 100);
    this.xSpeed = random(2,6);
    this.xTheta = random(360);

    this.ox = this.xDef + this.xAmp * sin(radians(this.xTheta));
    this.oy = random(height);
    this.rotateT = random(360);
    this.size = random(20,40);

    this.ySpeed = this.size / 20;
    this.sizeYScale = 1;
    this.sizeYT = random(360);
    this.sizeYSpeed = this.size / 30;
    this.c = floor(random(3));
  }
  void sakura_draw() {
    fill(colors[int(this.c)]);
    
    pushMatrix();
    translate(this.ox, this.oy);
    rotate(radians(this.rotateT));
    beginShape();
    for (int t = 0; t < 360 / 4; t++) {
      A = n / PI * radians(t);

      md = floor(A) % 2;

      r = pow(-1, md) * (A - floor(A)) + md;
      if(r<0.8){
        aa = 0;
      }else{
        aa = 0.8-r;
      }
      
      R = r + 2*aa;

      x = this.size * R * cos(radians(t));
      y = this.size * this.sizeYScale * R * sin(radians(t));

      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
    
  }
  void move() {
    this.ox = this.xDef + this.xAmp * sin(radians(this.xTheta));
    this.xTheta += this.xSpeed;

    this.oy += this.ySpeed;
    this.sizeYT += this.sizeYSpeed;
    this.sizeYScale = abs(sin(radians(this.sizeYT)));

    if (this.oy > height + this.size) {
      this.oy = -this.size;
    }
  }


}
