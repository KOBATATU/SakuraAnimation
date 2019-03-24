class Cloud {
  float xstart;
  float ystart;
  float ynoise;
  float xnoise;
  float seed;
  float cloud_s;
  Cloud() {
    this.xstart = random(10);
    this.ystart = random(10);
    this.cloud_s = 0.1;
  }


  void add_alpha(float seed) {
    this.seed += seed;
  }
  void add_clouds(float size){
    this.cloud_s += size;
  }
  
  void diff_alpha(float seed){
    this.seed -= seed;
  }

  void cloud() {
    smooth();
    xstart += 0.01;   
    ystart += 0.01;  

    xnoise = xstart;
    ynoise = ystart;

    for (int y = 0; y <= height*cloud_s; y+=5) {
      ynoise += 0.1;
      xnoise = xstart;
      for (int x = 0; x <= width; x+=5) {
        xnoise += 0.1;
        drawPoint(x, y, noise(xnoise, ynoise), seed);
      }
    }
  }

  void drawPoint(float x, float y, float noiseFactor, float alpha_seed) {
    pushMatrix();
    translate(x, y);
    rotate(noiseFactor * radians(540));
    noStroke();
    float edgeSize = noiseFactor * 35;
    float grey = 150 + (noiseFactor * 120);
    float alph = alpha_seed + (noiseFactor * 5);
    fill(grey, alph);
    ellipse(0, 0, edgeSize, edgeSize/2);
    popMatrix();
  }

}