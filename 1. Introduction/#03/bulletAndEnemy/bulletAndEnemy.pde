int r, theta;
float x, y, rad;
int mx = -50, my = -50;

void setup() {
  r = 300;
  theta = 0;
  size(480, 480);
  noStroke();
}

void draw() {
  theta++;
  rad = radians(theta);
  x = r * cos(rad);
  y = -r * sin(rad);
  background(255);
  fill(100);
  rect(400, y/2 + 200, 40, 40);

  fill(0, 250, 255);
  ellipse(mouseX, mouseY, 30, 30);
  if (mousePressed) {
    mx = mouseX;
    my = mouseY;
  } else {
    fill(255);
  }
  mx += 2;
  fill(0, 150, 255);
  triangle(mx + 15, my, mx - 10, my + 10, mx - 10, my - 10);
}
