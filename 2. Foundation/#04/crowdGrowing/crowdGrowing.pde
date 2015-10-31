int humanBodyWidth = 20;           // 体の幅
int faceDiameter = 30;             // 顔の直径
int h;                             //色相

void setup() {
  frameRate(6);
  size(400, 400);                  // ウィンドウのサイズ
  background(255, 255, 255);       // 背景色(白)
  smooth();                        // アンチエイリアシングを有効に
  noStroke();                      // 輪郭線を無効に
  colorMode(HSB, 360, 100, 100);   // カラーモードをHSBに
}

void draw(){
    float humanX = random(0, width);                    //人のx座標
    float humanY = random(0, height);                   //人のy座標
    float humanBodyHeight = random(100,180);            // 胴体の長さ
    float h = random(0, 360);                           //色相
    drawHuman(humanX, humanY, humanBodyHeight, h);            // 人の描画
}


/**
 *  人の形を描く
 *  @param x 人のx座標(体の中央軸)
 *  @param y 人のy座標(足元)
 *  @param bodyHeight 人の胴体の長さ
 *  @param hue 色相
 */
void drawHuman(float x, float y, float bodyHeight, float hue) {
  fill(hue, 100, 100);
  ellipse(x, y - bodyHeight, faceDiameter, faceDiameter);                  // 顔
  rect(x - humanBodyWidth / 2, y - bodyHeight, humanBodyWidth, bodyHeight);    // 胴体
}
