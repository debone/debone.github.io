
int x;
int step,gap;
int leaf, leafColor;
float leafFactor;

void setup(){
  size(400,400);
  
  x = 0;
 step = 5; 
 frameRate(1);
 leafFactor = 1;
}

void draw(){
  translate(0,-30);
  background(#F6FEFF,.5f);
  for(int j=0; j<5; j++){
    for(int h=0; h<5; h++){
      drawTree((j%2*50)+h*width/4,j*height/5);
    }
  }
}

void drawTree(float posX, float posY){
  pushMatrix();
  translate(posX,posY);
  scale(0.4f);
  color[] colours = {#364119,#607324, #B3C14F, #D6DC82, #F0F4C2};
  noStroke();
  for(int i =0; i<4000; i++){
    gap = floor(random(2));
    leaf = floor(random((-x/step*0.5)-gap,(x/step*0.5)+gap))*step;
    leafColor = int(map(leaf,-100,100,0,4));
    leafColor = floor(leafColor + randomGaussian() * leafFactor);
    if(leafColor>4) leafColor = 4;
    if(leafColor<0) leafColor = 0;
    if(x>220) leafColor =(leafColor>0) ? leafColor-1 :
                          leafColor;
    if(x>240) leafColor = (leafColor>1) ? leafColor-2 : 
                          (leafColor>0) ? leafColor-1 :
                          leafColor;
    
    fill(colours[leafColor]);
    rect(leaf,x,step,step);
    if(random(100)>99.5){
     drawBall(leaf,x); 
    }
    if(random(100)>99.6){
      fill(#00FFFF);
      rect(leaf,x,step,step);
    }
    if(random(100)>99.6){
      fill(#FF00FF);
      rect(leaf,x,step,step);
    }
    if(random(100)>99.6){
      fill(#FFFF00);
      rect(leaf,x,step,step);
    }
    x+= step;
    if(x>250){
     x=0; 
    }
  }
  x=240;
  color[] colours2 = {#2F1B27,#4C2909, #914D12, #E1E5F1};
  noiseSeed(int(random(10000)));
  for(int i =0; i<2000; i++){
    leaf = floor(random(-x/step*0.5,x/step*0.5))*step;
    if(leaf > 40){
       leaf = 40; 
    }else if(leaf < -40){
       leaf = -40;
    }
    leafColor = int(map(leaf,-100,100,0,3));
    leafColor = floor(leafColor + randomGaussian());
    if(leafColor>3) leafColor = 3;
    if(leafColor<0) leafColor = 0;
    
    fill(colours2[leafColor]);
    rect(leaf,x,step,step);
    x+= step;
    noiseSeed(x);
    if(x>300){
     x=250; 
    }
  }
  x=0;
  popMatrix();
}

void drawBall(float posX, float posY){
  pushMatrix();
  translate(posX,posY);
  fill(#ff0000);
  rect(step,0,step*2,step*4);
  rect(0,step,step*4,step*2);
  fill(#ffdddd);
  rect(step*2,step,step,step);
  popMatrix();
}