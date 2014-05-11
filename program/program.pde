Manager manager;
Worker worker;

Worker klaus = new Worker(400,300,255);
Worker peter = new Worker(200,300,255); 

int money= 20;

void setup() {
  size(600,600);
  frameRate(30);
}

void draw(){
  background(250);
  peter.work();
  klaus.work();
  money();
}

public void money(){
  klaus.reward(1);
  peter.reward(1);
  fill(0);
  textAlign(CENTER);
  text("You have "+money+"$",width/2,50);
}
