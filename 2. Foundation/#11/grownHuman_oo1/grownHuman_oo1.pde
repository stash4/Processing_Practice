final float fps = 60;            // フレームレート
final int x = 200;               // 人の中心の x座標
final int y = 320;               // 人の足元の y座標
final float h0 = 40;             // 初期の胴体の長さ
final float w0 = 20;             // 初期の胴体の幅
final float d0 = 25;             // 初期の頭の直径
final float he = 240;            // 最終の胴体の長さ
final float we = 140;            // 最終の胴体の幅
final float de = 50;             // 最終の頭の直径
final float growthRate = 0.004;  // 成長率
Human someone;

void setup() {
  size(400, 400);
  frameRate(fps);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  someone = new Human(x, y, h0, w0, d0, he, we, de, 0.004);
}


void draw() {
  background(0, 0, 100);
  someone.grown();
  someone.drawFigure();
}


class Human {
  float x;
  float y;
  float h;
  float w;
  float d;
  float he;
  float we;
  float de;
  float growthRate;
  Human(float x, float y, float h, float w, float d, float he, float we, float de, float growthRate){
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w;
    this.d = d;
    this.he = he;
    this.we = we;
    this.de = de;
    this.growthRate = growthRate;
  }
  void grown(){
    if ( h < he )
      h = h * (1.0 + growthRate);
    if ( w < we )
      w = w * (1.0 + growthRate * 0.8);
    if ( d < de )
      d = d * (1.0 + growthRate * 0.5);
  }
  void drawFigure() {
    fill(35, 60, 100);
    ellipse(x, y - h, d, d);           // 顔
    fill(220, 87, 100);
    ellipse(x, y - h / 2 + d / 2, w, h); // 胴体
  }
}
