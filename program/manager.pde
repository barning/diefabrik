class Manager { 
int lastTime = 0;
  void isPayday(){ 
    if( millis() - lastTime >= 60000){
      println("payday");
      worker1.myPocket(sliderMoney1);
      worker2.myPocket(sliderMoney2);
      worker3.myPocket(sliderMoney3);
      worker4.myPocket(sliderMoney4);
      worker5.myPocket(sliderMoney5);
      worker6.myPocket(sliderMoney6);
      worker7.myPocket(sliderMoney7);
      worker8.myPocket(sliderMoney8);
      worker9.myPocket(sliderMoney9);
      lastTime = millis();
    }
  }
  void advise(){
    worker1.work();
    worker2.work();
    worker3.work();
    worker4.work();
    worker5.work();
    worker6.work();
    worker7.work();
    worker8.work();
    worker9.work();
   if (infolayer == false){
    worker1.showWork();
    worker2.showWork();
    worker3.showWork();
    worker4.showWork();
    worker5.showWork();
    worker6.showWork();
    worker7.showWork();
    worker8.showWork();
    worker9.showWork();
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
       case 6:
         worker6.moreInfo();
         break;
       case 7:
         worker7.moreInfo();
         break;
       case 8:
         worker8.moreInfo();
         break;
       case 9:
         worker9.moreInfo();
         break;
     }
   }
  } 
};
