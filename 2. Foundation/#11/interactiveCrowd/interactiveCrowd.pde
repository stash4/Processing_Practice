final float vx0min = -7;
final float vx0max = 5;
final float vy0min = 4;
final float vy0max = 15;
final float fps = 60;
final float hueMax = 360.0;
int ballCount;
int n = 200;
Ball[] balls = new Ball[n];

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  fill(0, 0, 0);
  balls[0] = new Ball();
  ballCount = 1;
}

void draw() {
  background(0, 0, 100);
  if(ballCount > 200){
    ballCount = 200;
  }
  for(int i = 0; i < ballCount; i++){
    balls[i].move();
    balls[i].draw();
  }
}

class Ball{
  final float gravity = 9.8 / fps;
  final float elas = 0.98;
  float d = 40;
  float hue;
  float x;
  float y;
  float vx;
  float vy;
  boolean isMouseIn = false;
  float rotation = 0;
  
  Ball(float d, float x, float y,float vx, float vy){
    this.d = d;
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    hue = (d * 9) % 360;
  }
  Ball(){
    x = random(d / 2, width - d / 2);
    y = random(d / 2, height / 5);
    vx = random(vx0min, vx0max);
    vy = random(vy0min, vy0max);
    hue = (d * 9) % 360;
  }
  
  void move(){
    float mx2 = (mouseX - x) * (mouseX - x);
    float my2 = (mouseY - y) * (mouseY - y);
    if(mx2 + my2 < d / 2 * d / 2){
      isMouseIn = true;
      rectMode(CENTER);
      pushMatrix();
      translate(x,y);
      rotate(radians(rotation));
      fill(hue, 100, 100);
      rect(0,0,d,d); //<>//
      popMatrix();
      if(mousePressed){
        rotation -= 5;
        x = mouseX;
        y = mouseY;
      }else{
        rotation += 5;
      }
    }else{
      if(isMouseIn){
        if(ballCount < 200){
          d = d * 5 / 6;
          hue = (d * 9) % 360;
          balls[ballCount] = new Ball(d, x, y, -vx * 1.2, vy * 1.1);
          ballCount++;
        }
        isMouseIn = false;
        rotation = 0;
      }
      if(mousePressed){
        x  += vx / 4;
        vy += gravity / 4;
        y  += vy / 4;
      }else{
        x  += vx;
        vy += gravity;
        y  += vy;
      }
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
  }
  void draw(){
    fill(hue, 100, 100);
    ellipse(x, y, d, d);
  }
}
