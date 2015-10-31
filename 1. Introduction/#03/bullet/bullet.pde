void setup() {
  size(480, 480);
  noStroke();
  fill(255);
}

int mx = -50, my = -50;
void draw() {
  background(255);
  fill(0, 250, 255);
  ellipse(mouseX, mouseY, 30, 30);
  if (mousePressed) {
    mx = mouseX;
    my = mouseY;
  } else {
    fill(255);
  }
  mx += 2;
  fill(0, 50, 255);
  triangle(mx + 15, my, mx - 10, my + 10, mx - 10, my - 10);
}
