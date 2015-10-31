int fps = 1;          // フレーム数/秒  (1フレームごとにサイコロを振る前提)
int dY = 60;           // 行の間隔
int dX = 20;           // 度数1当りのx座標の動き
int r = 10;            // 円の大きさ
int diceSides = 6;     // サイコロの面の数
int marginTop = 30;    // 上の余白
int marginLeft = 50;   // 左の余白 (文字を除く)
int marginChar = 15;   // 文字の左余白
int[] freq = new int[diceSides];            // サイコロの目ごとの回数を格納

void setup(){
  size(640, 400);
  frameRate(fps);
  noStroke();
  background(255, 255, 255);
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  int diceValue = (int)random(0, diceSides);    //サイコロの目
  freq[diceValue]++;    //出たサイコロの目の頻度を1増やす
  for(int i = 0; i < freq.length; i++){
    int y= marginTop + i * dY;    //円の中心のy座標
    //行ラベル
    fill(0, 0, 0);
    textSize(16);
    text(i + 1, marginChar, y + r / 2);    //左に(i+1)を表示
    //円
    int x = freq[i] * dX + marginLeft;    //円の中心のx座標
    if(x + dX > width){    //次が描けないほど右に来ているか
      fill(0, 0, 0);
      noLoop();
    } else{
      fill(360 * i / diceSides, 100, 100);    //サイコロの目ごとに色相を変更
    }
    if(freq[i] > 0) ellipse(x, y, r, r);
  }
}
