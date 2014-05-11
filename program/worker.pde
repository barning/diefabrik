class Worker {
  float x,y,c,n,f,a;
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float m = random(20,60); //motivation
  int pocket;
  
  Worker (float _x, float _y, float _c) {
    x = _x;
    y = _y;
    c = _c;
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
    arc(x, y, 80, 80, 0, n, PIE);
  }
  
  void reward(int p){
    if (n >=3){
     money +=5;
     pocket+=p;
     money-=p;
    }
    myPocket();
  }
  
  void myPocket() {
    textAlign(CENTER);
    fill(0);
    text("I have "+pocket+"$ in my Pocket",x,y+80);
  }
  
};
