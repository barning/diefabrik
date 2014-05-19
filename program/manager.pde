class Manager {
 
 void isPayday(){ 
    if (second()==59) {
      klaus.myPocket(2);
      peter.myPocket(2);
      hans.myPocket(2);
      dieter.myPocket(2);
      gerhard.myPocket(2);
    }
    else {
    }
  }
  
  void advise(){
    peter.work();
    klaus.work();
    hans.work();
    dieter.work();
    gerhard.work();
  }
  
  void showStats(){
    fill(0);
    text("Tempo "+peter.tempo,peter.x,height-200);
    text("Tempo "+klaus.tempo,klaus.x,height-200);
    text("Tempo "+hans.tempo,hans.x,height-200);
    text("Tempo "+dieter.tempo,dieter.x,height-200);
    text("Tempo "+gerhard.tempo,gerhard.x,height-200);
    
    text("Motivation "+peter.m,peter.x,height-180);
    text("Motivation "+hans.m,hans.x,height-180);
    text("Motivation "+klaus.m,klaus.x,height-180);
    text("Motivation "+dieter.m,dieter.x,height-180);
    text("Motivation "+gerhard.m,gerhard.x,height-180);
  }
};
