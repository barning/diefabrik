import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

import controlP5.*;
PFont font20,font48;
ControlP5 cp5;
Slider slider;
CheckBox checkbox;

Manager manager;

Worker worker;
Customer customer;

Worker worker1 = new Worker(1,810+90,0,7);
Worker worker2 = new Worker(2,405+90,0,6);
Worker worker3 = new Worker(3,20+90,0,5);
Worker worker4 = new Worker(4,20+90,250,4);
Worker worker5 = new Worker(5,405+90,250,3);
Worker worker6 = new Worker(6,810+90,250,2);
Worker worker7 = new Worker(7,20+90,500,1);
Worker worker8 = new Worker(8,405+90,500,0);
Worker worker9 = new Worker(9,810+90,500,3);

boolean infolayer=false;
int layer=0;

Customer telekom = new Customer();

Manager bernd = new Manager();

boolean payday = false;

int money;
int expectation = int(random(10000,20000));
int sliderMoney1,sliderMoney2,sliderMoney3,
    sliderMoney4,sliderMoney5,sliderMoney6,sliderMoney7,sliderMoney8,sliderMoney9;
void setup() {
  size(1280,1024);
  font20 = loadFont("FiraSansOT-Bold-20.vlw");
  font48 = loadFont("FiraSansOT-Bold-48.vlw");
  textFont(font20, 20);
  cp5 = new ControlP5(this);
  worker1.init();
  worker2.init();
  worker3.init();
  worker4.init();
  worker5.init();
  worker6.init();
  worker7.init();
  worker8.init();
  worker9.init();
  
  arduino = new Arduino(this, Arduino.list()[7], 57600);
  arduino.pinMode(0, Arduino.SERVO);
  arduino.pinMode(1, Arduino.SERVO);
  arduino.pinMode(2, Arduino.SERVO);
  arduino.pinMode(3, Arduino.SERVO);
  arduino.pinMode(4, Arduino.SERVO);
  arduino.pinMode(5, Arduino.SERVO);
  arduino.pinMode(6, Arduino.SERVO);
  arduino.pinMode(7, Arduino.SERVO);
  arduino.pinMode(8, Arduino.SERVO);

}

void draw(){
  //background(#e6e6e6);
  background(255);
  bernd.advise();
  money();
  fill(0);
  textAlign(CENTER);
  textFont(font48, 48);
  textSize(48);
  text("The Factory has "+money+"$",width/2,height-120);
  textSize(28);
  text("The Company wants "+expectation+"$",width/2,height-80);
  
  if (money>=expectation){
    expectation=expectation+round(random(20000,30000));
  }
  
}

void money(){
  telekom.getProduct(3);
  bernd.isPayday();
  worker1.reward();
  worker2.reward();
  worker3.reward();
  worker4.reward();
  worker6.reward();
  worker7.reward();
  worker8.reward();
  worker9.reward();
};
