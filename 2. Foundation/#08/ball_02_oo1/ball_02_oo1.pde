final float vx0min = -7;
final float vx0max = 5;
final float vy0min = 4;
final float vy0max = 15;
final float fps = 60;
final float gravity = 9.8 / fps;
final float elas = 0.98;
final float d = 40;
final float hueMax = 360.0;

Ball ball0;

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  fill(0, 0, 0);
  ball0 = new Ball();
  ball0.x  = random(d / 2, width - d / 2);
  ball0.y  = random(d / 2, height / 5);
  ball0.vx = random(vx0min, vx0max);
  ball0.vy = random(vy0min, vy0max);
}

void draw() {
  background(0, 0, 100);
  boundBall(ball0);
  fill(calcHue(ball0.vx, ball0.vy), 100, 100);
  ellipse(ball0.x, ball0.y, d, d);
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
