Manager manager;
Worker worker;

Worker klaus = new Worker(400,300,255);
Worker peter = new Worker(200,300,255); 

int money;

void setup() {
  size(600,600);
  //frame.setResizable(true);
}

void draw(){
  background(150);
  peter.work();
  klaus.work();
  
  money();
}

void money(){
  if (peter.done() || klaus.done()){
    money +=1;
  }
  textAlign(CENTER);
  text("You have "+money+" Dollar",width/2,50);
}
