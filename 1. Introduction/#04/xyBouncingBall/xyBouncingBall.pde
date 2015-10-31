int x = 40, y = 40;
int xspeed = 4, yspeed = 2;

void setup() {
  size(480, 220);
  noStroke();
  fill(0, 0, 0);
}

void draw() {
  if (x < 20 || x > 460)
    xspeed = xspeed * (-1);
  if (y < 20 || y > 200)
    yspeed = yspeed * (-1);  
  x += xspeed;
  y += yspeed;
  background(255, 255, 255);
  ellipse(x, y, 40, 40);
}
