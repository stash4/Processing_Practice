final float vx0min = -7;
final float vx0max = 3;
final float vy0min = 4;
final float vy0max = 10;
final float fps = 60;
final float d0 = 40;
final float hueMax = 360.0;

int n = 2;

Ball[] balls = new Ball[n];

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  fill(0, 0, 0);
  for(int i = 0; i < n; i++){
    balls[i] = new Ball();
    balls[i].setD(d0);
    balls[i].setX(random(balls[i].getD() / 2, width - balls[i].getD() / 2));
    balls[i].setY(random(balls[i].getD() / 2, height / 5));
    balls[i].setVx(random(vx0min, vx0max));
    balls[i].setVy(random(vy0min, vy0max));
  }
  balls[0].setBright(0);
  balls[1].setHue(200);
}

void draw() {
  background(0, 0, 100);
  balls[0].move();
  balls[1].moveWithOther(balls[0]);
  balls[0].draw();
  balls[1].draw();
}

class Ball{
  final float gravity = 9.8 / fps;
  final float elas = 0.98;
  float d;
  float hue;
  float bright = 100;
  float x;
  float y;
  float vx;
  float vy;
  
  float getD(){
    return d;
  }
  void setD(float d){
    this.d = d;
  }
  void setHue(float hue){
    this.hue = hue;
  }
  void setBright(float bright){
    this.bright = bright;
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
    } else if (y < d / 2) {
      vy = - vy * elas;
      y = d / 2;
    }
  }
  void moveWithOther(Ball other){
    if(x < other.x){
      vx += gravity / 3;
    }else if(x > other.x){
      vx -= gravity / 3;
    }
    if(y < other.y){
      vy += gravity / 3;
    }else if(y > other.y){
      vy -= gravity / 3;
    }
    x  += vx;
    y  += vy;
    if (x < d / 2) {
      vx = - vx * elas / 2;
      x = d / 2;
    } else if (x > width - d / 2) {
      vx = - vx  * elas / 2;
      x = width - d / 2;
    }
    if (y > height - d / 2) {
      vy = - vy * elas / 2;
      y = height - d / 2;
    } else if (y < d / 2) {
      vy = - vy * elas / 2;
      y = d / 2;
    }
  }
  void draw(){
    fill(hue, 100, bright);
    ellipse(x, y, d, d);
  }
}
