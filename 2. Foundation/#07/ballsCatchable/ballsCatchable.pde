// 定数
final int X = 0;
final int Y = 1;
final int VX = 2;
final int VY = 3;
final float vx0min = -7;            // vxの初期値の下限
final float vx0max = 5;             // vxの初期値の上限
final float vy0min = 4;             // vyの初期値の下限
final float vy0max = 15;            // vyの初期値の上限
final int fps = 60;                 // 1秒間あたりのフレーム数
final float gravity = 9.8 / fps;    // 1フレームあたりの重力加速度
final float elas = 0.98;            // 反発係数
final float d = 40;                 // ボールの直径
final float hueMax = 360.0;         // 色相の最大値
final int ballCount = 6;            // ボールの個数

// 変数
float[][] balls;                      // ボールの x, y, vx, vy を要素とする配列

void setup() {
  frameRate(fps);
  size(480, 480);
  noStroke();
  colorMode(HSB, hueMax, 100, 100);
  fill(0, 0, 0);
  balls = new float[ballCount][4];  // ボールの x, y, vx, vy を要素とする配列
  for(int i = 0; i < balls.length; i++){
    balls[i][X]  = random(d / 2, width - d / 2);     // x
    balls[i][Y]  = random(d / 2, height / 5);        // y
    balls[i][VX] = random(vx0min, vx0max);           // vx
    balls[i][VY] = random(vy0min, vy0max);           // vy
  }
}

void draw() {
  background(0, 0, 100);
  
  for(int i = 0; i < balls.length; i++){
    if(isMouseInTheBall(balls[i], d, mouseX, mouseY)){
      fill(350, 90, 90);
    }else{
      boundBall(balls[i]);
      fill(0, 0, 0);
    }
    ellipse(balls[i][X], balls[i][Y], d, d);
  }
}

boolean isMouseInTheBall(float[] ball, float d, float mX, float mY){
  boolean result = sqrt((mX - ball[X]) * (mX - ball[X]) + (mY - ball[Y]) * (mY - ball[Y])) <= d /2;
  return result;
}

void boundBall(float[] ball) {
  ball[X]  += ball[VX];          // ボールが速度ぶん移動する
  ball[VY] += gravity;           // 速度のy成分に重力加速度を加算する
  ball[Y]  += ball[VY];          // ボールが速度ぶん移動する
  if (ball[X] < d / 2) {
    ball[VX] = - ball[VX] * elas;
    ball[X] = d / 2;
  } else if (ball[X] > width - d / 2) {
    ball[VX] = - ball[VX]  * elas;
    ball[X] = width - d / 2;
  }
  if (ball[Y] > height - d / 2) {
    ball[VY] = - ball[VY] * elas;
    ball[Y] = height - d / 2;
  } else if (ball[Y] < d / 2) {
    ball[VY] = - ball[VY] * elas;
    ball[Y] = d / 2;
  }
}
