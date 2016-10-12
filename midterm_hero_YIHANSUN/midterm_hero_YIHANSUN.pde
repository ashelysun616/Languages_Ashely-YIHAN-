String state= "pregame"; 
float angle = 0.0;
float offset = 260;
float scalar = 50;
float speed = 0.05;
PImage imgbg;
PImage img1;
PImage imgt3;
PImage imgt4;
PImage imgt5;
PImage imgh1;
PImage imgh2;
PImage imgh3;
PImage imgh4;
PImage Si1;
PImage Si2;
PImage Si3;
PImage t1,t2,t3,t4,t5;
PImage Ch1,Ch2,Ch3,Ch4;
PImage BEh1,BEh2,BEh3,BEh4;
PImage Hh1,Hh2,Hh3,Hh4;
PImage Wh1,Wh2,Wh3,Wh4;
PImage coffee;
PImage monster;
int gameState = 0;
int score = 0;
float counter;
float number;
float x, y;
float k;
float c;
float herox, heroy;
int scoree;
boolean paused;
int a;
int y1,y2,y3,y4,y5,y6;
int yh1,yh2,yh3,yh4;
//random ending
int maxImages = 6; 
int imageIndex = 0; 
boolean isPlaying = false;
PImage[] images = new PImage[maxImages];
import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioSample kick;
AudioSample kick2;

