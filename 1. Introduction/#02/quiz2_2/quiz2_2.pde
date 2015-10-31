size(600,600);
background(255);

for(int i=0;i<600;i+=60){
  line(i,0,0,600-i);
  line(600-i,600,600,i);
}
