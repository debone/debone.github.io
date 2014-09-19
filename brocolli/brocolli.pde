
int x;
int step;
int leaf, leafColor;
float leafFactor;

void setup(){
  size(400,400);
  background(#191F0C);
  x = 0;
 step = 5; 
 frameRate(3);
 leafFactor = 1;
}

void draw(){
  translate(width/2,100);
  color[] colours = {#364119,#607324, #B3C14F, #D6DC82, #F0F4C2};
  noStroke();
  for(int i =0; i<1000; i++){
    leaf = floor(noise(-x/step*0.5,x/step*0.5)*step);
    if(leaf > 100){
       leaf = 100; 
    }else if(leaf < -100){
       leaf = -100;
    }
    leafColor = int(map(leaf,-100,100,0,4));
    leafColor = floor(leafColor + randomGaussian() * leafFactor);
    if(leafColor>4) leafColor = 4;
    if(leafColor<0) leafColor = 0;
    
    fill(colours[leafColor]);
    rect(leaf,x,step,step);
    x+= step;
    if(x>200){
     x=0; 
    }
  }
 
}