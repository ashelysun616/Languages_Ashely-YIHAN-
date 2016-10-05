String state= "pregame"; 
PImage imgbg;
PImage img1;
PImage img2;
PImage img3;
PImage imgt3;
PImage imgt4;
PImage imgt5;
PImage imgh1;
PImage imgh2;
PImage imgh3;
PImage imgh4;
int a;
int y1,y2;
int yh1,yh2,yh3,yh4;
//random ending
int maxImages = 6; 
int imageIndex = 0; 
boolean isPlaying = false;
PImage[] images = new PImage[maxImages];

void setup() {
  size(1280, 720);
  background(0);
  colorMode(RGB);  
  a = 0;
  for (int i = 0; i < images.length; i ++ ) {
  images[i] = loadImage( "story" + i + ".jpg" );
}
}


void draw() {
  textSize(50);
  textAlign(CENTER);
      background(255);
  
 //imgbg = loadImage("bg.jpg");
 // image(imgbg,0,0,1280,720); 
  
  if (state== "pregame") {
    background(0);
    text("Do you want to be a super hero?", width/2, height/2);
    textSize(20);
    textAlign(CENTER);
    text("Click to continue", 1100, 650);   
  } 
  ///
  else if (state=="game1") {
    textSize(20);
    textAlign(CENTER);
    fill(255,235,205);
    rect(0,620,1280,100);
    noFill();
    fill(192);
    text("click pillow", width/2, height/2+50);
    noFill();
    img1 = loadImage("2.png");
    image(img1,490,460,300,300); 
     a++;
     noStroke();
     fill(random(500),50,100);
     ellipse(width/2, height/2, 50*sin(a), 50*sin(a));
     noFill();
     img2 = loadImage("t1.jpg");
     image(img2,250,y1,100,50); 
     img3 = loadImage("t2.jpg");
     image(img3,950,y2,300,150); 
     y1+=1;
     y2+=2;
     if (y1>520) {
     y1=0;
      }
     if (y2>520) {
     y2=0;
     }
  } 
  ////
   else if (state=="game2") {
    textSize(30);
    textAlign(CENTER);
    //fill(255,235,205);
    //rect(0,620,1280,100);
    //noFill();
    fill(250,240,230);
    rect(0,0,320,620);
    noFill();
    fill(240,255,255);
    rect(320,0,320,620);
    noFill();
   fill(245);
    rect(640,0,320,620);
    noFill();
    fill(240,255,240);
    rect(960,0,320,620);
    noFill();
    image(img1,500,480,250,250); 
    fill(0);
    textSize(40);
    textAlign(CENTER);
    text("Congratulation!! You can choose one hero you like", width/2, 90);
    imgh1 = loadImage("h3.png");
    image(imgh1,70,yh1,200,200); 
    imgh2 = loadImage("h2.png");
    image(imgh2,400,yh2,200,200); 
    imgh3 = loadImage("h1.png");
    image(imgh3,700,yh3,200,200); 
    imgh4 = loadImage("h4.png");
    image(imgh4,1050,yh4,200,200); 
     yh1+=15;
     yh2+=23;
     yh3+=18;
     yh4+=20;
     if (yh1>200) {
     yh1=200;
      }
     if (yh2>200) {
     yh2=200;
     }
     if (yh3>200) {
     yh3=200;
      }
     if (yh4>200) {
     yh4=200;
     }

  }
////hero
else if (state=="hero1") {
  fill(250,240,230);
    rect(0,620,1280,100);
    noFill();
    //reset
    fill(255);
    rect(1080,670,200,50);
     noFill();
     //
  image(imgh1,490,460,150,150);
     imgt3 = loadImage("t4.jpg");
     image(imgt3,100,200,300,150); 
     imgt4 = loadImage("t3.jpg");
     image(imgt4,500,200,300,150); 
     imgt5 = loadImage("t5.jpg");
     image(imgt5,900,200,300,150); 
    textSize(30);
    fill(0);
    text("Reset", 1190,710);
    text("Choose your scense", 100,80);
   
    noFill();
  }
  else if (state=="hero2") {
     fill(250,240,230);
    //rect(0,0,320,620);
    rect(0,620,1280,100);
    noFill();
     fill(255);
    rect(1080,670,200,50);
     noFill();
    image(imgh2,490,460,150,150);
     imgt3 = loadImage("t3.jpg");
     image(imgt3,100,200,300,150); 
     imgt4 = loadImage("t4.jpg");
     image(imgt4,500,200,300,150); 
     imgt5 = loadImage("t5.jpg");
     image(imgt5,900,200,300,150); 
        fill(0);
    text("Reset", 1190,710);
    text("Choose your scense", 100,80);
  }
   else if (state=="hero3") {
     fill(250,240,230);
    //rect(0,0,320,620);
    rect(0,620,1280,100);
    noFill();
     fill(255);
    rect(1080,670,200,50);
     noFill();
    image(imgh3,490,460,150,150);
     imgt3 = loadImage("t3.jpg");
     image(imgt3,100,200,300,150); 
     imgt4 = loadImage("t4.jpg");
     image(imgt4,500,200,300,150); 
     imgt5 = loadImage("t5.jpg");
     image(imgt5,900,200,300,150); 
        fill(0);
    text("Reset", 1190,710);
    text("Choose your scense", 100,80);
  }
     else if (state=="hero4") {
     fill(250,240,230);
    //rect(0,0,320,620);
     rect(0,620,1280,100);
     noFill();
      fill(255);
    rect(1080,670,200,50);
     noFill();
     image(imgh4,490,460,150,150);
     imgt3 = loadImage("t3.jpg");
     image(imgt3,100,200,300,150); 
     imgt4 = loadImage("t4.jpg");
     image(imgt4,500,200,300,150); 
     imgt5 = loadImage("t5.jpg");
     image(imgt5,900,200,300,150); 
        fill(0);
    text("Reset", 1190,710);
    text("Choose your scense", 100,80);
  }

  //trick
  else if (state=="trick1") {
    background(255);
    textSize(50);
    textAlign(CENTER);
    text("Good choice", width/2, height/2);
  }
  else if (state=="trick2") {
    background(255);
    textSize(50);
    textAlign(CENTER);
    text("Please try again,he is in the bathroom ", width/2, height/2);
  }
  /////scence
   else if (state=="S1") {
    background(255);
    textSize(20);
    textAlign(CENTER);
    text("Pickup line",100,100);
     fill(255);
    rect(1080,670,200,50);
     noFill();
        fill(0);
    text("Reset", 1190,710);
    image(images[imageIndex],20,0);
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
   else if (state=="S2") {
    background(255);
    textSize(20);
    textAlign(CENTER);
    text("Saving world",100,100);
  }
  else if (state=="S3") {
    background(255);
    textSize(20);
    textAlign(CENTER);
    text("Skill",100,100);
  }
  /////
  else if (state=="game over") {
    background(255);
    text("everyone loses", width/2, height/2);
  }
  println(state); 
}

void mousePressed() {
  if (state== "pregame") {
    state="game1";
  }
  ////
  else if (state=="game1"){
    state="game2";
  } 
  ////
  else if (state=="game2"){
     if(mouseX <= 320 ){
       state="hero1";
    }
      else if(mouseX > 320 && mouseX<=640){
         state="hero2";
    }
    else if(mouseX > 640 && mouseX<=960){
         state="hero3";
    }
     else if(mouseX > 960){
         state="hero4";
    }
    
  } 
  else if (state=="hero1"){
    if(mouseX > 1080 && mouseY>670){
         state="game2";
    }
    else if(mouseX <420){
         state="S1";
    }
    else if(mouseX>420&&mouseX<840){
         state="S2";
    }
      else if(mouseX>840){
         state="S3";
    }
  } 
   else if (state=="hero2"){
    if(mouseX > 1080 && mouseY>670){
         state="game2";
    }
  } 
  //
    else if (state=="S1"){
    if(mouseX > 1080 && mouseY>670){
         state="game2";
    }
  } 
  else if (state=="game over"){
   state="pregame"; 
  }
}
///random ending
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
