class Worker {
  float x,y,c,n,f,a;
  //Farbe
  float r = random(255);
  float g = random(255);
  float b = random(255);
  
  //exaustion
  int e = 255;
  //motivation
  int m=round(random(150,255));
  //tempo
  int tempo=round(random(1,10));
  
  int pocket;

  boolean done = false;
  
  Worker (float _x, float _y) {
    x=_x;
    y=_y;
  }
  
  void work(){
    
   if (m>=40){ //solange moti über 40
    f=f+a;
    if (f >=180){
      a=(tempo*-1);
    }
    else if (f==0) {
     a=tempo;
   }
 }
 if (done){
   m-=6;
 }
 n = map(f,0,180,0,50);
 
 fill(r,g,b,m);
 noStroke();
 ellipse(x,y,n,n);   
 textAlign(CENTER);
 fill(255);
 text("I have "+pocket+"$ in my Pocket",x,y+80);
 text("Tempo "+tempo,x,height-200);
 text("Motivation "+m,x,height-180);
 text("Exaustion "+e,x,height-160);
   //motivation();
 }
 
 void reward(){
  if (f >=180){
   done =true;
 }
 else {
  done = false;
}
}

void myPocket(int r) {
  money-=r;
  pocket+=r;
  m+=r*2;
}

void motivation(){
  rect(x,y+120,90,20);
  fill(255);
  rectMode(CENTER);
  text("MOTIVATE!",x,y+123);
  if (mouseX>=x-90 && mouseX<=x+90 && mouseY>=y+120 && mouseY<=y+120+20 && mousePressed){
    fill(r,g,b);
    rect(x,y+120,90,20);
    tempo+=1;
  }
}

};
