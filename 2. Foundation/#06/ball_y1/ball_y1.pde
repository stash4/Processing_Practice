// 定数
final float gravity = 9.8 / 60;  // <-- 1/60秒あたりの重力加速度
// 変数
int fps = 90;
float x;
float y0 = 0;
float y;                         // <-- ボールのy座標
float vy0 = 4;
float vy;                        // <-- ボールの速度のy成分
int d = 40;

void setup() {
  frameRate(fps);
  size(200, 480);
  noStroke();
  fill(0, 0, 0);
  x = 100;
  y = y0;
  vy = vy0;
}

void draw() {
  vy += gravity;    // <-- 速度に重力加速度を加算する
  y += vy;          // <-- ボールが速度ぶん移動する

  background(255, 255, 255);
  ellipse(x, y, d, d);
}
