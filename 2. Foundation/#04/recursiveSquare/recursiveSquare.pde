float x0 = 200.0;           // 元の正方形の中心のx座標
float y0 = 200.0;           // 元の正方形の中心のy座標
float m0 = 300.0;           // 元の正方形の一辺の長さ

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  background(255, 255, 255);
  fill(0, 0, 0);
  drawSquare(x0, y0, m0);
}

void drawSquare(float x, float y, float m) {
  float m1 = m / 3;
  float[] xA = new float[] {x - m1, x + m1};    // 小さい正方形の中心座標と一辺の長さを計算
  float[] yA = new float[] {y - m1, y + m1};
    
  if(m1 > 3){
    drawSquare(xA[0], yA[0], m1);    // drawSquare を 4回呼び出す
    drawSquare(xA[1], yA[0], m1);
    drawSquare(xA[1], yA[1], m1);
    drawSquare(xA[0], yA[1], m1);
  }else{
    rect(xA[0] - m / 2, yA[0] - m / 2, m1, m1);
    rect(xA[1] - m / 2, yA[0] - m / 2, m1, m1);
    rect(xA[1] - m / 2, yA[1] - m / 2, m1, m1);
    rect(xA[0] - m / 2, yA[1] - m / 2, m1, m1);
  }
}
