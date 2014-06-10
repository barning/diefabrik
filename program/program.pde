import controlP5.*;
PFont font;
ControlP5 cp5;

Manager manager;

Worker worker;
Customer customer;

Worker klaus = new Worker(560,0);
Worker peter = new Worker(290,0);
Worker hans = new Worker(20,0);
Worker dieter = new Worker(20,150);
Worker gerhard = new Worker(290,150);

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
}

void draw(){
  background(255);
  println(mouseX,mouseY);
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
