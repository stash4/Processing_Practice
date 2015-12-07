final float vx0min = -7;
final float vx0max = 5;
final float vy0min = 4;
final float vy0max = 15;
final float fps = 60;
final float hueMax = 360.0;

Ball ball0;

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  fill(0, 0, 0);
  ball0 = new Ball();
}

void draw() {
  background(0, 0, 100);
  ball0.move();
  ball0.draw();
}

class Ball{
  final float gravity = 9.8 / fps;
  final float elas = 0.98;
  int bounds = 0;
  float d = 40;
  float hue;
  float x;
  float y;
  float vx;
  float vy;
  
  Ball(float x, float y,float vx, float vy){
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
  }
  Ball(){
    x = random(d / 2, width - d / 2);
    y = random(d / 2, height / 5);
    vx = random(vx0min, vx0max);
    vy = random(vy0min, vy0max);
  }
  
  void move(){
    x  += vx;
    vy += gravity;
    y  += vy;
    if (x < d / 2) {
      vx = - vx * elas;
      x = d / 2;
    } else if (x > width - d / 2) {
      vx = - vx  * elas;
      x = width - d / 2;
    }
    if (y > height - d / 2) {
      vy = - vy * elas;
      y = height - d / 2;
      bounds++;
    } else if (y < d / 2) {
      vy = - vy * elas;
      y = d / 2;
    }
    if(bounds > 3){
      hue = random(0, 360);
      bounds = 0;
    }
  }
  void draw(){
    fill(hue, 100, 100);
    ellipse(x, y, d, d);
  }
}
