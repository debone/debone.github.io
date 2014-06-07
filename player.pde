class Player{
  PVector pos;
  PVector acc;
  int size;
  
  Player(){
    pos = new PVector(200,0);
    acc = new PVector(0,0);
    size= 20;
  }
  
  float posX(){
     return pos.x; 
  }
  
  float posY(){
     return pos.y; 
  }
  
  float accX(){
     return acc.x; 
  }

  void move(PVector movement){
    pos.add(movement);
  }
  
  void update(){
     if(acc.x<4){
        acc.x = 4; 
     }
     
     if(terreno.hit(pos, acc, size/2)){
        acc = terreno.bounce(pos, acc);
     }else{
       //Gravity
       acc.add(new PVector(0,game.gravidade));
     }
     move(acc);
  }
  
  void draw(){
      stroke(#123456);
      fill(#ffffff);
      ellipse(pos.x-game.viewPort.x, pos.y-game.viewPort.y, size, size); //x,y,sizeX,sizeY
  }
}
