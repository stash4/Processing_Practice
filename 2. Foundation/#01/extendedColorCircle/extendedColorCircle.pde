int r = 150;
int theta;
int dTheta = 5;
float rad;
int d = 8;
float x, y;
int h = 405;

void setup() {
  size(400, 400);
  noStroke();
  background(255, 255, 255);
  fill(0, 0, 0);
  theta = 0;
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  rad = radians(theta);
  x = r * cos(rad);
  y = -r * sin(rad);
  fill(theta % h, 100, 100);
  println("theta % 405 =" + (theta % h));
  println("x=" + x);
  println("y=" + y);
  ellipse(x + 200, y + 200, d, d);
  theta += dTheta;
}