void setup() {
  size(1280, 720);
  colorMode(RGB); 
  frameRate(100);
     minim = new Minim(this);
     player = minim.loadFile("backmusic.mp3");
     kick = minim.loadSample( "DU.mp3", // filename
                            512      // buffer size
                         );
  a = 0;
  for (int i = 0; i < images.length; i ++ ) {
  images[i] = loadImage( "story" + i + ".jpg" );
  ///// monster
  x = random(0,500);
  y = 0;
  smooth();
  herox = width/2;
  heroy = 600;
}
}
/////////////////////////////////
void draw() {
  background(255);
  if (state== "pregame") {  
    player.play();
    background(0);
    textAlign(CENTER);
    textSize(50);
    fill(255);
    text("Do you want to be a super hero?", width/2, height/2);
    textSize(20);
    textAlign(CENTER);
    text("Click to continue", 1100, 650);   
  } 
  ///
  else if (state=="game1") {
    textSize(20);
    textAlign(CENTER);
    noFill();
    ///
    fill(125);
    //rect(790,460,100,100);
    text("Magic Pill", width/2+200, height/2+230);
    noFill();
    imageMode(CORNER);
    img1 = loadImage("2.png");
    image(img1,490,460,300,300); 
     a++;
     fill(random(500),50,100);
     ellipse(width/2+200, height/2+150, 80*sin(a), 80*sin(a));
     noFill();
     circles();
     stroke(255,y3,255);
     strokeWeight(3); 
     noStroke();
     y1+=2;
     y2+=4;
     y3+=3;
     if (y1>520) {
     y1=0;
      }
     if (y2>520) {
     y2=0;
     }
     if (y3>520) {
     y3=0;
     }
  } 
  ////
   else if (state=="game2") {

    textSize(30);
    textAlign(CENTER);
    /////
    fill(255);
    rect(0,620,1280,100);
    noFill();
    strokeWeight(6);  
    stroke(random(0,255), random(0,255), random(0,255),60);
    fill(119,170,255);
    rect(0,0,320,650);
    noFill();
    fill(248,248,250);
    rect(320,0,320,650);
    noFill();
    fill(255,111,105);
    rect(640,0,320,650);
    noFill();
    fill(214,255,227);
    rect(960,0,320,650);
    noFill();
    noStroke();
    image(img1,500,500,250,250); 
    fill(0);
    textSize(40);
    textAlign(CENTER);
    text(".....Transforming.....", width/2, 90);
    textSize(20);
    textAlign(CENTER);
    text("(choose one hero you like)", width/2,130);
    imageMode(CORNER);
    imgh1 = loadImage("h3.png");
    image(imgh1,60,yh1,200,200); 
    imgh2 = loadImage("h2.png");
    image(imgh2,380,yh2,200,200); 
    imgh3 = loadImage("h1.png");
    image(imgh3,680,yh3,200,200); 
    imgh4 = loadImage("h4.png");
    image(imgh4,1040,yh4,200,200); 
     yh1+=25;
     yh2+=28;
     yh3+=24;
     yh4+=30;
     if (yh1>230) {
     yh1=230;
      }
     if (yh2>230) {
     yh2=230;
     }
     if (yh3>230) {
     yh3=230;
      }
     if (yh4>230) {
     yh4=230;
     }
         back();
  }
////hero
else if (state=="hero1") {
  //heroBackground();
  chooseS();
  image(imgh1,mouseX-10,mouseY-10,200,200);
  restart();
     back();
  }
else if (state=="hero2") {
    //heroBackground();
    chooseS();
    image(imgh2,mouseX-10,mouseY-10,200,200);
    restart();
    back();
  }
else if (state=="hero3") {
    //heroBackground();   
    chooseS();
    image(imgh3,mouseX-10,mouseY-10,200,200);
    restart();
    back();
  }
else if (state=="hero4") {
     //heroBackground();
     chooseS();
     image(imgh4,mouseX-30,mouseY-30,200,200);
     restart();
    back();
  }

  //trick
  else if (state=="trick1") {
    background(255);
    textSize(50);
    textAlign(CENTER);
    text("He doesn't want to be chosen", width/2, height/2);
  }
  else if (state=="trick2") {
    background(255);
    textSize(50);
    textAlign(CENTER);
    text("Please try again,he is in the bathroom ", width/2, height/2);
  }
  /////scence
   else if (state=="S1") {
    background(0);
    textSize(20);
    textAlign(CENTER);
    text("Pickup line",100,100);
    imageMode(CENTER);
    image(images[imageIndex],width/2,height/2);
  if (mousePressed == true) {
    if (mouseButton == CENTER) {
      imageIndex = 0;
    }
  }
  if (isPlaying == true) {
    imageIndex = (imageIndex + 1) % images.length;
  }
  println(imageIndex);
  }
   else if (state=="S2h1") {
    background(255);
    game();
    image(imgh1,mouseX-10,mouseY-10,200,200);
    if(counter>5&&score>30){
       gameHh1();

  }
      else if(counter>5&&score<30){ 
        gameBEh1();
      }
      restart();
    back();
   }
      
  else if (state=="S2h2") {
    background(255);
    game();
    image(imgh2,mouseX-10,mouseY-10,200,200);
     if(counter>5&&score>30){
       gameHh2();
   
  }
      else if(counter>5&&score<30){ 
        gameBEh2();
      }
    restart();
    back();
  }
    else if (state=="S2h3") {
    background(255);
    game();
    image(imgh3,mouseX-10,mouseY-10,200,200);
     if(counter>5&&score>30){
       gameHh3();

  }
      else if(counter>5&&score<30){ 
        gameBEh3();
      }
      restart();
    back();
  }
    else if (state=="S2h4") {
    background(255);
    game();
    image(imgh4,mouseX-30,mouseY-30,200,200);
     if(counter>5&&score>30){
       gameHh4();

  }
      else if(counter>5&&score<30){ 
        gameBEh4();
      }
      restart();
    back();
  }
  else if (state=="S3h1") {
   background(255);
  //rect(herox, heroy, 100, 100, 25);
   coffee();
   imageMode(CENTER);
   Ch1= loadImage("Ch1.png");
   image(Ch1,herox, heroy,200,200); 
   if(scoree==10){
     CEh1();
   }
   restart();
    back();
  }
   else if (state=="S3h2") {
    background(255);
     coffee();
   imageMode(CENTER);
   Ch2= loadImage("Ch2.png");
   image(Ch2,herox,heroy,200,200); 
   if(scoree==10){
     CEh2();
   }
    restart();
    back();
  }
   else if (state=="S3h3") {
    background(255);
    coffee();
   imageMode(CENTER);
   Ch3= loadImage("Ch3.png");
   image(Ch3,herox,heroy,200,200); 
   if(scoree==10){
     CEh3();
   }
   restart();
    back();
  }
   else if (state=="S3h4") {
    background(255);
      coffee();
     imageMode(CENTER);
   Ch4= loadImage("Ch4.png");
   image(Ch4,herox,heroy,200,200); 
   if(scoree==10){
     CEh4();
   }
   restart();
    back();
  }
  /////
  else if (state=="game over") {
    background(255);
    text("everyone loses", width/2, height/2);
  } 
}


