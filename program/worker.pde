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
  boolean work=true;
  boolean pause;
  
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
    .setPosition(100,height-500)
    .setSize(80,300)
    .setRange(0,5)
    .setValue(1)
    .setNumberOfTickMarks(5)
    .setColorBackground(0)
    .showTickMarks(false);
    
    cp5.getController("sliderMoney"+index).hide();
  }
  
  void work(){


    if (work==false){
      pause=true;
    }
    if (pause){
      work=false;
      e--;
    }
    if (e<0){
      e=0;
    }
    
    if (work){

      if (e>=255){
        tooTired=true;
      }
      
      if (m>=255){
        m=255;
      }
   if (m>=40 || e<=250){ //wenn motivation über 40 oder die exhaustion zu viel
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
 arduino.servoWrite(servo, pos);
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
 if (tooTired||pause){
  fill(255,255,255,200);
  rect(0,40,250,130);
}
fill(0);
textFont(font20, 20);
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
  textFont(font48, 48);
  textAlign(LEFT);
  textSize(42);
  cp5.getController("sliderMoney"+index).show();
  
  fill(#e74c3c);
  rect(600,height-500,40,40);
  fill(#2ecc71);
  rect(600,height-430,40,40);
  
  if (mouseX>=600 && mouseX<=600+40 && mouseY>=height-500 && mouseY<=height-500+40){
    if (mousePressed && work==false){
      fill(#00b6ea);
      rect(600,height-500,40,40);
      pause=false;
      work=true;
    }
  }
  
  if (mouseX>=600 && mouseX<=600+40 && mouseY>=height-430 && mouseY<=height-430+40){
    if (mousePressed && work==true){
      fill(#00b6ea);
      rect(600,height-430,40,40);
      pause=true;
      work=false;
    }
  }
  fill(0);
  textFont(font20, 24);
  if (work){
    text("I Work",680,height-470);
  }
  
  if (work==false && pause==true){
    text("I make a pause",680,height-400);
  }

  
//***General Infos****//
fill(0);
textFont(font48,48);
text("Hi, I'm "+names[index],100,150);
fill(#03a9f4);
text("My Motivation is at "+m,100,230);
fill(#ff5722);
text("My Tempo is "+tempo,100,310);
fill(#259b24);
text("My Exhaustion is at "+e,100,390);
fill(#00bcd4);
text("I have "+pocket+"$ in my Pocket",100,470);

//**Control Infos**//

textSize(20);
fill(0);
text("I earn "+round(cp5.getController("sliderMoney"+index).getValue())+"$ per minute",220,height-350);
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
