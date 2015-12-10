Sun theSun;

void setup(){
  size(480, 480);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  theSun = new Sun(50, width / 2, height / 2);
}

void draw(){
  background(0, 0, 100);
  theSun.drawFigure();
}

class Sun{
  float d;
  float x;
  float y;  
  Earth theEarth;
  Sun(float d, float x, float y) {
    this.d = d;
    this.x = x;
    this.y = y;
    theEarth = new Earth(0.6 * d, 150, x, y);    // 直径および回転の半径と中心の位置を与える
  }
  void drawFigure(){
    theEarth.drawFigure();
    fill(30, 70, 100);
    ellipse(x, y, d, d);
  }
}

class Earth{
  float d;
  float r;
  float centerX;
  float centerY;
  float x;
  float y;
  float theta;
  Moon theMoon;
  Earth(float d, float r, float centerX, float centerY){
    this.d = d;
    this.r = r;
    this.centerX = centerX;
    this.centerY = centerY;
    theMoon = new Moon(0.4 * d, 40);
  }
  void drawFigure(){
    float rad = radians(theta);
    x = centerX + r * -cos(rad);
    y = centerY + r * sin(rad);
    theta++;
    fill(220, 90, 90);
    ellipse(x, y, d, d);
    theMoon.drawfigure(x, y);
  }
}

class Moon{
  float d;
  float r;
  float centerX;
  float centerY;
  float x;
  float y;
  float theta;
  Moon(float d, float r){
    this.d = d;
    this.r = r;
  }
  void drawfigure(float centerX, float centerY){
    float rad = radians(theta);
    x = centerX + r * -cos(rad);
    y = centerY + r * sin(rad);
    theta += 3;
    fill(60, 70, 90);
    ellipse(x, y, d, d);
  }
}
