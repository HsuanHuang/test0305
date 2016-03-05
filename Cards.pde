class Cards{
  int totalCard=22;
  int cardSize=110;
  float cardX=0;
  float cardY=0;
  int heroCardNum=0;
  int show=0;
  boolean can=true;
  boolean click=true;
  PImage heroCard;
  
  int flipTime=0;
  int delayTime=0;
  boolean flipState=false;
  
  String [] cardName = new String [totalCard];
  
  
  Cards(float x, float y, int h){
    cardX=x;
    cardY=y;
    heroCardNum=h;
    for(int i=0;i<totalCard;i++){
      cardName[i] = i+".jpg";
    } 

  }
  
  void flipBack(){
    show=0;
  }
  
  void displayCards(){
    if(millis()>flipTime + delayTime && flipState){
      show=0;
      flipState=false;
    }
    heroCard=loadImage("img/"+cardName[show]);
    image(heroCard, cardX, cardY);
  }
  
  void displayCardFront(){
    show=heroCardNum;
  }
  
  void flipBackwithDelay(int seconds){
    flipTime=millis();
    delayTime=seconds * 450;
    flipState=true;
  }
  
  
}