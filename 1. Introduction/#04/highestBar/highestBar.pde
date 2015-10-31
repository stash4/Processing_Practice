int y1 = -480, y2 = -480, y3 = -480, y4 = 0;
int s1 = 4, s2 = 3, s3 = 5;

void setup() {
  size(270, 480);
  noStroke();
}

void draw() {
  if (y1 < -480 || y1 > 0)
    s1 = s1 * (-1);
  if (y2 < -480 || y2 > 0)
    s2 = s2 * (-1);
  if (y3 < -480 || y3 > 0)
    s3 = s3 * (-1);
  y1 += s1;
  y2 += s2;
  y3 += s3;
  if (y1 <= y2 && y1 <= y3)
    y4 = y1;
  if (y2 <= y3 && y2 <= y1)
    y4 = y2;
  if (y3 <= y1 && y3 <= y2)
    y4 = y3;
  background(90, 190, 255);
  fill(200, 240, 240);
  rect(0, 480, 270, y4);
  fill(255, 150, 170);
  rect(45, 480, 45, y1);
  fill(70, 255, 70);
  rect(113, 480, 45, y2);
  fill(30, 140, 255);
  rect(180, 480, 45, y3);
}
