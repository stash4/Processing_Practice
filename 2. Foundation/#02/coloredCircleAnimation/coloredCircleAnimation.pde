int n = 12;                  // 円の個数
int x[] = new int[n];       // 円の中心の x座標
float[] y = new float[n];   // 円の中心の y座標
int dx = 30;                // 円の中心間の距離
float[] h = new float[n];   // 円の色相
float[] d = new float[n];   // 円の直径
int theta = 0;
int dTheta = 5;
float rad;


void setup(){
  frameRate(24);
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100);
  noStroke();
  for(int i = 0; i < x.length; i++){
    x[i] = 30 * (i + 1);
  }
}
void draw(){
  rad = radians(theta);
  theta += dTheta;
  background(0, 0, 100);
  for(int i = 0; i < h.length; i++) {
    h[i] = i * theta % 300;
//    h[i] = 100 * sin(rad+i) / 10;
    println(h[i]);
  }
  for(int i = 0; i < y.length; i++) {
    y[i] = 150 + 150 * cos(rad+i) / 10;
  }
  for(int i = 0; i < d.length; i++) {
    d[i] = 20 + 40 * sin(rad+i/2);
  }
  for(int i = 0; i < n; i++) {
    fill(h[i], 100, 100);         // i番目の円を塗る色を取り出して指定
    ellipse(x[i], y[i], d[i], d[i]);    // i番目の円の直径 d[i] を取り出す
   // ellipse(x[i],100,d[i],d[i]);
  }
}
