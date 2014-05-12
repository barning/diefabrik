class Worker {
  float x,y,c,n,f,a;
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float m = random(20,60); //motivation
  int pocket;
  boolean done = false;
  
  Worker (float _x, float _y) {
    x=_x;
    y=_y;
  }
  
  void work(){
    f=f+a;
    if (f >=m){
      a=(-1);
    }
    else if (f==0) {
     a=1;
   }
   n = map(f,0,m,0,3.1);
   fill(r,g,b);
   noStroke();
   rectMode(CENTER);
   arc(x, y, 80, 80, 0, n, PIE);
   textAlign(CENTER);
   fill(0);
   text("I have "+pocket+"$ in my Pocket",x,y+80);
   //motivation();
 }
 
 void reward(){
  if (n >=3){
   done =true;
  }
  else {
    done = false;
  }
}

void myPocket(int r) {
  money-=r;
  pocket+=r;
}

void motivation(){
  rect(x,y+120,90,20);
  fill(255);
  text("MOTIVATE!",x,y+123);
  if (mouseX>=x-90 && mouseX<=x+90 && mouseY>=y+120 && mouseY<=y+120+20 && mousePressed){
    fill(r,g,b);
    rect(x,y+120,90,20);
    m-=1;
  }
}

};
