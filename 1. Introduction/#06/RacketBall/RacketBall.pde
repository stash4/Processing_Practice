int racketX=270, racketSize=60;
float ballX=10, ballY=200;
float xSpeed=4, ySpeed=-5;
int score=0, highScore=0;
int initFlg=1;

void setup() {
  size(600, 600);
  noStroke();
}

void draw() {
  background(255);
  if (initFlg==1) racketBallInit();
  if (racketX+60<=600 && keyPressed && key==CODED && keyCode==RIGHT)
    racketX+=7;
  if (racketX>=0 && keyPressed && key==CODED && keyCode==LEFT)
    racketX-=7;
  if (ballX-10<0 || ballX+10>600)
    xSpeed=xSpeed*-1;
  if (ballY-10<0)
    ySpeed=ySpeed*-1;
  if (ballY+10>=555 && ballX>=racketX-5 && ballX<=racketX+racketSize+5) {
    ySpeed=ySpeed*-1.05;
    xSpeed=xSpeed*1.05;
    score++;
  }
  if (score>=highScore) highScore=score;
  if (ballY+10>600) {
    initFlg=1;
  }
  ballX+=xSpeed;
  ballY+=ySpeed;
  fill(0);
  rect(racketX, 550, racketSize, 15);
  ellipse(ballX, ballY, 20, 20);
  textSize(16);
  text("SCORE "+score, 100, 100);
  textSize(12);
  text("HIGH SCORE "+highScore, 100, 80);
}

void racketBallInit() {
  racketX=270;
  ballX=10;
  ballY=200;
  xSpeed=4;
  ySpeed=-5;
  score=0;
  noLoop();
  fill(0);
  textSize(16);
  text("PRESS SPACE KEY", 100, 300);
  //text("USE RIGHT/LEFT KEY",100,540);
}

void keyReleased() {
  if (key==' ') {
    initFlg=0;
    loop();
  }
}
