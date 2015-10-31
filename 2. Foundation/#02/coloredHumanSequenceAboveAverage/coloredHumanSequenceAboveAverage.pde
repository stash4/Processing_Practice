size(440, 440);
background(255, 255, 255);
noStroke();

int x = 50;    //人の中心のx座標の初期値
int y = 300;    //人の足元のy座標
int dx = 50;    //人の中心線間の距離
int[] h;    //身長
int w = 20;    //体の幅
int d = 30;    //顔の直径
int total = 0;    //身長の合計値
float average;    //身長の平均値

h = new int[] { 145, 186, 176, 168, 186, 156, 172 };    //身長; 人数は7名

//平均の身長を求める
for(int i = 0; i < h.length; i++){
  total = total + h[i];
}
average = total / h.length;
println("average is " + average);

//人の列を描く(身長が平均よりも高い人は色を変える)
for(int i = 0; i < h.length; i++){
  if(h[i] > average) fill(219, 232, 47);
  else fill(0, 0, 0);
  ellipse(x, y - h[i], d, d);
  rect(x - w / 2, y - h[i], w, h[i]);
  x = x + dx;
}
