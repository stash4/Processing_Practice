size(600,600);
background(250);
colorMode(HSB,100);

for(int i=0;i<100;i++){
  noFill();
  strokeWeight(1.8);
  stroke(3,99,99);
  ellipse(random(250,350),random(250,350),random(50,100),random(50,100));
  ellipse(random(250,350),random(250,350),random(150,200),random(150,200));
  strokeWeight(1.4);
  stroke(random(10,17),99,99);
  ellipse(random(250,350),random(250,350),random(260,400),random(260,400));
  strokeWeight(1);
  stroke(random(100),70,99);
  ellipse(random(250,350),random(250,350),random(390,800),random(390,800));
}
