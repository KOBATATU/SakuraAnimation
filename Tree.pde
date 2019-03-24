class Tree {
  float reducedScale;
  float theta_min;
  float theta_max;
  float initLength;
  float sakura_color;
  boolean color_leaf;
  
  Tree(float ThisScale, float This_theta_min, float This_theta_max, float This_initLength) {
    this.reducedScale = ThisScale;
    this.theta_min = This_theta_min;
    this.theta_max = This_theta_max;
    this.initLength = This_initLength;
    this.color_leaf = true;
  }

  void branch(float h) {
    //枝の長さを縮小
    h *= reducedScale;

    if (h>3) {
      //右
      pushMatrix();
      rotate(radians(random(theta_min, theta_max)));
      setColorAndWeight(h);
      line(0, 0, 0, -h);
      translate(0, -h);
      branch(h);
      popMatrix();

      //左
      pushMatrix();
      rotate(-radians(random(theta_min, theta_max)));
      setColorAndWeight(h);
      line(0, 0, 0, -h);
      translate(0, -h);
      branch(h);
      popMatrix();
    }
  }

  void setColorAndWeight(float h) {
    if (h > 5) {
      strokeWeight(h * random(0.18, 0.2));
      stroke(0, 20, 40-(h*0.2));
    } else {
      strokeWeight(4);
      if(color_leaf){
      stroke(random(90,120), random(50, 100), random(70, 100));
    }else{
      stroke(random(90,120)+sakura_color, random(50, 100), random(70, 100));
      
      if(sakura_color < 200){
        sakura_color+=0.003;
      }
    }
  }
  }
  void add_initLength(float add) {
    initLength += add;
  }
  void add_theta(float add){
    theta_min += add;
    theta_max += add;

  }
  void change_theta(float theta_min, float theta_max) {
    this.theta_min = theta_min;
    this.theta_max = theta_max;
  }
  void change_color_sakura(){
    this.color_leaf = false;
  }

  void draw_a() {
    pushMatrix();
    setColorAndWeight(initLength);
    translate(width/2.0, height);
    line(0, 0, 0, -initLength);
    translate(0, -initLength);
    branch(initLength);
    popMatrix();
  }
}