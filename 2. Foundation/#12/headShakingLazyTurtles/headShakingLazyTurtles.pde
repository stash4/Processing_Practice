final float turtleD  = 100;        // 亀の大きさ(甲羅の直径)
int n = 3;
Turtle turtles[];

void setup() {
  size(480, 480);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  turtles = new Turtle[n];
  for(int i = 0; i < n; i++){
    turtles[i] = new Turtle(turtleD, (i + 1) * width / (n + 1), height - turtleD * (i + 1));
  }
}

void draw() {
  background(0, 0, 100);
  for(int i = 0; i < n; i++){
    turtles[i].drawFigure();
    turtles[i].move();
  }
}

class Turtle {
  final float vx0 = 0;
  final float vy0 = -0.3;
  float x;
  float y;
  float vx;
  float vy;
  float d;
  Shell shell;
  Head head;
  HandAndFoot handR;
  HandAndFoot handL;
  HandAndFoot footR;
  HandAndFoot footL;
  Turtle(float d, float x, float y) {  // 甲羅の直径と中心の初期位置
    this.d = d;
    this.x = x;
    this.y = y;
    vx = vx0;
    vy = vy0;
    head = new Head(d / 3, 0, - d / 2);
    shell = new Shell(d, 0, 0);
    handR = new HandAndFoot(d / 3, d / 2, - d / 4);
    handL = new HandAndFoot(d / 3, - d / 2, - d / 4);
    footR = new HandAndFoot(d / 3, d / 3, d / 3);
    footL = new HandAndFoot(d / 3, - d / 3, d / 3);
  }
  void drawFigure() {
    head.drawFigure(x, y);         // 頭を描画する
    handR.drawFigure(x, y);
    handL.drawFigure(x, y);
    footR.drawFigure(x, y);  
    footL.drawFigure(x, y);
    shell.drawFigure(x, y);        // 甲羅を描画する
  }
  void move() {
    if(head.isMouseIn(x, y) || shell.isMouseIn(x, y) || handR.isMouseIn(x, y) || handL.isMouseIn(x, y) || footR.isMouseIn(x, y) || footL.isMouseIn(x, y)){
      x += vx;
      head.setIsShaking(true);
      if (head.getTopY(y) > 0) {
        y += vy;
      }
    }else{
      head.setIsShaking(false);
    }
  }
}

/** 甲羅 */
class Shell {
  float d;                 // 甲羅の直径
  float offsetX;           // 体の中心からのx方向のoffset
  float offsetY;           // 体の中心からのy方向のoffset
  Shell(float d, float offsetX, float offsetY) { //
    this.d = d;
    this.offsetX = offsetX;
    this.offsetY = offsetY;
  }
  void drawFigure(float baseX, float baseY) {
    fill(150, 50, 50);
    ellipse(baseX + offsetX, baseY + offsetY, d, d);
  }
  boolean isMouseIn(float baseX, float baseY){
    float mx = baseX + offsetX - mouseX;
    float my = baseY + offsetY - mouseY;
    float r = d / 2;
    return mx * mx + my * my < r * r;
  }
}

/** 頭 */
class Head {
  float d;                 // 頭の直径
  float offsetX;           // 体の中心からのx方向のoffset
  float offsetY;           // 体の中心からのy方向のoffset
  float shakingOffset = 0;
  float shakingOffsetD = 1;
  boolean isShaking;
  Head(float d, float offsetX, float offsetY) {
    this.d = d;
    this.offsetX = offsetX;
    this.offsetY = offsetY;
  }
  /** 頭頂のy座標を返す */
  float getTopY(float baseY) {
    return baseY + offsetY - d / 2;
  }
  void setIsShaking(boolean isShaking){
    this.isShaking = isShaking;
  }
  void drawFigure(float baseX, float baseY) {
    fill(50, 50, 70);
    ellipse(baseX + offsetX + shakingOffset, baseY + offsetY, d, d);
    if(isShaking){
      shakingOffset += shakingOffsetD;
      if(shakingOffset > 5){
        shakingOffset = 5;
        shakingOffsetD = -shakingOffsetD;
      }
      if(shakingOffset < -5){
        shakingOffset = -5;
        shakingOffsetD = -shakingOffsetD;
      }
    }
  }
  boolean isMouseIn(float baseX, float baseY){
    float mx = baseX + offsetX - mouseX;
    float my = baseY + offsetY - mouseY;
    float r = d / 2;
    return mx * mx + my * my < r * r;
  }
}

class HandAndFoot {
  float d;                 // 頭の直径
  float offsetX;           // 体の中心からのx方向のoffset
  float offsetY;           // 体の中心からのy方向のoffset
  HandAndFoot(float d, float offsetX, float offsetY) {
    this.d = d;
    this.offsetX = offsetX;
    this.offsetY = offsetY;
  }
  void drawFigure(float baseX, float baseY) {
    fill(50, 50, 70);
    ellipse(baseX + offsetX, baseY + offsetY, d, d);
  }
  boolean isMouseIn(float baseX, float baseY){
    float mx = baseX + offsetX - mouseX;
    float my = baseY + offsetY - mouseY;
    float r = d / 2;
    return mx * mx + my * my < r * r;
  }
}
