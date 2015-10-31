size(1200, 700);
noStroke();

for (int p=0; p<=290; p+=290) {
  for (int i=0; i<=840; i+=120) {
    for (int j=p; j<=p+90; j+=30) {
      int ax=60+i, ay=30+j, bx=120+i, by=190+j;
      fill(255);
      triangle(ax, ay+15, ax+60, ay, ax+60, ay+30);
      triangle(bx+120, by-15, bx+120, by+15, bx+180, by);
      fill(250, 255, 0);
      triangle(ax+60, ay, ax+60, ay+30, ax+120, ay+15);
      triangle(bx+60, by, bx+120, by-15, bx+120, by+15);
      fill(0);
      triangle(ax+60, ay+30, ax+120, ay+15, ax+120, ay+45);
      triangle(bx+60, by, bx+60, by+30, bx+120, by+15);
      fill(0, 0, 255);
      triangle(ax+120, ay+15, ax+120, ay+45, ax+180, ay+30);
      triangle(bx, by+15, bx+60, by, bx+60, by+30);
    }
  }
}