/////////////////////////////////////////////////////////
void mousePressed() {
      k=random(1,10);
  if (state== "pregame") {
    state="game1";
  }
  ////
  else if (state=="game1"){
    if(mouseX>790 && mouseX<890 && mouseY>460 && mouseY<560){
    state="game2";
    }
  } 
  ////
  else if (state=="game2"){
    if(mouseX > 1080 && mouseY>670){
         state="game1";
    }
    else if(mouseX <= 320 ){
       if(k<=7){
     state="hero1";
          }
        else if(k>7&&k<8){
           state="trick1";
        }
         else if(k>8){
          state="trick2";
          }     
    }
  else if(mouseX > 320 && mouseX<=640){
        if(k<=7){
     state="hero2";
          }
        else if(k>7&&k<8){
           state="trick1";
        }
         else if(k>8){
          state="trick2";
          }     
    }
    else if(mouseX > 640 && mouseX<=960){
        if(k<=6){
     state="hero3";
          }
        else if(k>6&&k<8){
           state="trick1";
        }
         else if(k>8){
          state="trick2";
          }     
    }
     else if(mouseX > 960){
     if(k<=6){
     state="hero4";
          }
        else if(k>6&&k<8){
           state="trick1";
        }
         else if(k>8){
          state="trick2";
          }     
    }
  } 
/////////////////////////////////////////////
 else if(state== "trick1"){
           state="game2";
    }
 else if(state== "trick2"){
           state="game2";
    }
/////////////////////////////////////////////
  else if (state=="hero1"){
    if(mouseX > 1080 && mouseY>670){
         state="game2";
    }
     else if(mouseX<200 && mouseY>670){
         state="pregame";
    }
    else if(mouseX <420){
         state="S1";
    }
    else if(mouseX>420&&mouseX<840){
         state="S2h1";
    }
      else if(mouseX>840){
         state="S3h1";
    }
  } 
   else if (state=="hero2"){
    if(mouseX > 1080 && mouseY>670){
         state="game2";
    }
     else if(mouseX<200 && mouseY>670){
         state="pregame";
    }
    else if(mouseX <420){
         state="S1";
    }
    else if(mouseX>420&&mouseX<840){
         state="S2h2";
    }
      else if(mouseX>840){
         state="S3h2";
    }
  } 
  else if (state=="hero3"){
    if(mouseX > 1080 && mouseY>670){
         state="game2";
    }
     else if(mouseX<200 && mouseY>670){
         state="pregame";
    }
    else if(mouseX <420){
         state="S1";
    }
    else if(mouseX>420&&mouseX<840){
         state="S2h3";
    }
      else if(mouseX>840){
         state="S3h3";
    }
  } 
  else if (state=="hero4"){
    if(mouseX > 1080 && mouseY>670){
         state="game2";
    }
     else if(mouseX<200 && mouseY>670){
         state="pregame";
    }
    else if(mouseX <420){
         state="S1";
    }
    else if(mouseX>420&&mouseX<840){
         state="S2h4";
    }
      else if(mouseX>840){
         state="S3h4";
    }
  } 
  //
    else if (state=="S1"){
    if(mouseX > 1080 && mouseY>670){
         state="pregame";
    }
    else if(mouseX<200 && mouseY>670){
         state="pregame";
    }
  } 
  else if (state=="S2h1"){
    if(mouseX > 1080 && mouseY>670){
         state="hero1";
    }
    else if(mouseX<200 && mouseY>670){
         state="pregame";
    }
  } 
  else if (state=="S2h2"){
    if(mouseX > 1080 && mouseY>670){
         state="hero2";
    }
    else if(mouseX<200 && mouseY>670){
         state="pregame";
    }
  } 
  else if (state=="S2h3"){
    if(mouseX > 1080 && mouseY>670){
         state="hero3";
    }
    else if(mouseX<200 && mouseY>670){
         state="pregame";
    }
  } 
  else if (state=="S2h4"){
    if(mouseX > 1080 && mouseY>670){
         state="hero4";
    }
    else if(mouseX<200 && mouseY>670){
         state="pregame";
    }
  } 
  else if (state=="S3h1"){
    if(mouseX > 1080 && mouseY>670){
         state="hero1";
    }
    else if(mouseX<200 && mouseY>670){
         state="pregame";
    }
  } 
   else if (state=="S3h2"){
    if(mouseX > 1080 && mouseY>670){
         state="hero2";
    }
    else if(mouseX<200 && mouseY>670){
         state="pregame";
    }
  } 
   else if (state=="S3h3"){
    if(mouseX > 1080 && mouseY>670){
         state="hero3";
    }
    else if(mouseX<200 && mouseY>670){
         state="pregame";
    }
  } 
   else if (state=="S3h4"){
    if(mouseX > 1080 && mouseY>670){
         state="hero4";
    }
    else if(mouseX<200 && mouseY>670){
         state="pregame";
    }
   }
}  
///random ending/////////////////////
void keyReleased() {
if (key == ' ' && isPlaying == false) {
    isPlaying = true;
  }
  else if (key == ' ' && isPlaying == true) {
    isPlaying = false;
  }  
  else if (keyCode == RIGHT) {
    if (imageIndex >= 6) {
      imageIndex = 0;
    }
    else {
      imageIndex += 1;
    }
  }
  else if (keyCode == LEFT) {
    // Cycle backwards
    if (imageIndex <= 0) {
      imageIndex = 6;
    }
    else {
      imageIndex -= 1;
    }
  }
}
void mouseClicked() {
  if (mouseButton == LEFT) {
    isPlaying = true;
  }
   else if (mouseButton == RIGHT) {
    isPlaying = false;
  }
}
void mouseReleased() {
  if (gameState == 1) {
      score++;
  }
}
void heroBackground(){
    fill(250,240,230);
    rect(0,620,1280,100);
    noFill();
}
void chooseS(){
  imageMode(CORNER);
      Si1 = loadImage("S1.png");
     image(Si1,0,0,426,620); 
     Si2 = loadImage("S2.png");
     image(Si2,426,0,426,620); 
     Si3 = loadImage("S3.png");
     image(Si3,852,0,430,620); 
     fill(255);
     textSize(50);
     textAlign(CENTER);
       enter(200,400);
     text("Pickup line",200,600);
       enter(640,400);
     text("Save world",640,80);
       enter(1080,400);
     text("Coffee time",1080,600);
}
void back(){
    //fill(255);
    //rect(1080,670,200,50);
    //noFill();
    fill(0);
    textSize(20);
    text("BACK", 1180,700); 
}
void restart(){
    //fill(255);
    //rect(0,670,200,50);
    //noFill();
    fill(0);
    textSize(20);
    text("RESTART", 100,700); 
}
//////////////////////////
void game() {
  noStroke();
/////
  imageMode(CENTER);
  monster= loadImage("monster.png");
  image(monster,width/2,height/2,400,400); 
//////
  if (gameState == 0) {
    textAlign(CENTER, CENTER);
    fill(240);
    textSize(40);
    text("Click to Begin", 150, 200);
    if (mousePressed) {
      gameState = 1;
      counter = 0;
      score = 0;
    }
  }
  if (gameState == 1) {
    counter=counter+0.0183;
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(200);
    text(score,200, 300);
    textSize(25);
    text("Fighting little monsters", 200, 150);
    text(" Countdown", 1100, 275);
    textSize(50);
    fill(0);
    text(counter, 1100, 335);
    textSize(25);
    text("press any key to restart", width/2, 650);
    if (keyPressed) {
      gameState = 0;
       counter = 0;
      score = 0;
    }
  }
  }
