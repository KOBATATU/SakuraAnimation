class Rain {
  float[] random_X;
  float[] y_height;
  float[] speed;
  float[] random_wind;
  boolean wind;

  Rain(int seed) {
    this.random_X = new float[seed];
    this.y_height = new float[seed];
    this.speed = new float[seed];
    this.random_wind = new float[seed];
    for (int i =0; i<random_X.length; i++) {
      random_X[i] = (int)random(0, width);
      speed[i] = random(30, 60);
      y_height[i] = 0;
      random_wind[i] = random(20, 30);
    }
    this.wind = false;
  }

  void rain(float x,float y) {
    fill(#0C5CF7);
    noStroke();
    if(this.wind==false){
    ellipse(x, y, 8, 18);
    }else{
      ellipse(x,y,10,18);
  }
  }
  void add_wind(){
    this.wind = true;
    
  }
  
  void draw_rain() {
    for (int i=0; i<random_X.length; i++) {

      if (y_height[i] >= height) {
        y_height[i] = 0;
        random_X[i] = (int)random(0, width);
      } 
      rain(random_X[i],y_height[i]);

      y_height[i] += speed[i];
      if (this.wind == true) {
        random_X[i] +=random_wind[i];
      }
    }
  }
  
  
}
