import processing.serial.*;
import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioPlayer player2;
AudioPlayer player3;
Serial myPort;  // Create object from Serial class
int ar1; 
//////
String f= "prestory"; 
Cir[] cirs=new Cir[32];
float s = 8;
int cir;
float a = 0;
int ct,ft;
PVector loc;
int maxParticles = 100; 
int maxParticlesE = 50; 
int num = 200;
float d1=100;//change
float d2=300;
float d3=200;
float d4=60;
float d5=100;
float d6=100;
float d7=100;
PImage f1,f2,f3,f4,f5;
PImage up,down,left,right;
PImage P,S,A,W;
int ghost=50;
int d;
int N = 8, r = 50;
float k=0, t ;
float Blur=100;
float[] posX = new float[ghost];
float[] posY = new float[ghost];
float[] velX = new float[ghost];
float[] velY = new float[ghost];
float[] diameter = new float[ghost];
int cx=640;
int cy=400;
int cx2=0;
int cy2=600;
int i=0;
int score=0;
int c1=0;
int c2=0;
int c3=0;
int c4=0;
int c5=0;
int c6=0;
int c7=0;
int numm = 60;
float mx[] = new float[numm];
float my[] = new float[numm];
int x5=0;
int y5=0;

void setup() {
  cir=0;
  size (1280, 800);
  printArray(Serial.list()); // this line prints the port list to the console
  String portName = Serial.list()[1]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName , 9600);
  smooth(); 
  noStroke();
  strokeJoin(ROUND);
  for(int i = 0; i < cirs.length; i++)
  {
    cirs[i] = new Cir (a);
    a+= 32;
  }
  for (int i=0; i<ghost; i++) {
    diameter[i] = 77;
    posX[i] = random(0,1280);
    posY[i] = random(0,800);
    velX[i] = random(-4, 4);
    velY[i] = random(-4, 4);   
  }
  minim = new Minim(this);

  // load BD.wav from the data folder
  player = minim.loadFile("music.wav");
  player2 = minim.loadFile("over.wav");
    player3 = minim.loadFile("bell.wav");
  player.play();
  player.loop();
  player.mute();
  player2.play();
  player2.loop();
  player2.mute();
  player3.play();
  player3.loop();
  player3.mute();
}

