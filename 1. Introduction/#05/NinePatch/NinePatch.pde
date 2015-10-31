size(600, 600);
background(255);
colorMode(HSB, 300, 90, 90);
noStroke();

int x, y;
for (int i=0; i<=width || i<=height; i+=120) {
  for (x=i, y=0; x<=width || y<=height; x+=60, y+=60) {
    fill(random(20, 300), 60, 90);
    rect(x, y, 20, 20);
    rect(x+40, y, 20, 20);
    rect(x+20, y+20, 20, 20);
    rect(x, y+40, 20, 20);
    rect(x+40, y+40, 20, 20);
  }
  for (x=0, y=i; x<=width || y<=height; x+=60, y+=60) {
    fill(random(20, 300), 60, 90);
    rect(x, y, 20, 20);
    rect(x+40, y, 20, 20);
    rect(x+20, y+20, 20, 20);
    rect(x, y+40, 20, 20);
    rect(x+40, y+40, 20, 20);
  }
}
