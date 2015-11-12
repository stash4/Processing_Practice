final float vx0min = -7;
final float vx0max = 5;
final float vy0min = 4;
final float vy0max = 15;
final float fps = 60;
final float gravity = 9.8 / fps;
final float elas = 0.98;
final float d0 = 40;
final float hueMax = 360.0;
final int ballCount = 6;

Ball[] balls;

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  fill(0, 0, 0);
  balls = new Ball[ballCount];
  for(int i = 0; i < balls.length; i++){
    balls[i] = new Ball();
  }
  for(int i = 0; i < balls.length; i++){
    balls[i].x  = random(d0 / 2, width - d0 / 2);
    balls[i].y  = random(d0 / 2, height / 5);
    balls[i].vx = random(vx0min, vx0max);
    balls[i].vy = random(vy0min, vy0max);
    balls[i].d = d0;
    balls[i].hue = random(0, 360);
  }
}

void draw() {
  background(0, 0, 100);
  for(int i = 0; i < balls.length; i++){
    if(isNeighbor(balls[i].x, balls[i].y, mouseX, mouseY, balls[i].d / 2)) {    // マウスカーソルの位置がボールの内部なら
    balls[i].hue++;
    
    balls[i].hue %= 360;
    balls[i].d = 3 * d0 + d0* sin(balls[i].hue / 4);
  }
  else {
    if(balls[i].d <= d0)
      balls[i].d = d0;
    else
      balls[i].d--;
    boundBall(balls[i]);
  }
    fill(balls[i].hue, 100, 100);
    ellipse(balls[i].x, balls[i].y, balls[i].d, balls[i].d);
  }
}

class Ball{
  float x;
  float y;
  float vx;
  float vy;
  float d;
  float hue;
}

void boundBall(Ball ball) {
  ball.x  += ball.vx;
  ball.vy += gravity;
  ball.y  += ball.vy;
  if (ball.x < ball.d / 2) {
    ball.vx = - ball.vx * elas;
    ball.x = ball.d / 2;
  } else if (ball.x > width - ball.d / 2) {
    ball.vx = - ball.vx  * elas;
    ball.x = width - ball.d / 2;
  }
  if (ball.y > height - ball.d / 2) {
    ball.vy = - ball.vy * elas;
    ball.y = height - ball.d / 2;
  } else if (ball.y < ball.d / 2) {
    ball.vy = - ball.vy * elas;
    ball.y = ball.d / 2;
  }
}

boolean isNeighbor(float x1, float y1, float x2, float y2, float distance) {
  float dx = x1 - x2;
  float dy = y1 - y2;
  return dx * dx + dy * dy < distance * distance;
}