void draw(){
if ( myPort.available() > 0) { // If data is available,
ar1 = myPort.read(); // read it and store it in val
}
  background(255);
  ct=millis();
  //println(ct,ft);
  println(ar1);
  position();

if (f== "prestory") {   /////first page
//////feather
  myPort.write('0');
  player.unmute();
  player2.mute();
  player3.mute();
  fill(170);
  strokeWeight(2);
  line(481,343,463,506);
  line(550,408,543,514);
  line(639,434,638,513);
  line(731,407,743,524);
  line(798,341,819,510);
  imageMode(CORNER);
  f1= loadImage("f1.png");
  image(f1,525,515,66,170); 
  f2= loadImage("ff2.png");
  image(f2,417,500,72,201); 
  f3= loadImage("f3.png");
  image(f3,611,510,70,240); 
  f4= loadImage("f4.png");
  image(f4,698,504,70,210); 
  f5= loadImage("f5.png");
  image(f5,791,500,60,170); 
///////////  
  noStroke();
  fill(50,205,50);
  ellipse(469, 448, 25, 25);
  textSize(25);
  text("Spring",450,730);
  fill(135,206,235);
  ellipse(548, 463, 25, 25);
  text("Summer",555,730);
  fill(255,97,0);
  ellipse(738, 463, 25, 25);
  text("Autumn",738,730);
  fill(192);
  ellipse(811, 442, 25, 25);
  text("Winter",835,730);
  //fill(176,23,31);
  //ellipse(640, 250, 43, 43);
  noFill();
  
  /////////
  stroke(100);
  strokeWeight(5);
  line(width/2,0,width/2,40);
  noFill();
  noStroke();
  rect(0,0,100,100);
  textSize(30);
  textAlign(CENTER);
  fill(192);
  text("Follow the instructions",width/2-420, 780);
  text("Touch the color you like",width/2+420, 780);
  //text("to find your dream",400, 50);
  for(int i=0;i<cirs.length;i++){
  cirs[i].display();
  cirs[i].spin(); 
  }
  stroke(120);
  strokeWeight(3);
  noFill();
  translate(width/2, height/2-150);
  for (int i = 0; i < 360; i+=30) {
    pushMatrix();
    translate(0, 0);
    rotate(radians(i));
    beginShape();
    for (float q = 0; q <= 20; q+=0.5) {
      float l = (sin(radians(q*13+frameCount))*(7+sin(radians(q*9))*(q*3)));
      vertex(sin(radians(0))*(12+q*s)+l, (12+q*s)+10);
    }
    for (float q = 20; q >= 0; q-=0.5) {
      float l = (sin(radians(q*13+frameCount))*(7+sin(radians(q*9))*(q*3)));
      vertex(sin(radians(0))*(12+q*s)-l, (12+q*s)+10);
    }
    endShape(CLOSE);
    popMatrix();
  }
}
 else if (f=="BothP1") { ////dark background and question 
   both1();
 }
 else if (f=="BothS1") { ////dark background and question
   both1();
 }
 else if (f=="BothA1") { ////dark background and question
   both1();
 }
 else if (f=="BothW1") { ////dark background and question
   both1();
 }
 
 else if (f=="S1"){
  player.unmute();
  player2.mute();
  player3.mute();
   background(0);
   fill(0);
   textSize(30);
   textAlign(CENTER);
   stroke(192);
   text("Summer",80,50);
   P= loadImage("PP.png");
   image(P,70,100,260,260); 
   dream();
    logo();
   fill(255);
   textSize(25);
    if(ct-ft>1500&ct-ft<4000){
     text("Choose some scene you want ",width/2-430,height/2+300);
    }else if(ct-ft>6000&ct-ft<9000){
     text("It will appear in your dream",width/2-430,height/2+300);
    }else if(ct-ft>11000&ct-ft<14000){
      text("Use the color control direction",width/2-430,height/2+300);
      characT();
    }else if(ct-ft>16000&ct-ft<19500){
      text("Now,go to create your dream",width/2-430,height/2+300);
      characT();
    }   
    else if(ct-ft>19500){
    characT();
    choose();
    Change();
    quit();
    }   
   stroke(30,144,255);
   catcher();
 }
 
 else if (f=="P1"){
  player.unmute();
  player2.mute();
  player3.mute();
   background(0);
   fill(0);
   textSize(30);
   textAlign(CENTER);
   stroke(192);
   text("Spring",width/2,height/2);
   S= loadImage("S.png");
   image(S,79,112,238,237); 
   logo();
   dream();
   fill(255);
   textSize(25);
    if(ct-ft>1500&ct-ft<4000){
     text("Choose some scene you want ",width/2-430,height/2+300);
    }else if(ct-ft>6000&ct-ft<9000){
     text("It will appear in your dream",width/2-430,height/2+300);
    }else if(ct-ft>11000&ct-ft<14000){
      text("Use the color control direction",width/2-430,height/2+300);
      characT();
    }else if(ct-ft>16000&ct-ft<19500){
      text("Now,go to create your dream",width/2-430,height/2+300);
      characT();
    } 
    else if(ct-ft>19500){
    characT();
    choose();
    ChangeS();
    quit();
    }   
   stroke(0,199,140); 
   catcher(); 
 }
 else if (f=="A1"){
  player.unmute();
  player2.mute();
  player3.mute();
   background(0);
   fill(0);
   textSize(60);
   textAlign(CENTER);
   stroke(192);
   text("autumn",width/2,height/2);
   A= loadImage("A.png");
   image(A,79,112,238,237); 
   logo();
   dream();
   fill(255);
   textSize(25);
    if(ct-ft>1500&ct-ft<4000){
     text("Choose some scene you want ",width/2-430,height/2+300);
    }else if(ct-ft>6000&ct-ft<9000){
     text("It will appear in your dream",width/2-430,height/2+300);
    }else if(ct-ft>11000&ct-ft<14000){
      text("Use the color control direction",width/2-430,height/2+300);
      characT();
    }else if(ct-ft>16000&ct-ft<19500){
      text("Now,go to create your dream",width/2-430,height/2+300);
      characT();
    }  
    else if(ct-ft>19500){
    characT();
    choose();
    ChangeA();
    quit();
    }   
   stroke(258,128,0); 
   catcher();  
 }
 else if (f=="W1"){
  player.unmute();
  player2.mute();
  player3.mute();
   background(0);
   fill(0);
   textSize(60);
   textAlign(CENTER);
   stroke(192);
   text("winter",width/2,height/2);
   W= loadImage("W.png");
   image(W,79,112,238,237); 
   logo();
   dream();
   fill(255);
   textSize(25);
    if(ct-ft>1500&ct-ft<4000){
     text("Choose some scene you want ",width/2-430,height/2+300);
    }else if(ct-ft>6000&ct-ft<9000){
     text("It will appear in your dream",width/2-430,height/2+300);
    }else if(ct-ft>11000&ct-ft<14000){
      text("Use the color control direction",width/2-430,height/2+300);
     characT();
    }else if(ct-ft>16000&ct-ft<19500){
      text("Now,go to create your dream",width/2-430,height/2+300);
     characT();
    }   
    else if(ct-ft>19500){
    characT();
    choose();
    ChangeW();
    quit();
    }   
   stroke(220); 
   catcher();  
 }
 else if(f=="B2"){
   myPort.write('6');
   player2.unmute();
   player.mute();
   player3.mute();
   delay(1000);
   background(0);
   textSize(50);
   textAlign(CENTER);
   both2();   
   if(ct-ft>1000&ct-ft<4000){
         fill(255);
     text("Your brain is overload",width/2,height/2);
    }else if(ct-ft>4000&ct-ft<7000){
         fill(255);
      text("You can not choose everything",width/2,height/2);
    }else if(ct-ft>9000&ct-ft<12000){
         fill(255);
      text("What can i do now ?",width/2,height/2);
    }else if(ct-ft>12000&ct-ft<15000){
         fill(255);
      text("Come with me,let me help you out",width/2,height/2);
    }else if(ct-ft>15000&ct-ft<18000){
         fill(255);
      text("Touch my heart",width/2,height/2);
    }else if(ct-ft>18000){
      cir++;
      noStroke();
      fill(random(500),50,100);
      ellipse(width/2, height/2, 100*sin(cir), 100*sin(cir));
    }
 }
 else if(f=="B3"){
  player.unmute();
  player2.mute();
  player3.mute();
   myPort.write('7');
   background(0);
   textSize(60);
   textAlign(CENTER);
   if(ct-ft>1000&ct-ft<4000){
     fill(255);
     text("All of your choose is achieve",width/2,height/2);
   } else if(ct-ft>4000&ct-ft<7000){
     turn();
     fill(255);
     textSize(50);
     text("Dreaming",0,200);
   }
 }
 else if(f=="B4"){
  myPort.write('8');
  player.mute();
  player2.mute();
  player3.unmute();
  if(ct-ft>0&ct-ft<5000){
    background(0);
    fill(255);
      text("It is dawn",width/2,height/2);     
   } else if(ct-ft>5000&ct-ft<9000){
      background(255);
      delay(20);
      Blur--;
      noStroke();
      fill(0,0,0,Blur);
      rect(0,0,1280,800); 
   } else if(ct-ft>9000 && ct-ft<13000){
      background(255);
      fill(0);
      text("You need to wake up",width/2,height/2);
   }      
      else if (ct-ft>13000){
      cir++;
      noStroke();
      fill(random(500),50,100);
      ellipse(width/2, height/2, 100*sin(cir), 100*sin(cir));
    }
    
 }
 else if(f=="B5"){
  player.unmute();
  player2.mute();
  player3.mute();
  end();
  characE();
 }
 }

