size(400, 400);
background(255, 255, 255);
noStroke();

int x = 30;
int y = 30;
int dx = 30;
int dy = 30;
int d = 3;
int dd = 2;
int n = 12;

fill(0, 0, 0);
for(int i = 0; i < n; i++){
  println("y=" + y);
  x = 30;
  d = 3;
  for(int j = 0; j < n; j++) {
    println("x=" + x);
    println("d=" + d);
    ellipse(x, y, d, d);
    x = x + dx;
    d = d + dd;
  }
  y = y + dy;
}
