int r;
float x, y;
int theta;
float rad;

void setup() {
  r = 200;
  theta = 0;
  size(480, 480);
  noStroke();
  fill(100);
}

void draw() {
  theta++;
  rad = radians(theta);
  x = r * cos(rad);
  y = -r * sin(rad);

  background(255, 255, 255);
  rect(x + 200, 200, 40, 40);
  rect(200, y + 200, 40, 40);
}
