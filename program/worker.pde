class Worker {
  float x,y,c,n,f,a;
  //Farbe
  float r = random(255);
  float g = random(255);
  float b = random(255);
  //exaustion
  int e = 255;
  //motivation
  int m=255;
  //tempo
  int tempo=round(random(1,5));
  int pocket;
  boolean done = false;
  
  int pos;
  int servo;
  
  Worker (float _x, float _y, int servo_) {
    x=_x;
    y=_y;
    servo = servo_;
  }
  
  void initial(){

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

 if (f>=180){
   done =true;
 }
 else {
   done =false;
 }
 pos = round(f);
 //n = map(f,0,180,0,50);
 pos= round(f);
 fill(r,g,b,m);
 //ellipse(x,y,n,n);
 arduino.servoWrite(servo, pos);
 noFill();
 strokeWeight(5);
 pushMatrix();
 translate(x, y);
 rect(0,40,250,130);
 textAlign(LEFT);
 fill(0);
 text("I have "+pocket+"$ in my Pocket",10,80);
 //text("Tempo "+tempo,x,y+110);
 if (m>=210){
   text("I am motivated",10,110);
 }
 else if (m>=110){
   text("This is boring…",10,110);
 }
 else if (m>=80){
   text("I don't like this work!",10,110);
 }
 text("Exaustion "+e,10,140);
 popMatrix();
   //motivation();
   mouseHover();
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

void mouseHover(){
  
  if (mouseX>=x && mouseX<=x+250 && mouseY>=y+40 && mouseY<=y+130+40){
    pushMatrix();
    translate(x, y);
    fill(255,0,0,230);
    rect(0,40,250,130);
    fill(255);
    textAlign(CENTER);
    text("Alter my Contract",250/2,110);
    popMatrix();
}
}

};
