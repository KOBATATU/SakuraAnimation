
float Bright = 0;

Tree tree;
Cloud cloud;
Rain rain;
Sun sun;
Sakura[] sakura = new Sakura[100];

void setup() {
  size(1200, 800);
  smooth();
  noStroke();

  frameRate(5);
  colorMode(HSB, 360, 100, 100, 100);
  tree = new Tree(0.75, 20, 40, 5);
  rain = new Rain(60);
  cloud = new Cloud();
  sun = new Sun();
  for (int i =0; i<sakura.length; i++) {
    sakura[i] = new Sakura();
  }
}



void draw() {
  main_method();
}

void main_method() {

  if (frameCount<40) {
    Bright+=1; 
    noStroke(); 
    fill(185, 98, Bright, 80); 
    rect(0, 0, width, height); 
    tree.add_initLength(0.8); 
    tree.draw_a();
  } else if (frameCount < 100) {
    Bright+=0; 
    noStroke(); 
    fill(185, 98, Bright, 80); 
    rect(0, 0, width, height); 


    tree.change_theta(25, 30); 
    tree.add_initLength(0.3); 
    tree.draw_a(); 
    rain.draw_rain(); 
    cloud.add_alpha(1.0); 
    cloud.add_clouds(0.002); 
    cloud.cloud();
  } else if (frameCount < 150) {
    Bright+=0.07; 
    fill(185, 98, Bright, 80); 
    rect(-10, -10, width+100, height+100); 
    tree.add_initLength(0.4); 
    tree.add_theta(0.1); 
    tree.draw_a(); 


    rain.add_wind(); 
    rain.draw_rain(); 

    cloud.diff_alpha(0.3); 
    cloud.cloud();
  } else if (frameCount <250) {
    Bright+=0.4; 
    fill(185, 98, Bright, 40); 
    rect(-10, -10, width+100, height+100); 
    tree.add_initLength(0.4); 
    tree.draw_a(); 

    cloud.diff_alpha(0.6); 
    cloud.cloud(); 

    sun.add_alpha(0.7); 
    sun.draw_sun();
  } else if (frameCount < 400) {
    fill(185, 98, Bright, 40); 
    rect(-10, -10, width+100, height+100); 
    tree.add_initLength(0.4); 
    tree.draw_a(); 
    sun.draw_sun();
    
    for(int i =0;i<sakura.length;i++){
      sakura[i].sakura_draw();
      sakura[i].move();
    }
  }
}