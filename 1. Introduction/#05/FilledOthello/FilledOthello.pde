size(600, 600);
smooth();

for (int y = 50; y <= 450; y = y + 50) {
  line(50, y, 450, y);
  if (y == 450)break;
  for (int x = 50; x <= 450; x = x + 50) {
    line(x, y, x, y+50);
    fill(255, 255, 255);
    if (x == 450)break;
    ellipse(x+25, y+25, 40, 40);
  }
}
