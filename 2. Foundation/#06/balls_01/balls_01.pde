// 定数
final float gravity = 9.8 / 60;  // <-- 1/60秒あたりの重力加速度
final float elas = 0.9;    //反発係数
final int X = 0;
final int Y = 1;
final int VX = 2;
final int VY = 3;
final int nBalls = 6;
// 変数
int fps = 60;
float[][] balls;
int d = 40;
float hue;

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  balls = new float[nBalls][4];
  for (int i = 0; i < nBalls; i++) {
    balls[i][X] = random(d / 2, height - d / 2);
    balls[i][Y] = random(d / 2, width - d / 2);
    balls[i][VX] = random(10);
    balls[i][VY] = random(10);
  }
}

void draw() {

  background(0, 0, 100);

  for (int i = 0; i < nBalls; i++) {
    fill(calcHule(balls[i][VX], balls[i][VY]), 100, 100);
    ellipse(balls[i][X], balls[i][Y], d, d);

    boundBall(balls[i]);
  }
}

void boundBall(float[] ball) {
  if (ball[Y] <  d / 2 || ball[Y] > height - d / 2) {
    if (ball[Y] <  d / 2)
      ball[Y] = d / 2;
    else
      ball[Y] = height - d / 2;
    ball[VY] = -ball[VY] * elas;
  }
  if (ball[X] <  d / 2 || ball[X] > width  - d / 2) {
    if (ball[X] <  d / 2)
      ball[X] = d / 2;
    else
      ball[X] = width - d / 2;
    ball[VX] = -ball[VX] * elas;
  }
  ball[VY] += gravity;
  ball[X] += ball[VX];
  ball[Y] += ball[VY];
}

float calcHule(float vx, float vy) {
  float speed = sqrt(vx * vx + vy * vy);
  float hue = speed * 30 % 360;
  return hue;
}
