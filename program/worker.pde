class Worker {
  float x,y,c,n,f,a;
  String[] names = {
    "Dieter","Peter","Bernd",
    "Rüdiger","Klaus","Heinz",
    "Klaas","Wilfried","Stefan",
    "Günther","Fiedrich","Gerhard",
  };
  int index;
  
  //exaustion
  int e = int(random(10));
  //motivation
  int m=round(random(100,255));
  //tempo
  int tempo=round(random(1,5));
  int pocket;
  boolean done = false;
  
  int pos;
  int servo;
  
  Worker (int name_,float _x, float _y, int servo_) {
    x=_x;
    y=_y;
    servo = servo_;
    index=name_;
  }
  void calculate(){

   if (m>=0 && e<=255){ //wenn motivation über 40 und die exhaustion zu viel
    f=f+a;
    if (f >=180){
      a=(tempo*-1);
    }
    else if (f==0) {
     a=tempo;
   }
 }
 if (done){
   e+=4;
   m-=2;
 }
 
 if (f>=180){
   done =true;
 }
 
 else {
   done =false;
 }
 }
 void showWork(){
 //Motivation umrechen für Balken
 float m1 = map(m,0,255,130,40);
 float m2 = map(m,0,255,40,130);
 
 //Tempo umrechnen für Balken
 float t1 = map(tempo,1,5,130,40);
 float t2 = map(tempo,1,5,40,130);
 
 //Exhaustion umrechnen für Balken
 float e1 = map(e,0,255,130,40);
 float e2 = map(e,0,255,40,130);
 
 pos= int(f);
 //arduino.servoWrite(servo, pos);
 
 noStroke();
 pushMatrix();
 translate(x, y);
  fill(#719f9a);
    rect(0,m1,75,m2);
  fill(#efc639);
    rect(87,t1,75,t2);
  fill(#f25e59);
    rect(174,e1,75,e2);
  textAlign(CENTER);
  fill(0);
  text(names[index],250/2,200);
  popMatrix();
  mouseInteraction();
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

void mouseInteraction(){
  if (mouseX>=x && mouseX<=x+250 && mouseY>=y+40 && mouseY<=y+130+40){
    pushMatrix();
    translate(x, y);
    fill(#547bd2);
    rect(0,40,250,130);
    fill(255);
    textAlign(CENTER);
    textSize(20);
    text("Show more Information",250/2,110);
    popMatrix();
    if (mousePressed){
      infolayer=true;
      layer=index;
  }
  }
}

void moreInfo(){
  translate(0,0);
  background(#e6e6e6);
  textFont(font, 48);
  textAlign(LEFT);
  textSize(42);
  text("Hi, I'm "+names[index],10,50);
    fill(#719f9a);
      text("My Motivation is at "+m,10,100);
    fill(#efc639);
      text("My Tempo is "+tempo,10,150);
    fill(#f25e59);
      text("My Exhaustion is at "+e,10,200);
  if(mouseX>=width-60 && mouseX<=(width-60)+80 && mouseY>=0 && mouseY <=60){
    fill(255);
    text("x",width-50,40);
  if (mousePressed)
  {
    infolayer=false;
  }
  }
  else {
    fill(0);
    text("x",width-50,40);
  }
}
};
