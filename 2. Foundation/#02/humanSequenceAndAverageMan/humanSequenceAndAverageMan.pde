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

//人の列を描きながら平均の身長を求める
fill(0, 0, 0);
for(int i = 0; i < h.length; i++){
  ellipse(x, y - h[i], d, d);
  rect(x - w / 2, y - h[i], w, h[i]);
  x = x + dx;
  total = total + h[i];
}

average = total / h.length;
println("average is " + average);

//平均身長の人を描く
fill(219, 232, 47);
ellipse(x, y - average, d, d);
rect(x - w / 2, y - average, w, average);
