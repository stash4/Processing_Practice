// 定数
final float gravity = 9.8 / 60;  // <-- 1/60秒あたりの重力加速度
final float elas = 0.9;    //反発係数
// 変数
int fps = 90;
float x;
float y0 = 0;
float y;
float vy0 = 4;
float vy;
int d = 40;
float hue;

void setup() {
  frameRate(fps);
  size(200, 480);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  x = 100;
  y = y0;
  vy = vy0;
}

void draw() {

  if (y > height-d/2) {
    y = height - d / 2;
    vy = -vy * elas;
  }
  vy += gravity;
  y += vy;

  background(0, 0, 100);
  fill(calcHule(vy), 100, 100);
  ellipse(x, y, d, d);
}

float calcHule(float speed) {
  if (speed<0) {
    speed = -speed;
  }
  float hue = speed * 20 % 360;
  return hue;
}