void gameHh1(){
  kick.trigger();
  delay(1000);
  imageMode(CENTER);
  Hh1 = loadImage("Hh1.png");
  image(Hh1,width/2,height/2,1280,720); 
}
void gameHh2(){
  imageMode(CENTER);
  Hh2 = loadImage("Hh2.png");
  image(Hh2,width/2,height/2,1280,720); 
}
void gameHh3(){
  imageMode(CENTER);
  Hh3 = loadImage("Hh3.png");
  image(Hh3,width/2,height/2,1280,720); 
}
void gameHh4(){
  imageMode(CENTER);
  Hh4 = loadImage("Hh4.png");
  image(Hh4,width/2,height/2,1280,720); 
}
void gameBEh1(){
  imageMode(CENTER);
  BEh1 = loadImage("BEh1.png");
  image(BEh1,width/2,height/2,1280,720); 
  textSize(45);
  fill(0);
  text("You have lost!Earth explosion is coming...", width/2, 300);
}
void gameBEh2(){
  imageMode(CENTER);
  BEh2 = loadImage("BEh2.png");
  image(BEh2,width/2,height/2,1280,720); 
  textSize(45);
  fill(0);
  text("You have lost,Earth explosion is coming", width/2, 300);
}
void gameBEh3(){
  imageMode(CENTER);
  BEh3 = loadImage("BEh3.png");
  image(BEh3,width/2,height/2,1280,720); 
  textSize(45);
  fill(0);
  text("You have lost,Earth explosion is coming", width/2, 300);
}
void gameBEh4(){
  imageMode(CENTER);
  BEh4 = loadImage("BEh4.png");
  image(BEh4,width/2,height/2,1280,720); 
  textSize(45);
  fill(0);
  text("You have lost,Earth explosion is coming", width/2, 300);
}



