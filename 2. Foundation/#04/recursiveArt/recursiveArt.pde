float x0 = 20.0;    //長方形の座標と大きさの初期値
float y0 = 20.0;
float mx0 = 350.0;
float my0 = 250.0;
float minRect = 10;    //分割した長方形の辺の(ほぼ)最小値

void setup() {
  frameRate(1);
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100);
  stroke(0, 5, 80);
}

void draw() {
  background(0, 0, 100);
  rect(x0, y0, mx0, my0);
  divideRectangle(x0, y0, mx0, my0);
}

void divideRectangle(float x, float y, float mX, float mY) {
  if (mX < minRect || mY < minRect) {
    return;        //1辺がminRect未満でその長方形の分割を停止
  }
  float d1, d2;
  if (mX > mY) {          //長辺を判断，分割
    d1 = random(0, mX);
    d2 = mY;
    fill(random(0, 360), 100, 100);
    rect(x, y, d1, d2);
    divideRectangle(x, y, d1, d2);      //分割後の2つの長方形を引数にしてそれぞれ再帰
    divideRectangle(x + d1, y, mX - d1, d2);
  } else {
    d1 = mX;
    d2 = random(0, mY);
    fill(random(0, 360), 100, 100);
    rect(x, y, d1, d2);
    divideRectangle(x, y, d1, d2);
    divideRectangle(x, y + d2, d1, mY - d2);
  }
}
