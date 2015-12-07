final float fps = 60;            // フレームレート
final int y = 320;               // 人の足元の y座標
final float growthRate = 0.004;  // 成長率
final int n = 5;
Human[] people = new Human[5];

void setup() {
  size(400, 400);
  frameRate(fps);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  float h0 = 40;
  float w0 = 20;
  float d0 = 25;
  for(int i = 0; i < n; i++){
    int x = 400 / (n + 1) * (i + 1);
    float he = random(170, 270);
    float we = random(90, 150);
    float de = random(40, 70);
    people[i] = new Human(x, y, h0, w0, d0, he, we, de, growthRate);
  }
}

void draw() {
  background(0, 0, 100);
  for(int i = 0; i < n; i++){
    people[i].grown();
    people[i].drawFigure();
  }
}


class Human {
  int x;
  int y;
  float h;
  float w;
  float d;
  float he;
  float we;
  float de;
  float growthRate;
  float hue = random(360);
  Human(int x, int y, float h, float w, float d, float he, float we, float de, float growthRate){
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
    fill(hue, 87, 100);
    ellipse(x, y - h / 2 + d / 2, w, h); // 胴体
  }
}