void coffee(){  
  background(0);
  fill(255);
  textSize(50);
  textAlign(CENTER);
  text("Coffee time",width/2,100);
  textSize(40);
  text(scoree, width/2, 180);
  ////fall
  imageMode(CENTER);
  coffee= loadImage("coffee.png");
  image(coffee,x,y,100,100); 
  if(!paused) {
    y+=10;
  }
  if (dist(herox, heroy, x, y) <66) {
    //background(255, 0, 0);
    x = random(100,1180);
    y = 0;
    scoree++;
  }
  if (y > 600) {
    x = random(0,500);
    y = 0;
  }
  herox=pmouseX;
}
//////
void CEh1(){
   imageMode(CENTER);
  Wh1 = loadImage("Wh1.png");
  image(Wh1,width/2,height/2,1280,720); 
}
void CEh2(){
   imageMode(CENTER);
  Wh2 = loadImage("Wh2.png");
  image(Wh2,width/2,height/2,1280,720); 
}
void CEh3(){
   imageMode(CENTER);
  Wh3 = loadImage("Wh3.png");
  image(Wh3,width/2,height/2,1280,720); 
}
void CEh4(){
   imageMode(CENTER);
  Wh4 = loadImage("Wh4.png");
  image(Wh4,width/2,height/2,1280,720); 
}
///////
void enter(int w,int h){
noFill();
stroke(255,235,255,60);
for (int i = 0; i < 11; i = i + 1) {
float pingPong = sin(radians((frameCount+5*i)/0.40));
strokeWeight(map(abs(pingPong),0, 1,10, 0));
ellipse(w, h, i*50, i*50);
}
}
void circle3(int z){
  fill(238,237,237,80);
     ellipseMode(CENTER);
     ellipse(z,y3,100,100);
     textSize(50);
     textAlign(CENTER);
     fill(0);
    text(".......", z, y3);
}
void circles(){
float y1 = offset + sin(angle) * scalar;
float y2 = offset + sin(angle + 0.4) * scalar;
float y3 = offset + sin(angle + 0.8) * scalar;
float y4 = offset + sin(angle + 1.2) * scalar;
float y5 = offset + sin(angle + 1.6) * scalar;
fill(255,179,186,70);
ellipse(100, y1, 100, 100);
textSize(20);
textAlign(CENTER);
fill(85);
text(".......", 100, y1);
fill(255,223,186,70);
ellipse(350, y2, 300, 300);
textSize(30);
textAlign(CENTER);
fill(85);
text("Tempting but no", 350, y1);
fill(255,255,186,70);
ellipse(620, y3, 200, 200);
textSize(40);
textAlign(CENTER);
fill(85);
text("Nope", 620, y1);
fill(186,255,201,70);
ellipse(910, y4, 250, 250);
textSize(30);
textAlign(CENTER);
fill(85);
text("Kidding me?", 910, y2);
fill(186,225,255,70);
ellipse(1190, y5, 200, 200);
textSize(40);
textAlign(CENTER);
fill(85);
text(".......", 1190, y1);
angle += speed;
  
}