void position() {
  if (f=="prestory"){
if(ct>10000){
    if(ar1==1){
    f="BothP1";
    ft=ct;
    }
    else if(ar1==2){
    f="BothS1";
    ft=ct;
    }
    else if(ar1==3){
    f="BothA1";
    ft=ct;
    }
    else if(ar1==4){
    f="BothW1";
    ft=ct;
    }
  }
}
  else if (f=="BothP1"){
    if(ar1==5){
    f="P1";
    ft=ct;
  }
}
  else if (f=="BothS1"){
    if(ar1==5){
    f="S1";
    ft=ct;
  }
}
  else if (f=="BothA1"){
    if(ar1==5){
    f="A1";
    ft=ct;
  }
}
  else if (f=="BothW1"){
    if(ar1==5){
    f="W1";
    ft=ct;
  }
}
  else if (f=="P1"){
  myPort.write('2');
    if(cx>1180 && cx<1280 && cy>700 && cy<800){
      if(score>4){
    f="B2";
    ft=ct;
  } else if(score<=4){
    f="B3";
    ft=ct;
  }
  }
  }
  else if (f=="S1"){
  myPort.write('3');
    if(cx>1180 && cx<1280 && cy>700 && cy<800){
      if(score>3){
    f="B2";
    ft=ct;
  } else if(score<=3){
    f="B3";
    ft=ct;
  }
    } 
  }
  else if (f=="A1"){
    myPort.write('4');  
    if(cx>1180 && cx<1280 && cy>700 && cy<800){
      if(score>4){
    f="B2";
    ft=ct;
  } else if(score<=4){
    f="B3";
    ft=ct;
  }
    }
  }
  else if (f=="W1"){
   myPort.write('5');
    if(cx>1040 && cx<1280 && cy>700 && cy<800){
      if(score>4){
    f="B2";
    ft=ct;
  } else if(score<=4){
    f="B3";
    ft=ct;
  }
    }
  }
  else if (f=="B2"){
    if(ar1==5){
    f="B4";
    ft=ct;
  } 
  }
  else if (f=="B3"){
    if(ct-ft>7000){
    f="B4";
    ft=ct;
 } 
  }
  else if (f=="B4"){
    if(ar1==5){
    f="B5";
    ft=ct;
 } 
  }
  else if (f=="B5"){
    if(cx2>1200){
     f="prestory";
cx=640;
cy=400;
cx2=0;
cy2=700;
i=0;
score=0;
c1=0;
c2=0;
c3=0;
c4=0;
c5=0;
c6=0;
c7=0;
    }
  }
  ///
 }
  
  
