class Worker {
  float x,y,c,r,f,a;
  
  Worker (float _x, float _y, float _c) {
    x = _x;
    y = _y;
    c = _c;
  }
  
  void work(){
  f=f+a;
  if (f >=30){
    a=(-1);
  }
  else if (f==0) {
     a=1;
  }
    r = map(f,0,30,0,3.1);
    arc(x, y, 80, 80, 0, r, PIE);
  }
  
  boolean done(){
    if (r >=3){
       println("Fertig");
       return true;
     }
     else {
     println("Nicht Fertig");
     return false;
    }
  }
  
};
