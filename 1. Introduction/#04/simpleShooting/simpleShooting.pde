int bulletX;
int bulletY;
float enemyX;
float enemyY;
float enemyRad;
int score;

void setup() {
  bulletX = 1000;
  bulletY = 0;
  enemyX = 400;
  enemyRad = 0;
  score = 0;
  size(480, 480);
  noStroke();
  smooth();
}

void draw() {
  background(0, 0, 0);

  fill(255, 255, 255);
  ellipse(mouseX, mouseY, 20, 20);
  fill(255, 0, 0);
  triangle(bulletX-8, bulletY-4, bulletX-8, bulletY+4, bulletX+8, bulletY);
  enemyY = 200 * sin(enemyRad) + 210;
  fill(255, 255, 255, 180);
  rect(enemyX, enemyY, 60, 60);

  if (mousePressed) {
    bulletX = mouseX;
    bulletY = mouseY;
  }
  bulletX += 5;
  enemyRad+=0.01;
  
  if(bulletX >= enemyX && bulletX <= enemyX + 20 && bulletY >= enemyY && bulletY <= enemyY + 60){
    background(200, 200, 50);
  }
}