void both1(){
   myPort.write('1');
   background(0);
   fill(255);
   textSize(60);
   textAlign(CENTER);
   if(ct-ft>1500&ct-ft<4000){
     text("Where am I?",width/2,height/2);
    }else if(ct-ft>6000&ct-ft<9000){
      text("It is your dream",width/2,height/2);
    }else if(ct-ft>11000&ct-ft<14000){
      text("Who are you?",width/2,height/2);
    }else if(ct-ft>16000&ct-ft<19000){
      text("I am your dream protector",width/2,height/2);
    }  
    else if(ct-ft>19500){
      textSize(40);
      text("Follow me",width/2,height/2+150);
      cir++;
      noStroke();
      fill(random(500),50,100);
      ellipse(width/2, height/2, 100*sin(cir), 100*sin(cir));
    }
}
void characT(){
  fill(255);
  ellipse(cx,cy,55,55);
  if(ar1==1){
    cy=cy-3;
  }
  else if (ar1==2){
    cy=cy+3;
  }
  else if (ar1==3){
    cx=cx+3;
  }
  else if (ar1==4){
    cx=cx-3;
  }    
}
void characE(){
  fill(0);
  ellipse(cx2,cy2,75,75);
  if(ar1==5){
  cx2=cx2+4;
  }
  textSize(60); 
  text("Come here to restart",width-100,height-100);
}
void choose(){
  if(dist(cx,cy,550,652)<26){
     c1=1;
  } 
  else if(dist(cx,cy,707,470)<33){
     c2=1;
  } 
  else if(dist(cx,cy,1056,524)<45){
     c3=1;
  } 
  else if(dist(cx,cy,1120,150)<33){
     c4=1;
  } 
  else if(dist(cx,cy,781,85)<40){
     c5=1;
  }
  else if(dist(cx,cy,891,295)<40){
     c6=1;
  }
  else if(dist(cx,cy,583,240)<50){
     c7=1;
  }
  score=c1+c2+c3+c4+c5+c6+c7;
  textSize(30);
  text("You choose  " +score,width*2/3,700);
}


