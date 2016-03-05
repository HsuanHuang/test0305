class Timer{
  int second;
  int minute;
  int a;
  boolean addMinute;
  boolean can;
  Timer(){
    second=0;
    minute=0;
    addMinute=false;
    can=false;
  }
  void counting(){
    
    a=millis();
    second=(a%60000)/1000;
    if(second==0){
      can=true;  
      
    }
    
    if(second>30 && second <40){
      addMinute=false;
      can=false;
    }
  }

  void addMinute(){
    if(can){
      if(addMinute){
        return;
      }
      addMinute=true;
      minute+=1;   
    }
  }


}