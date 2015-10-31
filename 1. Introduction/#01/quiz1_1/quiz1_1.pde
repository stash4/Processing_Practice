size(600,600);
noStroke();
background(230);

for(int i=0;i<360;i+=60){
  fill(110,170,255,10+i/2.5);
  quad(i,i,i,600-i,600-i,600-i,600-i,i);
}
