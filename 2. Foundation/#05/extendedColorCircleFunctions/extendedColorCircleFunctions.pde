// 定数
final float circleRadius = 150;   // 円の半径
final float dTheta = 5;           // 回転角 [degree] の増分/1フレーム
final float pointDiameter = 8;    // 点の直径
// 変数
float centerX;                    // ウィンドウの中心のx座標
float centerY;                    // ウィンドウの中心のy座標
float theta;                      // 回転角 [degree]

void setup() {
  size(400, 400);
  noStroke();
  background(255, 255, 255);
  colorMode(HSB, 360, 100, 100);  // 色の指定をHSBに
  // (色相 0-360, 彩度 0-100, 明度 0-100)
  centerX = width / 2;
  centerY = height / 2;
  theta = 0;
}

void draw() {
  float radTheta = radians(theta);                       // 回転角 [radian]

  float x = pointX(radTheta, circleRadius);    // 関数を使って x 座標を求める
  float y = pointY(radTheta, circleRadius);    // 関数を使って y 座標を求める
  fill(pointHue(theta), 100, 100);    // 関数を使って色相を求め、fill() で色を指定する

  ellipse(x + centerX, y + centerY, pointDiameter, pointDiameter);
  theta = theta + dTheta;
}

// ここに関数の定義を書く

float pointX(float rad, float r) {
  float x = r * cos(rad);
  return x;
}

float pointY(float rad, float r) {
  float y = -r * sin(rad);
  return y;
}

float pointHue(float theta) {
  float hue = theta % 315;
  return hue;
}
