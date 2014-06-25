import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

Ani aniX1,aniY1,aniX2,aniY2,aniX3,aniY3;

import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

import controlP5.*;
PFont font;
ControlP5 cp5;

Manager manager;

Worker worker;
Customer customer;

Worker worker1 = new Worker(1,560,0,7);
Worker worker2 = new Worker(2,290,0,6);
Worker worker3 = new Worker(3,20,0,5);
Worker worker4 = new Worker(4,20,190,4);
Worker worker5 = new Worker(5,290,190,3);
boolean infolayer=false;
int layer=0;

Customer telekom = new Customer();

Manager bernd = new Manager();

boolean payday = false;

int money;
int sliderMoney1,sliderMoney2,sliderMoney3,
    sliderMoney4,sliderMoney5;

void setup() {
  size(830,768);
  font = loadFont("FiraSansOT-Bold-20.vlw");
  font = loadFont("FiraSansOT-Bold-48.vlw");
  textFont(font, 20);
  cp5 = new ControlP5(this);
  worker1.init();
  worker2.init();
  worker3.init();
  worker4.init();
  worker5.init();
  
  /*println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[7], 57600);
  arduino.pinMode(7, Arduino.SERVO);
  arduino.pinMode(6, Arduino.SERVO);
  arduino.pinMode(5, Arduino.SERVO);
  arduino.pinMode(4, Arduino.SERVO);*/
}

void draw(){
  //background(#e6e6e6);
  background(255);
  bernd.advise();
  money();
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text("The Factory has "+money+"$",width/2,height-50);
}
void money(){
  telekom.getProduct(3);
  bernd.isPayday();
  worker1.reward();
  worker2.reward();
  worker3.reward();
  worker4.reward();
  worker5.reward();
  
};
