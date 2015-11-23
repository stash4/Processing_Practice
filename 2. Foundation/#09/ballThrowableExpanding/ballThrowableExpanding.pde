final float vx0min = -7;
final float vx0max = 5;
final float vy0min = 4;
final float vy0max = 15;
final float fps = 60;
final float gravity = 9.8 / fps;
final float elas = 0.98;
final float d0 = 40;
final float dPlus0 = 0.1;
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
  ball0.setDFlag(false);
  ball0.setDPlus(dPlus0);
  ball0.setElas(elas);
  ball0.setGravity(gravity);
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
  float d;
  boolean dFlag;
  float dPlus;
  float elas;
  float gravity;
  float hue;
  float x;
  float y;
  float vx;
  float vy;
  
  float getD(){
    return d;
  }
  void setD(float a){
    d = a;
  }
  void setDFlag(boolean a){
    dFlag = a;
  }
  void setDPlus(float a){
    dPlus = a;
  }
  void setElas(float a){
    elas = a;
  }
  void setGravity(float a){
    gravity = a;
  }
  void setHue(float a){
    hue = a;
  }
  void setX(float a){
    x = a;
  }
  void setY(float a){
    y = a;
  }
  void setVx(float a){
    vx = a;
  }
  void setVy(float a){
    vy = a;
  }
  
  void move(){
    float dX = x - mouseX;
    float dY = y - mouseY;
    if(dX * dX + dY * dY < (d / 2) * (d / 2)){
      vx = mouseX - pmouseX;
      vy = mouseY - pmouseY;
      hue = 200;
      if(!dFlag){
        dPlus = -dPlus;
        dFlag = true;
      }
      d += dPlus;
    }else{
      dFlag = false;
      x += vx;
      vy += gravity;
      y  += vy;
      if (x < d / 2) {
        vx = - vx * elas;
        x = d / 2;
      }else if (x > width - d / 2) {
        vx = - vx  * elas;
        x = width - d / 2;
        }
        if (y > height - d / 2) {
          vy = - vy * elas;
          y = height - d / 2;
        }else if (y < d / 2) {
          vy = - vy * elas;
          y = d / 2;
        }
        hue = 360;
      }
    }
  void draw(){
    fill(hue, 100, 100);
    ellipse(x, y, d, d);
  }
}
