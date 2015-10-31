float x0 = 200.0;           // 元の正方形の中心のx座標
float y0 = 200.0;           // 元の正方形の中心のy座標
float m0 = 300.0;           // 元の正方形の一辺の長さ

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  background(255, 255, 255);
  fill(0, 0, 0);

  float m = m0 / 3;
  float[] x = new float[] {x0 - m, x0 + m};    // 小さい正方形の中心座標と一辺の長さを計算
  float[] y = new float[] {y0 - m, y0 + m};
  
  drawSquare(x[0], y[0], m);    // drawSquare を 4回呼び出す
  drawSquare(x[1], y[0], m);
  drawSquare(x[1], y[1], m);
  drawSquare(x[0], y[1], m);
}

void drawSquare(float x, float y, float m) {
  rect(x - m / 2, y - m / 2, m, m);  // 1つの正方形を素直に描画

}
