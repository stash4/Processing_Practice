// 定数
final float gravity = 9.8 / 60;  // <-- 1/60秒あたりの重力加速度
final float elas = 0.9;    //反発係数
// 変数
int fps = 90;
float x0 = 40;
float x;
float vx0 = 10;
float vx;
float y0 = 40;
float y;                         // <-- ボールのy座標
float vy0 = 4;
float vy;                        // <-- ボールの速度のy成分
int d = 40;
float hue;

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  x = x0;
  y = y0;
  vx = vx0;
  vy = vy0;
}

void draw() {
  if (y <  d / 2 || y > height - d / 2) {
    if (y <  d / 2)
      y = d / 2;
    if (y > height - d / 2)
      y = height - d / 2;
    vy = -vy * elas;
  }
  if (x <  d / 2 || x > width  - d / 2) {
    if (x <  d / 2)
      x = d / 2;
    else 
      x = width - d / 2;
    vx = -vx * elas;
  }
  println(vy);
  vy += gravity;
  x += vx;
  y += vy;  

  background(0, 0, 100);
  fill(calcHule(vx, vy), 100, 100);
  ellipse(x, y, d, d);
}

float calcHule(float vx, float vy) {
  float speed = sqrt(vx * vx + vy * vy);
  float hue = speed * 30 % 360;
  return hue;
}
