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

void setup() {
  size(1024,700);
  frameRate(30);
}

void draw(){
  background(250);
  bernd.advise();
  bernd.showStats();
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
