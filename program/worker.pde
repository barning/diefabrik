class Worker {
  float x,y,c,n,f,a;
  String[] names = {
    "Dieter","Peter","Bernd",
    "Rüdiger","Klaus","Heinz",
    "Klaas","Wilfried","Stefan",
    "Günther","Fiedrich","Gerhard",
  };
  int index;
  boolean tooTired =false;
  boolean pause1,pause2,pause3 = false;
  
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
  
  void init(){
  slider = cp5.addSlider("sliderMoney"+index)
    .setPosition(100,height-400)
    .setSize(80,300)
    .setRange(0,5)
    .setNumberOfTickMarks(5)
    .setColorBackground(0)
    .showTickMarks(false);
 
    cp5.getController("sliderMoney"+index).hide();
  }
  
  void work(){
    if (e>=255){
      tooTired=true;
    }
    
    if (m>=255){
      m=255;
    }
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
 pos= int(f);
 //arduino.servoWrite(servo, pos);
    
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

 noStroke();
 pushMatrix();
 translate(x, y);
  fill(#03a9f4);
    rect(0,m1,75,m2);
  fill(#ff5722);
    rect(87,t1,75,t2);
  fill(#259b24);
    rect(174,e1,75,e2);
  textAlign(CENTER);
 if (tooTired){
  fill(255,255,255,200);
  rect(0,40,250,130);
 }
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
   m+=r;
 }

void mouseInteraction(){
  if (mouseX>=x && mouseX<=x+250 && mouseY>=y+40 && mouseY<=y+130+40){
    pushMatrix();
    translate(x, y);
    fill(#ff5177);
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
  //background(#e6e6e6);
  background(255);
  textFont(font, 48);
  textAlign(LEFT);
  textSize(42);
  cp5.getController("sliderMoney"+index).show();
  
  fill(0);
  rect(500,height-400,40,40);
  rect(500,height-300,40,40);
  rect(500,height-200,40,40);
  
  if (mouseX>=500 && mouseX<=500+40 && mouseY>=height-400 && mouseY<=height-400+40){
    if (mousePressed && pause1==true){
        fill(0);
        rect(500,height-400,40,40);
        pause1=false;
      }
      if (mousePressed&&pause1==false){
        fill(#03a9f4);
        rect(500,height-400,40,40);
        pause1=true;
      }
  }
  
  if (mouseX>=500 && mouseX<=500+40 && mouseY>=height-300 && mouseY<=height-300+40){
    if (mousePressed && pause1==true){
        fill(0);
        rect(500,height-300,40,40);
        pause2=false;
      }
      if (mousePressed&&pause2==false){
        fill(#03a9f4);
        rect(500,height-300,40,40);
        pause2=true;
      }
  }
  
    if (mouseX>=500 && mouseX<=500+40 && mouseY>=height-200 && mouseY<=height-200+40){
    if (mousePressed && pause1==true){
        fill(0);
        rect(500,height-200,40,40);
        pause3=false;
      }
      if (mousePressed&&pause3==false){
        fill(#03a9f4);
        rect(500,height-200,40,40);
        pause3=true;
      }
  }
  fill(0);
  textFont(font, 24);
  if (pause1){
    text("I work at morning",580,height-370);
  }
  if(pause2){
    text("I work at noon",580,height-270);
  }
  if(pause3){
    text("I work at evening",580,height-170);
  }
  
//***General Infos****//
fill(0);
textFont(font,48);
  text("Hi, I'm "+names[index],10,50);
    fill(#03a9f4);
      text("My Motivation is at "+m,10,100);
    fill(#ff5722);
      text("My Tempo is "+tempo,10,150);
    fill(#259b24);
      text("My Exhaustion is at "+e,10,200);
    fill(#00bcd4);
      text("I have "+pocket+"$ in my Pocket",10,250);
      
//**Control Infos**//

  textSize(20);
  fill(0);
  text("I earn "+round(cp5.getController("sliderMoney"+index).getValue())+"$ per minute",200,500);
//**This closes the Layer**//
  if(mouseX>=width-60 && mouseX<=(width-60)+80 && mouseY>=0 && mouseY <=60){
    textSize(42);
    fill(#bdbdbd);
    text("x",width-50,40);
  if (mousePressed)
  {
    infolayer=false;
    cp5.getController("sliderMoney"+index).hide();
  }
  }
  else {
    textSize(42);
    fill(0);
    text("x",width-50,40);
  }
}
};
