int racketX=270,racketSize=60;

void setup() {
  size(600, 600);
  noStroke();
}

void draw() {
  if (racketX+60<=600 && keyPressed && key==CODED && keyCode==RIGHT)
    racketX+=5;
  if (racketX>=0 && keyPressed && key==CODED && keyCode==LEFT)
    racketX-=5;
  background(255);
  fill(0);
  rect(racketX, 550, racketSize, 15);
}
