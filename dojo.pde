/* @pjs font="ComicSansMS.ttf"; */

Player seno;
Game game;
Terrain terreno;

int highScore = 0;

void setup() {
  size(700, 450);
  
  textFont(loadFont("ComicSansMS"),48);
 
  seno = new Player();
  game = new Game();
  terreno = new Terrain();
}

void draw() {
  background(#B6FAF8);
  update();
  display();
}

void update() {
  game.update();
  seno.update();
  if(game.gameState==0){
    noLoop();
  }else if(game.gameState==1){
    if(keyPressed){
      if (keyCode==DOWN) {
        if(seno.acc.y<8){
          seno.acc.add(new PVector(0, 0.2));
        }
      }
    }
  }else if(game.gameState==2){
    noiseSeed(ceil(random(1000)));
    noLoop();
  }
}

void keyPressed(){
   if(game.gameState==0){
      if(key=='s'){
         game.gameState=1;
         loop(); 
      }
   }else if(game.gameState==2){
      if(key=='r'){
         setup();
         game.gameState=1;
         loop(); 
      }
   }
}

void display() {
  terreno.draw();
  seno.draw();
  game.draw();
}