void dream(){
   imageMode(CORNER);
   f1= loadImage("f11.png");
   image(f1,124,466,45,120); 
   f2= loadImage("ff2.png");
   image(f2,66,467,41,97); 
   f3= loadImage("f33.png");
   image(f3,180,460,49,153); 
   f4= loadImage("f44.png");
   image(f4,242,454,41,140); 
   f5= loadImage("f55.png");
   image(f5,292,459,36,110); 
   strokeWeight(2);
   line(99,289,90,476);
   line(147,327,134,466);
   line(198,333,198,463);
   line(247,331,262,475);
   line(294,288,311,470);
}
 void catcher(){
   strokeWeight(2);
   noFill();
   translate(width/2-441, height/2-170);   
   for (int i = 0; i < 360; i+=30) {
    pushMatrix();
    translate(0, 0);
    rotate(radians(i));
    beginShape();    
   for (float q = 0; q <= 9; q+=0.5) {
      float l = (sin(radians(q*10+frameCount))*(7+sin(radians(q*7))*(q*3)));
      vertex(sin(radians(0))*(10+q*s)+l, (10+q*s)+7);
    }    
   for (float q = 9; q >= 0; q-=0.5) {
      float l = (sin(radians(q*10+frameCount))*(7+sin(radians(q*7))*(q*3)));
      vertex(sin(radians(0))*(10+q*s)-l, (10+q*s)+7);
    }
    endShape(CLOSE);
    popMatrix();
  }  
 }
 void both2(){
  myPort.write('2');
  noStroke();
  for (int i=0; i<ghost; i++) {
    posX[i] += velX[i];
    posY[i] += velY[i];
  fill(random(192,255));
  ellipse(posX[i], posY[i], diameter[i], diameter[i]-10);
  ellipse(posX[i],posY[i]+28,diameter[i],diameter[i]-24);
  ellipse(posX[i]-33,posY[i]+37,diameter[i]-46,diameter[i]-51);
  ellipse(posX[i]-50,posY[i]+40,diameter[i]-48,diameter[i]-54);
  /////eyes
  fill(0);
  ellipse(posX[i]-13,posY[i],diameter[i]/11,diameter[i]-61);
  ellipse(posX[i]+11,posY[i],diameter[i]/11,diameter[i]-61);
  ellipse(posX[i]-1,posY[i]+25,diameter[i]-49,diameter[i]-74);
  if (posX[i]<0+diameter[i]/2 || posX[i]>width-diameter[i]/2) {
      velX[i] = -velX[i];
    }
    if (posY[i]<0+diameter[i]/2 || posY[i]>height-diameter[i]/2) {
      velY[i] = -velY[i];
    }  
  }  
}
void turn(){
  strokeWeight(10);
  stroke(-1);
  translate(width>>1, height>>1);
  for (int i=0; i<N; i++) {
    float ang = 360/N;
    float l = r*sin(radians(ang/2));
    float x = r*cos(radians(ang*i));
    float y = r*sin(radians(ang*i));
    pushMatrix();
    translate(x, y);
    rotate(PI/2+radians(ang*i+k));
    line(- l, 0, l, 0);
    popMatrix();
  }
  k=180*sin(radians(t));
  if (t<90) t+=2;
  else t=0;
}
void quit(){
  fill(random(255),random(255),random(255));
  textSize(25);
  text("Set up your dream",1140,733);     
}
void logo(){
  imageMode(CORNER);
   up= loadImage("up.png");
   image(up,63,610,45,29); 
   down= loadImage("down.png");
   image(down,129,612,40,25); 
   left= loadImage("right.png");
   image(left,252,604,22,35); 
   right= loadImage("left.png");
   image(right,310,604,22,35); 
}
void end(){
 noStroke();      
  for (x5 = 0; x5 < width+1; x5=x5+40){
  for(y5 = 0; y5 < height+1; y5=y5+40){
if(ar1==3){
  colorMode(RGB);
  fill(255,random(10,200),random(5,260),random(255));  
    ellipse(x5,y5,40,40);
    }
else if (ar1==2){
  colorMode(HSB);
  fill(150,360,random(150,260),random(20,255)); 
  ellipse(x5,y5,40,40);
}
else if (ar1==1){
  colorMode(RGB);
  fill(150,360,random(150,260),random(20,255)); 
  ellipse(x5,y5,40,40);
}
}
//for end   
  }  
// void end   
} 