class Game{
  /*GAMESTATES
  * 0 -> Inicial
  * 1 -> Jogo
  * 2 -> Game Over
  */
  int gameState;
  int pontos;
  
  float gravidade;
  
  PVector viewPort;
  PVector viewPortSize;
  
  PVector darkness;
  float darknessAcc;
  
  
  Game(){
    gameState = 0;  
    viewPort = new PVector(0,0);
    viewPortSize = new PVector(width, height);
    gravidade = 0.05;
    
    darkness = new PVector(0,0);
    darknessAcc = 4;
  }
  
  void update(){
    viewPort.x = seno.posX()-200;
    if(seno.posY()<100){
      viewPort.y = seno.posY()-100;
    }else{
      viewPort.y = 0;
    }
    
    darkness.add(new PVector(darknessAcc,0));
    darknessAcc += 0.005;
    
    if(darkness.x>seno.posX()){
       gameState = 2; 
    }
  }
  
  void draw(){
    //Score e darkness
    fill(#000000);
    textSize(24);
    text("Distancia:"+floor(seno.posX()/25)+"\n"+
         "Escuridao:"+floor(seno.posX()/25-darkness.x/25)+"\n"+
         "Highscore:"+highScore
    ,500,30); 
    
    //Darkness
    fill(#000000);
    rect(0,0,darkness.x-game.viewPort.x,height);
    
    textSize(48);
    if(game.gameState==0){
       text("Pressione S para começar",60,210); 
    }else if(game.gameState==2){
       highScore = (floor(seno.posX()/25)>highScore) ?
                   floor(seno.posX()/25) :
                   highScore;
       fill(#000000);
       rect(0,200,width,100);
       fill(#ffffff);
       text("GAME OVER!",200,270);
    }
  }
}
