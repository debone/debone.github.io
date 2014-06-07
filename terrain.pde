class Terrain{
   PVector mag;
  
   float height(float pos){
      return game.viewPortSize.y-200+sin(pos/40)*40+noise(pos/500)*200;
   }
  
   boolean hit(PVector pos, PVector acc, int size){
      mag = pos.get();     
      mag.add(acc);
      if(mag.y > height(mag.x)){
        return true;
      }
      return false;
   }
  
   PVector bounce(PVector pos, PVector acc){
     float accMag = acc.mag();
     PVector plano = new PVector(6,
       height(pos.x+3)-height(pos.x-3)
     );
     plano.rotate(-HALF_PI);
     plano.normalize();
     acc.normalize();
     acc.mult(-1);
     plano.mult(1.6*plano.dot(acc));
     plano.sub(acc);
     acc = plano.get();
     acc.mult(accMag);
     
     return acc;
   }
  
   void draw(){
      float sinValue = game.viewPort.x;
      for(float i=0; i<game.viewPortSize.x; i++){ 
         float w = height(sinValue) - game.viewPort.y;
         strokeWeight(1);
         stroke(#3EE34F);
         line(i, w, i, game.viewPortSize.y);
         strokeWeight(5);
         stroke(#A06B17);
         point(i, w);

         sinValue+= 1;
      }
      
      //DEBUG Lines
      /*
      stroke(#0000ff);
      line(0,0,mag.x-game.viewPort.x,mag.y-game.viewPort.y);
      stroke(#FF0000);
      line(mag.x-game.viewPort.x,height(mag.x)-game.viewPort.y,mag.x-game.viewPort.x,height);
      /**/   
   } 
}
