// 定数
final float gravity = 9.8 / 60;  // <-- 1/60秒あたりの重力加速度
final float elas = 0.9;    //反発係数
final int X = 0;
final int Y = 1;
final int VX = 2;
final int VY = 3;
// 変数
int fps = 90;
float[] ball;
float x0 = 40;
float vx0 = 6;
float y0 = 40;
float vy0 = 4;
int d = 40;
float hue;

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  ball = new float[4];
  ball[X] = x0;
  ball[Y] = y0;
  ball[VX] = vx0;
  ball[VY] = vy0;
}

void draw() {

  background(0, 0, 100);
  fill(calcHule(ball[VX], ball[VY]), 100, 100);
  ellipse(ball[X], ball[Y], d, d);
  boundBall(ball);
}

void boundBall(float[] ball) {
  if (ball[Y] <  d / 2 || ball[Y] > height - d / 2) {
    if (ball[Y] <  d / 2)
      ball[Y] = d / 2;
    else {
      ball[Y] = height - d / 2;
      if (ball[VY]<0.3)
        ball[VY] = 0;
    }
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
