final float vx0min = -7;
final float vx0max = 5;
final float vy0min = 4;
final float vy0max = 15;
final float fps = 60;
final float gravity = 9.8 / fps;
final float elas = 0.98;
final float d = 40;
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
    balls[i].x  = random(d / 2, width - d / 2);
    balls[i].y  = random(d / 2, height / 5);
    balls[i].vx = random(vx0min, vx0max);
    balls[i].vy = random(vy0min, vy0max);
  }
}

void draw() {
  background(0, 0, 100);
  for(int i = 0; i < balls.length; i++){
    boundBall(balls[i]);
    fill(calcHue(balls[i].vx, balls[i].vy), 100, 100);
    ellipse(balls[i].x, balls[i].y, d, d);
  }
}

class Ball{
  float x;
  float y;
  float vx;
  float vy;
}

float calcHue(float vx, float vy) {
  return (sqrt(vx * vx + vy * vy) * 16) % hueMax;
}

void boundBall(Ball ball) {
  ball.x  += ball.vx;
  ball.vy += gravity;
  ball.y  += ball.vy;
  if (ball.x < d / 2) {
    ball.vx = - ball.vx * elas;
    ball.x = d / 2;
  } else if (ball.x > width - d / 2) {
    ball.vx = - ball.vx  * elas;
    ball.x = width - d / 2;
  }
  if (ball.y > height - d / 2) {
    ball.vy = - ball.vy * elas;
    ball.y = height - d / 2;
  } else if (ball.y < d / 2) {
    ball.vy = - ball.vy * elas;
    ball.y = d / 2;
  }
}
