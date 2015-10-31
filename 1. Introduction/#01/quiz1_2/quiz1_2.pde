size(600,600);
background(255);

for(int i=0;i<600;i+=60){
  line(60+i,0,0,600-i);
  line(540-i,600,600,60+i);
}
