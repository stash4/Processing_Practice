int ballX=10, ballY=200, xSpeed=4, ySpeed=-5;

void setup() {
  size(600, 600);
  noStroke();
}

void draw() {
  if (ballX-10<0 || ballX+10>600)
    xSpeed=xSpeed*-1;
  if (ballY-10<0 || ballY+10>600)
    ySpeed=ySpeed*-1;
  ballX+=xSpeed;
  ballY+=ySpeed;
  background(255);
  fill(0);
  ellipse(ballX, ballY, 20, 20);
}
