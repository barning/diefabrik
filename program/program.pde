import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

Ani aniX1,aniY1,aniX2,aniY2,aniX3,aniY3;

import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

PVector v1,v2,v3,v4;

import controlP5.*;
PFont font;
ControlP5 cp5;

Manager manager;

Worker worker;
Customer customer;

Worker klaus = new Worker(560,0,7);
Worker peter = new Worker(290,0,6);
Worker hans = new Worker(20,0,5);
Worker dieter = new Worker(20,150,4);
Worker gerhard = new Worker(290,150,3);

Customer telekom = new Customer();

Manager bernd = new Manager();

boolean payday = false;

int money;
int sliderMoney;

void setup() {
  size(830,768);
  font = loadFont("FiraSansOT-Bold-20.vlw");
  textFont(font, 20);
  cp5 = new ControlP5(this);
  cp5.addSlider("sliderMoney")
  .setPosition(85,height/2)
  .setSize(20,100)
  .setRange(0,50)
  .setNumberOfTickMarks(5); 
  cp5.hide();
  
  println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[7], 57600);
  arduino.pinMode(7, Arduino.SERVO);
  arduino.pinMode(6, Arduino.SERVO);
  arduino.pinMode(5, Arduino.SERVO);
  arduino.pinMode(4, Arduino.SERVO);
  
  v1 = new PVector(width/2, height/2);
  v2 = new PVector(width/2, height/2);
  v3 = new PVector(width/2, height/2);
  v4 = new PVector(width/2, height/2);
}

void draw(){
  background(255);
  bernd.advise();
  money();
  fill(0);
  textAlign(CENTER);
  text("The Factory has "+money+"$",width/2,height-100);
}
void money(){
  telekom.getProduct(3);
  bernd.isPayday();
  klaus.reward();
  peter.reward();
  hans.reward();
  dieter.reward();
  gerhard.reward(); 
  
};
