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
  float rd = sin(rad/120);
  x = r * cos(rad) * rd;
  y = -r * sin(rad) * rd;
  fill(theta % h, 100, 100);
  println("theta % 360 =" + (theta % h));
  println("x=" + x);
  println("y=" + y);
  println("r=" + r);
  ellipse(x + 200, y + 200, d, d);
  theta = theta + dTheta;
}
