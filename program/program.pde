import controlP5.*;

ControlP5 cp5;

Manager manager;

Worker worker;
Customer customer;

Worker klaus = new Worker(500,130);
Worker peter = new Worker(300,130);
Worker hans = new Worker(100,130);
Worker dieter = new Worker(700,130);
Worker gerhard = new Worker(900,130);

Customer telekom = new Customer();

Manager bernd = new Manager();

boolean payday = false;

int money;
int sliderMoney;

void setup() {
  size(1024,700);
  cp5 = new ControlP5(this);
  cp5.addSlider("sliderMoney")
  .setPosition(85,height/2)
  .setSize(20,100)
  .setRange(0,50)
  .setNumberOfTickMarks(5); 
}

void draw(){
  background(#2c3e50);
  bernd.advise();
  money();
}
void money(){
  telekom.getProduct(3);
  bernd.isPayday();
  klaus.reward();
  peter.reward();
  hans.reward();
  dieter.reward();
  gerhard.reward();   
  fill(0);
  textAlign(CENTER);
  text("You have "+money+"$",width/2,50);
}
