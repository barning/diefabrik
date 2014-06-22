class Manager { 

  void isPayday(){ 
    if (second()==5) {
      println("payday");
      worker1.myPocket(sliderMoney);
      worker2.myPocket(sliderMoney);
      worker3.myPocket(sliderMoney);
      worker4.myPocket(sliderMoney);
      worker5.myPocket(sliderMoney);
    }
  }
  void advise(){
    worker1.calculate();
    worker2.calculate();
    worker3.calculate();
    worker4.calculate();
    worker5.calculate();
   if (infolayer == false){
    worker1.showWork();
    worker2.showWork();
    worker3.showWork();
    worker4.showWork();
    worker5.showWork();
   }
   
   if (infolayer==true){
     switch(layer) {
       case 1:
         worker1.moreInfo();
         break;
       case 2:
         worker2.moreInfo();
         break;
       case 3:
         worker3.moreInfo();
         break;
       case 4:
         worker4.moreInfo();
         break;
       case 5:
         worker5.moreInfo();
         break;
     }
   }
  } 
};
