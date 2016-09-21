// cat game
float a;
int b;
float x;
float y;
float easing = 0.05;
int num = 60;
float mx[] = new float[num];
float my[] = new float[num];
void setup(){
  size(1080,720);
  
}
void draw(){
  background(b);
  scale(a);
  stroke(255);
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing; 
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  fill(x,0,y);
triangle(x,y,x-120,y-120,x-120,y+120);
triangle(x,y,x+120,y-120,x+120,y+120);
noFill();
fill(y,55,x);
quad(x,y,x-120,y+120,x,y+240,x+120,y+120);
noFill();
fill(mouseX,100,mouseY);
triangle(x+60,y+200,x-40,y+300,x+60,y+400);
triangle(x+60,y+200,x+220,y+340,x+60,y+580);
fill(x,175,y);
triangle(x-70,y+600,x+220,y+340,x+220,y+600);
noFill();
fill(mouseY,200,mouseX);
quad(x+220,y+600,x+340,y+600,x+430,y+510,x+310,y+510);
noFill();
fill (255);


 int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
  
  for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    ellipse(mx[index]+430, my[index]+520, i, i);
  }
noFill();
}
void mousePressed() {
  if (mouseButton == LEFT) {
    a=random(0.1,0.4);
     } 
     else if (mouseButton == RIGHT) {
    a=random(0.5,1);
  } else {
    a=1;
  }
}
  void keyPressed() {
  if (b == 0) {
    b =255;
  } else {
    b = 212;
  }
}