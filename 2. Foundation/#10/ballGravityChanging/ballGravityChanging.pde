final float vx0min = -7;
final float vx0max = 3;
final float vy0min = 4;
final float vy0max = 10;
final float fps = 60;
final float d0 = 40;
final float hueMax = 360.0;

Ball ball0;

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  fill(0, 0, 0);
  ball0 = new Ball();
  ball0.setD(d0);
  ball0.setX(random(ball0.getD() / 2, width - ball0.getD() / 2));
  ball0.setY(random(ball0.getD() / 2, height / 5));
  ball0.setVx(random(vx0min, vx0max));
  ball0.setVy(random(vy0min, vy0max));
}

void draw() {
  background(0, 0, 100);
  ball0.move();
  ball0.draw();
}

class Ball{
  final float gravity = 9.8 / fps;
  final float elas = 0.60;
  float d;
  float hue;
  float x;
  float y;
  float vx;
  float vy;
  boolean grav = true;
  
  float getD(){
    return d;
  }
  void setD(float d){
    this.d = d;
  }
  void setHue(float hue){
    this.hue = hue;
  }
  void setX(float x){
    this.x = x;
  }
  void setY(float y){
    this.y = y;
  }
  void setVx(float vx){
    this.vx = vx;
  }
  void setVy(float vy){
    this.vy = vy;
  }
  
  void move(){
    x  += vx;
    y  += vy;
    if (x < d / 2) {
      vx = - vx * elas;
      x = d / 2;
    } else if (x > width - d / 2) {
      vx = - vx  * elas;
      x = width - d / 2;
      grav = true;
    }
    if (y > height - d / 2) {
      vy = - vy * elas;
      y = height - d / 2;
      grav = false;
    } else if (y < d / 2) {
      vy = - vy * elas;
      y = d / 2;
    }
    if(grav){
      vy += gravity;
      hue = 200;
    }else{
      vx += gravity;
      hue = 0;
    }
  }
  void draw(){
    fill(hue, 100, 100);
    ellipse(x, y, d, d);
  }
}
