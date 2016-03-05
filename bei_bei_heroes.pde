Cards [] myCard=new Cards[42];
Timer timer;
float []cardX =new float[42];
float []cardY =new float[42];
int []cardFace = new int[42];
int []cardStep= new int[2];
boolean []click =new boolean [42];

PFont myFont;
PFont myFont2;
float spacing = 5;
int initCardFace=0;
int flipped=0;
int nowTime=0;
int delay=0;
int equalWait=0;

int lastCardID_1=0;
int lastCardID_2=0;

void setup() {
  size(1140, 720);
  myFont=createFont("華康墨字體 Std W9", 50);
  myFont2=createFont("Arial",50);
  timer=new Timer();
  resetAll();
  

} 

void draw() {
  background(225, 225, 255);
  for (int i =0; i<42; i++) {
    myCard[i].displayCards();
  }
  
  //gameName
  textFont(myFont, 110);
  textAlign(BOTTOM);
  fill(0);
  text("杯\n杯\n英\n雄", 100, 100);

  textFont(myFont, 40);
  fill(210, 107, 107);
  text("你能找到", 70, 470);
  text("所有的英雄嗎？", 20, 520);
  
  fill(240,240,120);
  ellipse(150,600,130,130);
  textFont(myFont2,50);
  timer.counting();
  timer.addMinute();
  fill(210, 107, 107);
  textAlign(CENTER);
  text((timer.minute-1)+":"+timer.second, 150, 615);

  stroke(190, 194, 255);
  noFill();
  strokeWeight(5);
  for (int i=0; i<42; i++) {
    rect(300+5*((i%7)*2+1)+110*(i%7), 5*(floor(i/7)*2+1)+110*floor(i/7), 110, 110, 7);
  }
}



void resetAll() {
  for (int i=0; i<42; i++) {
    click[i]=false;
    cardX[i]=300+5*((i%7)*2+1)+110*(i%7);
    cardY[i]=5*(floor(i/7)*2+1)+110*floor(i/7);
  }

  for (int i=0; i<21; i++) {
    cardFace[i]=i+1;
    cardFace[21+i]=i+1;
  }
  shuffleCard();
  for (int i=0; i<42; i++) {
    myCard[i]= new Cards(cardX[i], cardY[i], cardFace[i]);
  }
}

void mousePressed() {
  for (int i=0; i<42; i++) {
    if (mouseX > cardX[i] && mouseX <cardX[i]+myCard[i].cardSize && 
      mouseY>cardY[i] && mouseY<cardY[i]+myCard[i].cardSize &&click[i]==false && flipped<2) {
      if (myCard[i].can && myCard[i].click) {

        myCard[i].displayCardFront();
        click[i]=true;
        myCard[i].click=false;
        cardStep[flipped]=i;

        flipped ++;

        if (flipped == 2) {
          flipped=0;

          if (cardFace[cardStep[0]] == cardFace[cardStep[1]]) {
            if ( myCard[cardStep[0]].click ==false && myCard[cardStep[1]].click ==false) {
              myCard[cardStep[0]].can=false;
              myCard[cardStep[1]].can=false;
            }

          }

          if (cardFace[cardStep[0]] != cardFace[cardStep[1]]) {          
            myCard[cardStep[0]].flipBackwithDelay(1);
            myCard[cardStep[1]].flipBackwithDelay(1);


            for (int j=0; j<42; j++) {
              myCard[j].click=true;
              click[j]=false;
            }
          }
        }
      }
    }
  }
}

void shuffleCard() {
  int temp=0;
  int rand=0;
  for (int i=0; i<42; i++) {
    rand =int(random(0, 42));
    temp = cardFace[i];
    cardFace[i] = cardFace[rand];
    cardFace[rand] =temp;
  }
}